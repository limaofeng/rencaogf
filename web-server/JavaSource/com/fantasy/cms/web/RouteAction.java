package com.fantasy.cms.web;

import com.fantasy.cms.bean.Article;
import com.fantasy.cms.service.CmsService;
import com.fantasy.framework.dao.Pager;
import com.fantasy.framework.dao.hibernate.PropertyFilter;
import com.fantasy.framework.util.common.ObjectUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class RouteAction extends CmsAction {

    @Autowired
    private transient CmsService cmsService;

    public String execute(Pager<Article> pager, List<PropertyFilter> filters) throws Exception {
        // 设置当前根
        PropertyFilter filter = ObjectUtil.find(filters, "filterName", "EQS_category.code");
        if (filter != null) {
            if ("designer".equals(filter.getPropertyValue(String.class))) {
                this.attrs.put("pageTitle", "设计师维护");
            } else if ("company".equals(filter.getPropertyValue(String.class))) {
                this.attrs.put("pageTitle", "合作装修公司维护");
            }
            if ("about".equals(filter.getPropertyValue(String.class))) {
                this.attrs.put("pageTitle", "关于我们维护");
            }
            this.attrs.put("category", this.cmsService.get(filter.getPropertyValue(String.class)));
        }
        // 全部分类
        this.attrs.put("pager", cmsService.findPager(pager, filters));
        return SUCCESS;
    }

}
