<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<div class="pad10L pad10R">
    <div class="example-box">
        <a href="javascript:;" class="btn small hover-black float-right back-page" title="" style="margin-top: -0px;margin-right: 30px">
            <i class="glyph-icon icon-reply"></i>
        </a>
        <div class="col-md-6 pad10T">
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                    <@s.text name="article.title"/>：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                    <@s.textfield name="title" id="title" value="%{art.title}" disabled="true"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                    <@s.text name="article.summary"/>：
                    </label>
                </div>
                <div class="form-input col-md-10">
                    <div class="append-left">
                    <@s.textfield name="summary" id="summary" value="%{art.summary}" disabled="true"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 form-vertical">
            <div class="form-row">
                <div class="form-label col-md-2"></div>
                <div class="form-input col-md-10" id="imageUploader">
                <@s.img src="%{art.logo.absolutePath}" ratio="160x160" cssClass="img-thumbnail"/>
                </div>
            </div>
        </div>
    </div>
</div>