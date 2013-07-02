var records = Backbone.Model.extend({
    defaults: {
        page: 1,
        rows: 1,
        totalRows: 0,
        pages: 1,
        orderby: "",
        order: "desc",
        fields: [],
        values: [],
        target: null,
        records: null
    },
    initialize: function (options) {
        this.set("records", options.records);
        this.set("rows", options.rows);
        this.set("orderby", options.orderby);
        this.set("order", options.order);
        this.set("target", options.records);
    },
    url: function () {
        var startIndex = (this.get("page") - 1) * this.get("rows") + 1;
        var urlRoot = "";
        if ($.isFunction(this.get("target").url))
            urlRoot = this.get("target").url();
        else
            urlRoot = this.get("target").url;

        var queryData = { fields: this.get("fields"), values: this.get("values") };

        var queryParam = encodeURIComponent(JSON.stringify(queryData));

        return urlRoot +
            "&startIndex=" + startIndex +
            "&rows=" + this.get("rows") +
            "&orderby=" + this.get("orderby") +
            "&order=" + this.get("order") +
            "&qs=" + queryParam;
    },
    pageInfo: function () {
        return {
            page: this.get("page"),
            rows: this.get("rows"),
            totalRows: this.get("totalRows"),
            pages: this.get("pages"),
            orderby: this.get("orderby"),
            order: this.get("order"),
            fields: this.get("fields"),
            values: this.get("values"),
            value: function (field) {
                var context = this;
                var retValue = "";
                _.each(this.fields, function (f, index) {
                    if (f == field) {
                        retValue = context.values[index];
                        return;
                    }
                });

                return retValue;
            }
        };
    }
});