var commonView = Backbone.View.extend({
    dataUrl: '',
    templateUrl: '',
    template: null,
    initialize: function (options) {
        $.extend(this, options);
    },
    render: function () {
        var context = this;
        if ('' != this.dataUrl && '' != this.templateUrl) {
            $.ajax({
                url: this.dataUrl,
                type: 'get',
                dataType: 'json',
                cache: false,
                global: false,

                success: function (datas) {
                    $.ajax({
                        url: context.templateUrl,
                        type: 'get',
                        dataType: 'text',
                        cache: false,
                        global: false,

                        success: function (contents) {
                            context.template = _.template(contents);
                            $(context.el).html(context.template({
                                data: $.isFunction(datas.toJSON) ? datas.toJSON() : datas
                            }));
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert(jqXHR.responseText);
                        }
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }
    }
});