var bulletinListView = Backbone.View.extend({
    template: _.template($("#bulletinTableTemplate").html()),
    render: function () {
        var context = this;
        $(this.el).html(this.template({
            bulletins: context.model.get("records")
        }));
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