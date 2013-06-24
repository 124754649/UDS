var bulletinListView = Backbone.View.extend({
    templateUri: '',
    template: null,
    itemDialog: null,
    selectedItem: null,
    itemView: null,
    events:{
        "click span#viewMore": "showMoreInfo"
    },
    initialize: function (options) {
        if (null == arguments[0])
            alert("初始化公告列表，必须指定初始化参数");
        else if (null == options.templateUri)
            alert("初始化公告列表，必须指定模板Uri");
        else
            $.extend(this, options);
    },
    render: function () {
        if ('' == this.templateUri || null == this.templateUri) {
            alert("没有指定公告列表的模板地址");
        }
        else {
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

            if (null != this.itemDialog) {
                this.itemDialog.dialog({
                    autoOpen: false,
                    modal: true
                });
            }
        }
    },
    showMoreInfo: function (evt) {
        var target = $(evt.target).parent();
        
        if (null != this.selectedItem) {
            if (null != this.itemView) {
                this.itemView.model = this.selectedItem;
                this.itemView.el = this.itemDialog;
                this.itemView.itemDialog = this.itemDialog;
                this.itemView.showBulletin(target.data("id"));
            }
        }
    },
    deleteSelected: function () {
        var checkedBoxs = $(":checkbox:checked");

        var ids = new Array();

        checkedBoxs.each(function (index, c) {
            ids[index] = $(c).data("id");
        });
    }
});

var bulletinModel = Backbone.Model.extend({
});

var bulletinCollection = Backbone.Collection.extend({
    model: bulletinModel,
    type: 1,
    urlRoot: '',
    initialize: function (options) {
        if(null == arguments[0] || null == options.urlRoot)
        {
            alert("初始化公告集合，必须指定urlRoot");
        }
        else
        {
            $.extend(this, options);
        }
    },
    url: function () {
        if (null == this.urlRoot || '' == this.urlRoot) {
            alert("获取公告集合出错，未知的请求地址。");
            return "#";
        }
        else {
            return this.urlRoot + '?type=' + this.type;
        }
    }
});

var bulletinItemModel = Backbone.Model.extend({
    defaults: {
        bulletinid: -1,
        subject: '',
        sendtime: '',
        attaches: []
    },
    urlRoot: '',
    initialize: function(options){
        if (null == arguments[0] || null == options.urlRoot) {
            alert("初始化公告项，必须指定urlRoot");
        }
        else {
            $.extend(this, options);
        }
    },
    url: function () {
        if (null == this.urlRoot || '' == this.urlRoot) {
            alert("获取公告项出错，未知的请求地址。");
            return "#";
        }
        else {
            return this.urlRoot + '?type=4&id=' + this.get('bulletinid');
        }
    }
});

var bulletinItemView = Backbone.View.extend({
    templateUri: '',
    updateUri: '',
    downloadUri:'',
    template: null,
    itemDialog: null,
    events:{
        "click a.downloadnode": "doDownload"
    },
    initialize: function (options) {
        if (0 == arguments[0] || null == options.templateUri) {
            alert("初始化公告项视图，必须指定模板地址");
        }
        else {
            $.extend(this, options);
        }

        this.model.bind('change:bulletinid', this.render, this);
    },
    render: function () {
        if ('' == this.templateUri || null == this.templateUri) {
        }
        else {
            var context = this;
            this.model.fetch({
                success: function () {
                    $.ajax({
                        url: context.templateUri,
                        type: "get",
                        dataType: "text",
                        cache: false,
                        global: false,

                        success: function (contents) {
                            context.template = _.template(contents);
                            $(context.el).html(context.template({
                                bulletin: context.model.toJSON(),
                                downloaduri: context.downloadUri
                            }));
                            context.itemDialog.dialog("option", "title", context.model.get("subject"));
                            context.itemDialog.dialog("open");
                            $.ajax({
                                url: context.updateUri,
                                type: "POST",
                                dataType: "text",
                                data: "bid=" + context.model.get("bulletinid") + "&m=1",

                                success: function () {
                                    $('tr[data-id="' + context.model.get("bulletinid") + '"]').css("font-weight", "");
                                }
                            });
                        }
                    });
                }
            });
        }
    },
    showBulletin: function (bulletinid) {
        this.model.set("bulletinid", 0, { silent: true });
        this.model.set("bulletinid", bulletinid);
    },
    doDownload: function (evt) {
        var target = $(evt.target);

        $.fileDownload(target.attr('href'), {
            preparingMessageHtml: "正在准备下载文件，请稍候……",
            failMessageHtml: "下载发生错误，请稍候再次尝试"
        });

        return false;
    }
});