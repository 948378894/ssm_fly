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
		// 先获取上传图片的路径
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
			// 解析请求头
			fileName = getFileName(header);
			if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".gif")) {
				UploadImgUtil uiu = new UploadImgUtil();
				uiu.setStatus(2);
				response.getWriter().print(JSON.toJSONString(uiu));
				return;
			}
			// 给图片重新起名
			fileName = UUID.randomUUID() + fileName;
			if(!fileName.equals("")) {
				// 图片上传
				if(part.getSize() > 100*1024) {
					UploadImgUtil uiu = new UploadImgUtil();
					uiu.setStatus(3);
					response.getWriter().print(JSON.toJSONString(uiu));
					return;
				}
				part.write(savePath+File.separator+fileName);
			}
		}
		// session中对象更新头像路径
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		if(userinfo != null) {
			userinfo.setHead(fileName);
		}
		// 调service层完成头像更改
		UserinfoService us = new UserinfoServiceImpl();
		us.uploadHeadImg(userinfo);
		// 响应页面ajax请求
		UploadImgUtil uiu = new UploadImgUtil();
		uiu.setStatus(1);
		uiu.setSrc(request.getContextPath()+"/res/images/avatar/"+fileName);
		response.getWriter().print(JSON.toJSONString(uiu));
	}
	public String getFileName(String header) {
		/**
		 * String[] tempArr1 = header.split(";");代码执行完之后，在不同的浏览器下，tempArr1数组里面的内容稍有区别
		 * 火狐或者google浏览器下：tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
		 * IE浏览器下：tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
		 */
		String[] tempArr1 = header.split(";");
		/**
		 * 火狐或者google浏览器下：tempArr2={filename,"snmp4j--api.zip"}
		 * IE浏览器下：tempArr2={filename,"E:\snmp4j--api.zip"}
		 */
		String[] tempArr2 = tempArr1[2].split("=");
		// 获取文件名，兼容各种浏览器的写法
		String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\") + 1).replaceAll("\"", "");
		return fileName;
	}
}
