package com.fantasy.website.dao;

import com.fantasy.framework.dao.hibernate.HibernateDao;
import com.fantasy.website.bean.ContactUs;
import org.springframework.stereotype.Repository;

@Repository
public class ContactUsDao extends HibernateDao<ContactUs,Long>{
}
