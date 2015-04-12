package com.fantasy.website.web;

import com.fantasy.framework.dao.Pager;
import com.fantasy.framework.dao.hibernate.PropertyFilter;
import com.fantasy.framework.struts2.rest.RestActionSupport;
import com.fantasy.website.bean.ContactUs;
import com.fantasy.website.service.ContactUsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class ContactUsAction extends RestActionSupport {

    @Autowired
    private ContactUsService contactUsService;

    public String index(Pager<ContactUs> pager,List<PropertyFilter> filters){
        this.attrs.put("pager",this.contactUsService.findPager(pager,filters));
        return SUCCESS;
    }

    public String search(Pager<ContactUs> pager,List<PropertyFilter> filters){
        this.attrs.put(ROOT,this.contactUsService.findPager(pager,filters));
        return SUCCESS;
    }

    public String create(ContactUs contactUs) {
        this.attrs.put(ROOT, this.contactUsService.save(contactUs));
        return SUCCESS;
    }

    public String update(ContactUs contactUs){
        this.attrs.put(ROOT,this.contactUsService.save(contactUs));
        return SUCCESS;
    }

    public String delete(Long[] id,Long[] ids){
        if(id == null){
            id = ids;
        }
        this.attrs.put(ROOT,this.contactUsService.delete(id));
        return SUCCESS;
    }

    public String view(Long id){
        this.attrs.put(ROOT,this.contactUsService.get(id));
        return SUCCESS;
    }

}
