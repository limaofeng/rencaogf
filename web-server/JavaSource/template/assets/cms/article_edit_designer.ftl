<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<script type="text/javascript">
    $(function () {
        var avatar = <@s.property value="@com.fantasy.framework.util.jackson.JSON@serialize(art.avatar)" escapeHtml="false" default="{}"/>;
        var imageUploader = $('#imageUploader').upload({data:{'dir':'cms_image'},theme:'image',size:'160x160'},avatar);
        $("#saveForm").ajaxForm({
            beforeSerialize : function(zhis, options){
                var _data = {};
                var _images = imageUploader.getData();
                if(_images.length > 0){
                    _data['avatar'] = _images[0].fileManagerId + ':' + _images[0].absolutePath;
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
        <@s.hidden name="category.code" value="%{art.category.code}"/>
        <@s.hidden name="id" value="%{art.id}"/>
        <@s.hidden  name="version.number" value="designer"/>
        <div class="col-md-6 pad10T">
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        名称：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                        <@s.textfield name="title" id="title" value="%{art.title}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        职位：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                        <@s.textfield name="summary" id="summary" value="%{art.summary}"/>
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
        <div class="form-row">
            <div class="form-label col-md-2">
                <label for="">
                    设计师简介
                </label>
            </div>
            <div class="form-input col-md-10">
                <@s.textarea cssClass="ckeditor" name="content" cssStyle="width:900px;height:360px;"  value="%{art.content.text}"/>
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
