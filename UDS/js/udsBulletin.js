var bulletinListView = Backbone.View.extend({
    templateUri: '/App_ViewTemplate/bulletin_template.html',
    template: null,
    initialize: function (options) {
        if(null != arguments[0])
            $.extend(this, arguments[0]);
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
                    bulletins: context.model.get("records")
                }));
            }
        });
    }
});

var bulletinModel = Backbone.Model.extend({
});

var bulletinCollection = Backbone.Collection.extend({
    model: bulletinModel,
    type: 1,
    url: function () {
        return 'bulletinAction.aspx?type=' + this.type;
    }
});