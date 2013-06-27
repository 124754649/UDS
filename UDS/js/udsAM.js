var udsAMModel = Backbone.Model.extend({
    defaults: {
        id: -1,
        name: '',
        code: '',
        specification: '',
        number: 0,
        totalPrice: 0.0,
        taxRate: 0.0,
        location: '',
        startUsingTime: '',
        buyingTime: '',
        status: 0,
        usingMan: '',
        remark: ''
    }
});

var udsAMCollection = Backbone.Collection.extend({
    model: udsAMModel,
    queryData: null,
    queryUrl: '',
    initialize: function(options){
        if (null == arguments[0] || null == options.queryUrl) {
            alert("初始化udsAM必须指定查询地址");
        }
        else {
            $.extend(this, options);
        }
    },
    url: function () {
        if (null == this.queryData) {
            this.queryData = { fields: [], values: [] };
        }

        var qsdata = encodeURIComponent(JSON.stringify(this.queryData));

        return this.queryUrl + "?m=q&qs=" + qsdata;
    }
});

var udsAMRowView = Backbone.View.extend({
    editorDlg: null,
    template:_.template([
        //'<tr data-id="<%= data.id %>">',
            '<td><%= data.name %></td>',
            '<td><%= data.code %></td>',
            '<td><%= data.specification %></td>',
            '<td><%= data.number %></td>',
            '<td><%= data.totalprice %></td>',
            '<td><%= data.taxrate %></td>',
            '<td><%= data.location %></td>',
            '<td><%= data.startusingtime %></td>',
            '<td><%= data.buyingtime %></td>',
            '<% _.each(["使用", "停用", "待修", "报废"], function(s,index){ %>',
                '<% if(index == data.status) { %>',
                    '<td><%= s %></td>',
                '<% } %>',
            '<% }) %>',
            '<td><%= data.usingman %></td>',
            '<td><%= data.remark %></td>',
            '<td>',
                '<div class="btn-toolbar">',
                    '<div class="btn-group">',
                        '<button class="btn btn-mini editBtn"><i class="icon-edit"></i></button>',
                        '<button class="btn btn-mini removeBtn"><i class="icon-remove"></i></button>',
                    '</div>',
                '</div>',
            '</td>'
        //'</tr>'
    ].join('')),
    tagName: "tr",
    events:{
        'click button.editBtn': 'editAM'
    },
    initialize: function (options) {
        $.extend(this, options);
    },
    render: function () {
        this.$el.html(this.template({
            data: this.model
        }));

        $(this.el).attr("data-id", this.model.id);

        return this;
    },
    editAM: function (evt) {
        if (null != this.editorDlg) {
            this.editorDlg.showAM(this.model);
        }
    }
});

var udsAMTableView = Backbone.View.extend({
    templateUri: '',
    queryUrl: '',
    template: null,
    records: null,
    amList: null,
    editorDlg: null,
    initialize: function (options) {
        if (null == options || null == options.templateUri) {
            alert("初始化udsAMTableView必须指定templateUri");
        }
        else {
            $.extend(this, options);
        }

        this.amList = new udsAMCollection({
            queryUrl: this.queryUrl
        });

        this.records = new records({
            records: this.amList,
            target: this.amList,
            orderby: "",
            order: "desc",
            rows: 10
        });
    },
    render: function () {
        var context = this;

        $.ajax({
            url: this.templateUri,
            type: "get",
            dataType: "text",
            cache: false,
            global: false,

            success: function (contents) {
                context.template = _.template(contents);
                $(context.el).html(context.template({
                    //ams: context.model.get("records")
                }));

                context.records.fetch({
                    success: function (datas) {
                        _.each(datas.get("records"), function (data, index) {
                            var row = new udsAMRowView({
                                model: data,
                                editorDlg: context.editorDlg
                            });
                            $("#assetlist").append(row.render().el);
                        });
                    }
                });
            }
        });
    }
});

var udsAMEditView = Backbone.View.extend({
    template: null,
    templateUri: '',
    initialize: function (options) {
        if (null == arguments[0] || null == options.templateUri) {
            alert("初始化udsAMEditView必须指定templateUri");
        }

        $.extend(this, options);

        if (null == this.model) {
            this.model = new udsAMModel();
        }

        this.model.bind('change', this.render, this);

        _.bind(this.showAM, this);

        $(this.el).dialog({
            autoOpen: false,
            modal: true
        });
    },
    render: function () {
        var context = this;
        if (null == this.template) {
            $.ajax({
                url: this.templateUri,
                type: "get",
                dataType: "text",
                cache: false,
                global: false,
                async: false,
                success: function (contents) {
                    context.template = _.template(contents);
                }
            });
        }

        $(this.el).html(this.template({
            data: this.model
        }));

        $(this.el).dialog("open");
    },
    showAM: function (data) {
        this.model = data;
        this.render();
    }
});