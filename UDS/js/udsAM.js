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

        return this.queryUrl + "?m=q";
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
            this.editorDlg.showAM(this.model, this);
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
    events:{
        "click th[data-orderfield]": "orderList",
        "click a[data-command='page'][data-page]": "pageChanged",
        "click button.btnSearch": "search"
    },
    orderList: function (evt) {
        var c = $(evt.target);

        if (c.data("orderfield") != this.records.get("orderby")) {
            $('th[data-orderfield="' + this.records.get("orderby") + '"] i').remove();

            this.records.set("order", "asc", { silence: true });
            this.records.set("orderby", c.data("orderfield"));
        }
        else {
            if (this.records.get("order") == "asc") {
                this.records.set("order", "desc");
            }
        }
    },
    pageChanged: function(evt){
        var c = $(evt.target);

        this.records.set("page", c.data("page"));
    },
    search: function (evt) {
        var fields = [];
        var values = [];

        var aindex = 0;
        $.each($("[data-searchfield]"), function (index, ctrl) {
            if ("INPUT" == $(ctrl)[0].tagName) {
                if ($(ctrl).val()) {
                    fields[aindex] = $(ctrl).data("searchfield");
                    values[aindex] = $(ctrl).val();
                    aindex += 1;
                }
            }
            else if ("SELECT" == $(ctrl)[0].tagName) {
                fields[aindex] = $(ctrl).data("searchfield");
                values[aindex] = $(ctrl).val();
                aindex += 1;
            }
        });

        this.records.set("fields", fields);
        this.records.set("values", values);
    },
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
            orderby: "status",
            order: "asc",
            rows: 1
        });

        this.records.bind("change:order", this.render, this);
        this.records.bind("change:orderby", this.render, this);
        this.records.bind("change:page", this.render, this);
        this.records.bind("change:values", this.render, this);
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

                context.records.fetch({
                    success: function (datas) {
                        $(context.el).html(context.template({
                            pageInfo: context.records.pageInfo()
                        }));

                        $.each($("th[data-orderfield]"), function (index, c) {
                            if ($(c).data("orderfield") == context.records.get("orderby")) {
                                if ("desc" == context.records.get("order")) {
                                    $(c).append('<i class="icon-sort-down pull-right"></i>');
                                }
                                else {
                                    $(c).append('<i class="icon-sort-up pull-right"></i>');
                                }
                            }
                            $(c).attr("style", "cursor:pointer");
                        });

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
    editUri: '',
    rowView: null,
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
        _.bind(this.save, this);

        var context = this;

        $(this.el).dialog({
            autoOpen: false,
            modal: true,
            width: 470,
            buttons: {
                "保存": function () {
                    context.save();
                },
                "取消": function () {
                    $(context.el).dialog("close");
                }
            }
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

        $("input[data-type='datetime']").datepicker({
            changeMonth: true,
            changeYear: true
        });

        $(this.el).dialog("open");
    },
    showAM: function (data, rowView) {
        this.model = data;
        this.rowView = rowView;
        this.render();
    },
    save: function () {
        var context = this;
        var saveTarget = new Object();

        $.each($("[data-field]"), function (index, c) {
            //context.model[$(c).data("field")] = $(c).val();
            saveTarget[$(c).data("field")] = $(c).val();
        });

        //if (-1 == this.model.get("id")) {
            saveTarget["id"] = -1;

            $.ajax({
                url: this.editUri,
                type: "post",
                dataType: "text",
                cache: false,
                global: false,
                data: { m: "s", target: JSON.stringify(saveTarget) },
                success: function (contents) {
                    console.log(contents);
                }
            });
        //}

        //this.rowView.render();
        console.log(saveTarget);
    }
});