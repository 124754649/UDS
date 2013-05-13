var generalShortModel = Backbone.Model.extend({
});

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
    model: generalShortModel,
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

var udsSMS = Backbone.Collection.extend({
    model: generalShortModel,
    baseUrl: "",
    url: function () {
        return this.baseUrl + '?result=sms';
    },
    initialize: function (options) {
        this.baseUrl = options.baseUrl;
    }
});

var udsShortView = Backbone.View.extend({
    targetUrl: "",
    timerHandler: null,
    iClass: "",
    numberTitle: "",
    moreTitle: "",
    columns:[],
    template: _.template([
        //'<li class="grey">',
            '<a href="#" class="dropdown-toggle" data-toggle="dropdown">',
                '<i class="<%= iClass %>"></i>',
                '<span class="badge badge-important"><%= items.length %></span>',
            '</a>',
            '<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">',
                '<li class="nav-header">',
                    '<i class="icon-ok"></i> <%= items.length %> <%= numberTitle %>',
                '</li>',
            '<% _.each(items, function(item, index){ %>',
                '<li>',
                    '<a href="#">',
                        '<div class="clearfix">',
                            '<% _.each(columns, function(c, index) { %>',
                                '<% if(0 == index) { %>',
                            '<span class="pull-left"><%= getProp(item, c) %></span>',
                                '<% } else { %>',
                            '<span class="pull-right"><%= getProp(item, c) %></span>',
                                '<% } %>',
                            '<% }) %>',
                        '</div>',
                        //'<div class="progress progress-mini"><div class="bar" style="width:65%"></div></div>',
                    '</a>',
                '</li>',
            '<% }) %>',
                '<li>',
                    '<a href=\'<%= targetUrl %>\'>',
                        '<%= moreTitle %>',
                        '<i class="icon-arrow-right"></i>',
                    '</a>',
                '</li>'
        //'</li>'
    ].join('')),
    initialize: function (options) {
        this.targetUrl = options.targetUrl;
        this.iClass = options.iClass;
        this.numberTitle = options.numberTitle;
        this.moreTitle = options.moreTitle;
        this.columns = options.columns;

        _.bind(this.refreshView, this);
        this.model.bind("reset", this.render, this);
    },
    render: function () {      
        this.refreshView();

        return this;
    },
    refreshView: function () {
        var context = this;

        this.model.fetch({
            success: function (data) {
                context.$el.html(context.template({
                    items: context.model.toJSON(),
                    targetUrl: context.targetUrl,
                    iClass: context.iClass,
                    numberTitle: context.numberTitle,
                    moreTitle: context.moreTitle,
                    columns: context.columns,
                    getProp: context.getProperty
                }));

                setTimeout(context.refreshView.bind(context), 5000);
            }
        });
    },
    getProperty: function (data, propname) {
        for (var p in data) {
            if (p == propname) {
                return data[p];
            }
        }

        return undefined;
    },
});