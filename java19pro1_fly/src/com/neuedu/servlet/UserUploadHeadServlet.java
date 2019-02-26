package com.neuedu.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.alibaba.fastjson.JSON;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.UserinfoService;
import com.neuedu.service.impl.UserinfoServiceImpl;
import com.neuedu.util.UploadImgUtil;

/**
 * Servlet implementation class UserUploadHeadServlet
 */
//@WebServlet("/user/updateHeadImg")
//@MultipartConfig
public class UserUploadHeadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserUploadHeadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �Ȼ�ȡ�ϴ�ͼƬ��·��
		String savePath = request.getServletContext().getRealPath("/res/images/avatar");
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		Part part = request.getPart("file");
		String header = part.getHeader("content-disposition");
		String str[] = header.split(";");
		String fileName = "";
		if(str.length >= 3) {
			// ��������ͷ
			fileName = getFileName(header);
			if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".gif")) {
				UploadImgUtil uiu = new UploadImgUtil();
				uiu.setStatus(2);
				response.getWriter().print(JSON.toJSONString(uiu));
				return;
			}
			// ��ͼƬ��������
			fileName = UUID.randomUUID() + fileName;
			if(!fileName.equals("")) {
				// ͼƬ�ϴ�
				if(part.getSize() > 100*1024) {
					UploadImgUtil uiu = new UploadImgUtil();
					uiu.setStatus(3);
					response.getWriter().print(JSON.toJSONString(uiu));
					return;
				}
				part.write(savePath+File.separator+fileName);
			}
		}
		// session�ж������ͷ��·��
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		if(userinfo != null) {
			userinfo.setHead(fileName);
		}
		// ��service�����ͷ�����
		UserinfoService us = new UserinfoServiceImpl();
		us.uploadHeadImg(userinfo);
		// ��Ӧҳ��ajax����
		UploadImgUtil uiu = new UploadImgUtil();
		uiu.setStatus(1);
		uiu.setSrc(request.getContextPath()+"/res/images/avatar/"+fileName);
		response.getWriter().print(JSON.toJSONString(uiu));
	}
	public String getFileName(String header) {
		/**
		 * String[] tempArr1 = header.split(";");����ִ����֮���ڲ�ͬ��������£�tempArr1���������������������
		 * �������google������£�tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
		 * IE������£�tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
		 */
		String[] tempArr1 = header.split(";");
		/**
		 * �������google������£�tempArr2={filename,"snmp4j--api.zip"}
		 * IE������£�tempArr2={filename,"E:\snmp4j--api.zip"}
		 */
		String[] tempArr2 = tempArr1[2].split("=");
		// ��ȡ�ļ��������ݸ����������д��
		String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\") + 1).replaceAll("\"", "");
		return fileName;
	}
}
