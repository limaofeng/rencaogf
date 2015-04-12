<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<div class="pad10L pad10R">
    <div class="example-box">
        <a href="javascript:;" class="btn small hover-black float-right back-page" title="" style="margin-top: -0px;margin-right: 30px">
            <i class="glyph-icon icon-reply"></i>
        </a>
        <div class="col-md-6 pad10T">
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                    姓名：
                    </label>
                </div>
                <div class="form-input col-md-8">
                    <div class="append-left">
                    <@s.property value="%{root.name}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                    电话：
                    </label>
                </div>
                <div class="form-input col-md-8">
                    <div class="append-left">
                    <@s.property value="%{root.phone}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                    量房时间：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                        <@s.property value="%{root.amountTime}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                        装修面积：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                    <@s.property value="%{root.housingArea}"/>㎡
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                        装修时间：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                    <@s.property value="%{root.ateTime}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                    房型：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                    <@s.property value="%{root.housingType}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                        装修预算：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                    <@s.property value="%{root.decorateBudget}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                        装修类型：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                    <@s.property value="%{root.decorateType}"/>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-3">
                    <label for="">
                    楼盘名称：
                    </label>
                </div>
                <div class="form-input col-md-8 ">
                    <div class="append-left">
                        <@s.property value="%{root.address}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-label col-md-3">
                <label for="">
                </label>
            </div>
            <div class="form-input col-md-8">
            <@s.textarea cssClass="ckeditor" name="description" cssStyle="width:900px;height:360px;"  value="%{root.description}" disabled="true"/>
            </div>
        </div>
    </div>
</div>