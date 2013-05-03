var breadcrumbModel = Backbone.Model.extend({
    default: {
        group: "",
        url: "",
        title: ""
    },
    initialize: function (g, u, t) {
        this.set("group", g);
        this.set("url", u);
        this.set("title", t);
    },
    Group: function (g) {
        if (arguments[0]) {
            this.set("group", g);
        }
        else {
            return this.get("group");
        }
    },
    Url: function (u) {
        if (arguments[0]) {
            this.set("url", u);
        }
        else {
            return this.get("url");
        }
    },
    Title: function(t){
        if (arguments[0]) {
            this.set("title", t);
        }
        else {
            return this.get("title");
        }
    }
});

var breadcrumbCollection = Backbone.Collection.extend({
    model: breadcrumbModel,
    addBreadcrumb: function (item) {
        if (0 == this.models.length) {
            this.add(item);
        }
        else {
            var lastItem = _.last(this.models);
            if (lastItem.Title() == item.Title() && lastItem.Group() == item.Group() && lastItem.Url() == item.Url())
                return;
            if (1 == this.models.length)
                this.add(item);
            else {
                if (lastItem.Group() == item.Group()) {
                    this.add(item);
                }
                else {
                    this.remove(lastItem);
                    this.add(item);
                }
            }
        }
    }
});

var breadcrumbView = Backbone.View.extend({
    template: _.template([
        "<% _.each(breadcrumbItems, function(item, index){ %>",
            "<% if(0 == index) { %>",
                "<li><i class='icon-home'></i>",
                "<% if(index != breadcrumbItems.length - 1) { %>",
                    "<a href='javascript:navigatemf(\"<%= item.title %>\", \"<%= item.url %>\", \"<%= item.group %>\")'><%= item.title %></a><span class='divider'><i class='icon-angle-right'></i></span>",
                "<% } else { %>",
                    "<%= item.title %></li>",
                "<% } %>",
            "<% } else { %>",
                "<% if(index != breadcrumbItems.length - 1) { %>",
                    "<a href='javascript:navigatemf(\"<%= item.title %>\", \"<%= item.url %>\", \"<%= item.group %>\")'><%= item.title %></a><span class='divider'><i class='icon-angle-right'></i></span>",
                "<% } else { %>",
                    "<%= item.title %></li>",
                "<% } %>",
            "<% } %>",
        "<% }) %>"
    ].join('')),
    initialize: function (options) {
        this.model.bind("add", this.render, this);
    },
    render: function () {
        this.$el.html(this.template({
                breadcrumbItems: this.model.toJSON()
            }
        ));
        return this;
    }
});