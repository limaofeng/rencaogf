package com.fantasy.file.web;


import com.fantasy.file.bean.FileDetail;
import com.fantasy.file.service.FileUploadService;
import com.fantasy.framework.struts2.ActionSupport;
import com.fantasy.framework.util.web.WebUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

public class CkeditorImageAction extends ActionSupport {

    @Autowired
    private transient FileUploadService fileUploadService;

    public String upload(File attach, String attachContentType, String attachFileName,String CKEditorFuncNum) throws IOException {
        FileDetail fileDetail = fileUploadService.upload(attach, attachContentType, attachFileName, "cms_image");
        ActionContext.getContext().getActionInvocation().getProxy().setExecuteResult(false);
        PrintWriter writer = ServletActionContext.getResponse().getWriter();
        writer.print("<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("+CKEditorFuncNum+",'" + WebUtil.getRequestUrl(this.request) + fileDetail.getAbsolutePath() + "')</script>");
        writer.flush();
        return NONE;
    }

}
