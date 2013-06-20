var bulletinListView = Backbone.View.extend({
    templateUri: '/App_ViewTemplate/bulletin_template.html',
    template: null,
    events:{
        "click span#viewMore": "showMoreInfo"
    },
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
    },
    showMoreInfo: function () {
        
    }
});

var bulletinModel = Backbone.Model.extend({
});

var bulletinCollection = Backbone.Collection.extend({
    model: bulletinModel,
    type: 1,
    url: function () {
        return '/SubModule/bulletin/bulletinAction.aspx?type=' + this.type;
    }
});

var bulletinItemModel = Backbone.Model.extend({
    defaults: {
        bulletinid: -1,
        subject: '',
        sendtime: '',
        attaches: []
    },
    url: function () {
        return '/SubModule/bulleting/bulletinAction.aspx?type=4&id=' + this.get('bulletinid');
    }
});

var bulletinItemView = Backbone.View.extend({
    templateUri: '/App_ViewTemplate/bulletin_item.html',
    template: uri,
    bulletinid: -1,
    initialize: function () {

    }
});