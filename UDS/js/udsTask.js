var udsTaskModel = Backbone.Model.extend({
    defaults: {
        "id": "",
        "subject": "",
        "beginPeriodID": 0,
        "endPeriodID": 0,
        "endTime": "",
        "period": ""
    }
});

var udsTasks = Backbone.Collection.extend({
    model: udsTaskModel,
    user: "",
    type: "",
    baseUrl: "",
    url: function () {
        return this.baseUrl + '?result=task&type=' + this.type;
    },
    initialize: function (options) {
        this.type = options.type;
        this.baseUrl = options.baseUrl;
    }
});

var udsShortView = Backbone.View.extend({
    targetUrl: "",
    template: _.template([
        //'<li class="grey">',
            '<a href="#" class="dropdown-toggle" data-toggle="dropdown">',
                '<i class="icon-tasks"></i>',
                '<span class="badge"><%= items.length %></span>',
            '</a>',
            '<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">',
                '<li class="nav-header">',
                    '<i class="icon-ok"></i> <%= items.length %> 个任务需要完成',
                '</li>',
            '<% _.each(items, function(item, index){ %>',
                '<li>',
                    '<a href="#">',
                        '<div class="clearfix">',
                            '<span class="pull-left"><%= item.subject %></span>',
                            '<span class="pull-right"><%= item.period %></span>',
                        '</div>',
                        //'<div class="progress progress-mini"><div class="bar" style="width:65%"></div></div>',
                    '</a>',
                '</li>',
            '<% }) %>',
                '<li>',
                    '<a href="<%= targetUrl %>">',
                        '查看更多任务',
                        '<i class="icon-arrow-right"></i>',
                    '</a>',
                '</li>'
        //'</li>'
    ].join('')),
    initialize: function (options) {
        this.targetUrl = options.targetUrl;
    },
    render: function () {
        var context = this;
        this.model.fetch({
            success: function(data){
                context.$el.html(context.template({
                    items: context.model.toJSON(),
                    targetUrl: context.targetUrl
                }));
            }
        });
        return this;
    }
});