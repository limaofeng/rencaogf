<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<@override name="pageTitle">
    <@s.property value="%{pageTitle}"/>
<small>
    <@s.text name="cms.article.small"/>
</small>
</@override>
<@override name="head">
<script type="text/javascript">
    $(function(){
        //当浏览器窗口发生变化时,自动调整布局的js代码
        var _$gridPanel = $('.grid-panel');
        var _resize = function () {
            _$gridPanel.css('minHeight', $(window).height() - (_$gridPanel.offset().top + 15));
            _$gridPanel.triggerHandler('resize');
        };
        $(window).resize(_resize);
        $page$.one('destroy',function(){
            $(window).unbind('resize',_resize);
        });
        window.categoryTree = {
            getSelectedNodes:function(){
                return [<@s.property value="@com.fantasy.framework.util.jackson.JSON@serialize(category)" escapeHtml="false"/>];
            }
        }
    });
</script>
</@override>
<@override name="pageContent">
<div class="grid-panel">
    <@s.set name="index_path" value="%{@com.fantasy.cms.service.CmsService@getTemplatePath(\"/template/" + pageTheme + "/cms/article_index{code}.ftl\",category)}"/>
    <#include "${index_path}">
</div>
</@override>
<@extends name="../wrapper.ftl"/>