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
    template:_.template([
        '<tr data-id="<%= id %>">',
            '<td><%= name %></td>',
            '<td><%= code %></td>',
            '<td><%= specification %></td>',
            '<td><%= number %></td>',
            '<td><%= totalprice %></td>',
            '<td><%= taxrate %></td>',
            '<td><%= location %></td>',
            '<td><%= startusingtime %></td>',
            '<td><%= buyingtime %></td>',
            '<% _.each(["使用", "停用", "待修", "报废"], function(s,index){ %>',
                '<% if(index == status) { %>',
                    '<td><%= s %></td>',
                '<% } %>',
            '<% }) %>',
            '<td><%= usingman %></td>',
            '<td><%= remark %></td>',
            '<td>',
                '<div style="cursor:pointer;display:inline" class="editBtn"><i class="icon_edit"></i></div>',
                '<div style="cursor:pointer;display:inline" class="removeBtn"><i class="icon_remove"></i></div>',
            '</td>',
        '</tr>'
    ].join('')),
    initialize: function (options) {
    },
    render: function () {
        this.$el.html(this.template({
            data: this.model.toJSON()
        }));

        return this;
    }
});

var udsAMTableView = Backbone.View.extend({
    templateUri: '',
    queryUrl: '',
    template: null,
    records: null,
    amList: null,
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
                        _.each(datas.get("records"), function (index, data) {
                            var row = new udsAMRowView({
                                model: data
                            });
                            $("#assetlist").append(row.render().el);
                        });
                    }
                });
            }
        });
    }
});