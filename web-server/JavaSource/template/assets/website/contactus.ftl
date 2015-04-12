<#assign s=JspTaglibs["/WEB-INF/tlds/struts-tags.tld"]/>
<@override name="pageTitle">
    线上咨询
<small>
</small>
</@override>
<@override name="head">
<script type="text/javascript">
    $(function(){
        //当浏览器窗口发生变化时,自动调整布局的js代码
        var _$gridPanel = $('.grid-panel'),_resize = function () {
            _$gridPanel.css('minHeight', $(window).height() - (_$gridPanel.offset().top + 15));
            _$gridPanel.triggerHandler('resize');
        };
        $(window).resize(_resize);
        $page$.one('destroy',function(){
            $(window).unbind('resize',_resize);
        });
        var $advsearch = $('.propertyFilter').advsearch({
            filters : [{
                name : 'S_name',
                text : '名称',
                type : 'input',
                matchType :['EQ','LIKE']
            }]
        });
        /**
         ,{
                name : 'S_name',
                text : '测试select',
                type : 'select',
                matchType :['EQ','LIKE'],
                values: [
                    {text: '选项1', value: '1'},
                    {text: '选项2', value: '2'},
                    {text: '选项3', value: '3'}
                ]
            }]
         }
         */
        //列表初始化
        var pager=<@s.property value="@com.fantasy.framework.util.jackson.JSON@serialize(pager)" escapeHtml="false"/>;
        var $grid = $('#view').dataGrid($('#searchFormPanel'),$('.batch'));
        $grid.data('grid').view().on('add',function(data){
            this.target.find('.delete').click(function(e){
                deleteMethod([data.id]);
                return stopDefault(e);
            });
        });
        $grid.setJSON(pager);
        var deleteMethod = $('.batchDelete').batchExecute($("#allChecked"),$grid.data('grid').pager(),'id','是否确认删除[{name}]的数据？',function(){
            $.msgbox({
                msg : "删除成功!",
                type : "success"
            });
        });
    });
</script>
</@override>
<@override name="pageContent">
<div id="searchFormPanel" class="button-panel pad5A">
    <@s.form id="searchForm" namespace="/website/contactus" action="search" method="post">
        <#--
        <a title="<@s.text name="mall.brand.button.add"/>" class="btn medium primary-bg dd-add" href="<@s.url namespace="/mall/goods/brand" action="add"/>" target="after:closest('#page-content')">
        <span class="button-content">
            <i class="glyph-icon icon-plus float-left"></i>
            <@s.text name="mall.brand.button.add"/>
        </span>
        </a>
        -->
        <div class="propertyFilter">
        </div>
        <div class="form-search">
            <input type="text" name="LIKES_name" title="" data-placement="bottom" class="input tooltip-button ac_input" placeholder="Search..." autocomplete="off" style="display: inline-block; width: 200px;">
            <i class="glyph-icon icon-search"></i>
        </div>
    </@s.form>
</div>
<div class="batch">
    <a title="批量删除" class="btn small primary-bg batchDelete" href="<@s.url value="/website/contactuses?__http_method=delete"/>">
        <span class="button-content">
            <i class="glyph-icon icon-trash float-left"></i>
            批量删除
        </span>
    </a>
</div>
<div class="grid-panel">
    <table id="view" class="table table-hover mrg5B text-center">
        <thead>
        <tr>
            <th class="pad15L" style="width:20px;">
                <input id="allChecked" class="custom-checkbox bg-white" checkAll=".id" type="checkbox" <#--checktip="{message:'您选中了{num}条记录',tip:'#config_check_info'}"--> />
            </th>
            <th class="sort" orderBy="name">姓名</th>
            <th>电话</th>
            <th>装修预算</th>
            <th>量房时间</th>
            <th class="sort" orderBy="createTime">提交时间</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr class="template" name="default">
            <td><input class="id custom-checkbox" type="checkbox" value="{id}"/></td>
            <td>{name}</td>
            <td>{phone}</td>
            <td>{decorateBudget}</td>
            <td>{amountTime}</td>
            <td>{createTime}</td>
            <td class="pad0T pad0B text-center">
                <div class="dropdown actions">
                    <a href="javascript:;" title="" class="btn medium bg-blue" data-toggle="dropdown">
                        <span class="button-content">
                            <i class="glyph-icon font-size-11 icon-cog"></i>
                            <i class="glyph-icon font-size-11 icon-chevron-down"></i>
                        </span>
                    </a>
                    <ul class="dropdown-menu float-right">
                        <li>
                            <a href="<@s.url namespace="/website/contactus" action="view?id={id}"/>" class="view" title="详情" target="after:closest('#page-content')">
                                <i class="glyph-icon icon-external-link-sign mrg5R"></i>
                                详情
                            </a>
                        </li>
                        <#--
                        <li>
                            <a title="<@s.text name="mall.brand.list.actions.edit"/>" class="edit" href="<@s.url namespace="/mall/goods/brand" action="edit?id={id}"/>" target="after:closest('#page-content')">
                                <i class="glyph-icon icon-edit mrg5R"></i>
                                编辑
                            </a>
                        </li>
                        -->
                        <li class="divider"></li>
                        <li>
                            <a href="<@s.url namespace="/mall/goods/brand" action="delete?id={id}"/>" class="font-red delete" title="<@s.text name="mall.brand.list.actions.delete"/>">
                                <i class="glyph-icon icon-remove mrg5R"></i>
                                删除
                            </a>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="divider mrg0T"></div>
</@override>
<@extends name="../wrapper.ftl"/>