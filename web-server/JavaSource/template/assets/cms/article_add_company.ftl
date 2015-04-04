<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<script type="text/javascript">
    $(function () {
        var imageUploader = $('#imageUploader').upload({data:{'dir':'cms_image'},theme:'image',size:'160x160'});
        $("#saveForm").ajaxForm({
            beforeSerialize : function(zhis, options){
                var _data = {};
                var _images = imageUploader.getData();
                if(_images.length > 0){
                    _data['articleImage'] = _images[0].fileManagerId + ':' + _images[0].absolutePath;
                }
                options.data = _data;
            },
            success: function (data) {
                $('#pager').pager().reload();
                top.$.msgbox({
                    msg: "保存成功",
                    type: "success"
                });
                $page$.backpage();
            }
        });
    });
</script>
<div class="pad10L pad10R">
    <div class="example-box">
    <@s.form id="saveForm" namespace="/cms/article" action="article_save" method="post" cssClass="center-margin">
        <@s.hidden name="category.code" value="%{category.code}"/>
        <@s.hidden  name="version.number" value="%{category.articleVersion.number}"/>
        <div class="col-md-6 pad10T">
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        公司名称：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                        <@s.textfield name="title" id="title"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        公司网址：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                        <@s.textfield name="summary" id="summary" />
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 form-vertical">
            <div class="form-row">
                <div class="form-label col-md-2"></div>
                <div class="form-input col-md-10" id="imageUploader"></div>
            </div>
        </div>
        <div class="form-row" style="text-align: center;">
            <div>
                <div style="float: left;padding-right: 50px;">
                    <a href="javascript:void(0);" class="btn medium primary-bg radius-all-4 menu-save4"  onclick="$('#saveForm').submit();return false;" title="保存"  >
                            <span class="glyph-icon icon-separator">
                                 <i class="glyph-icon icon-save"></i>
                            </span>
                             <span class="button-content">
                                 <@s.text name="operation.save"/>
                             </span>
                    </a>
                </div>
                <div style="float: left;">
                    <a href="javascript:void(0);" class="btn medium primary-bg radius-all-4 switch menu-view back-page "  title="返回" >
                            <span class="glyph-icon icon-separator">
                                  <i class="glyph-icon icon-reply"></i>
                            </span>
                             <span class="button-content">
                                 <@s.text name="operation.back"/>
                             </span>
                    </a>
                </div>
            </div>
        </div>
    </@s.form>
    </div>
</div>