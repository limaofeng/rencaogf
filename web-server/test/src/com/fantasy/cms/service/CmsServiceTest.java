package com.fantasy.cms.service;

import com.fantasy.attr.framework.converter.FileDetailTypeConverter;
import com.fantasy.attr.framework.util.AttributeUtils;
import com.fantasy.attr.storage.bean.AttributeVersion;
import com.fantasy.attr.storage.service.AttributeTypeService;
import com.fantasy.attr.storage.service.AttributeVersionService;
import com.fantasy.cms.bean.Article;
import com.fantasy.cms.bean.ArticleCategory;
import com.fantasy.file.bean.FileDetail;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class CmsServiceTest {

    private static Log LOG = LogFactory.getLog(CmsServiceTest.class);

    @Autowired
    private CmsService cmsService;
    @Autowired
    private AttributeTypeService attributeTypeService;
    @Autowired
    private AttributeVersionService attributeVersionService;

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void initAttributes() {
        //初始化 设计师
        attributeTypeService.save(FileDetail.class, "图片", "图片", FileDetailTypeConverter.class);
        //初始化装修公司
        AttributeVersion version = attributeVersionService.save(Article.class.getName(), "company", AttributeUtils.bean("logo", "公司logo", "公司logo", FileDetail.class));
        ArticleCategory category = cmsService.get("company");
        category.setArticleVersion(version);
        cmsService.save(category);
    }

    //初始化设计师
    @Test
    public void initDesigner() {
        //初始化 设计师
        attributeTypeService.save(FileDetail.class, "图片", "图片", FileDetailTypeConverter.class);
        //初始化装修公司
        attributeVersionService.save(Article.class.getName(), "designer", AttributeUtils.bean("avatar", "用户头像", "用户头像", FileDetail.class),AttributeUtils.string("time","工艺时长","工艺时长"));
    }

    //初始化 案例
    @Test
    public void initCase() {
        attributeTypeService.save(FileDetail[].class, "图片", "图片", FileDetailTypeConverter.class);
        //初始化装修公司
        attributeVersionService.save(Article.class.getName(), "case", AttributeUtils.string("square", "面积", ""), AttributeUtils.string("style", "风格", ""), AttributeUtils.string("designer", "设计师", ""), AttributeUtils.bean("images", "案例图片", "案例图片", FileDetail[].class));
    }

}
