package com.fantasy.website.service;

import com.fantasy.framework.dao.Pager;
import com.fantasy.framework.dao.hibernate.PropertyFilter;
import com.fantasy.website.bean.ContactUs;
import com.fantasy.website.dao.ContactUsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ContactUsService {

    @Autowired
    private ContactUsDao contactUsDao;


    public Pager<ContactUs> findPager(Pager<ContactUs> pager, List<PropertyFilter> filters) {
        return this.contactUsDao.findPager(pager, filters);
    }

    public ContactUs save(ContactUs contactUs) {
        this.contactUsDao.save(contactUs);
        return contactUs;
    }

    public List<ContactUs> delete(Long... ids) {
        List<ContactUs> contactUses = new ArrayList<ContactUs>();
        for (Long id : ids) {
            ContactUs contactUs = this.contactUsDao.get(id);
            if (contactUs == null) {
                continue;
            }
            this.contactUsDao.delete(contactUs);
            contactUses.add(contactUs);
        }
        return contactUses;
    }

    public ContactUs get(Long id) {
        return this.contactUsDao.get(id);
    }
}
