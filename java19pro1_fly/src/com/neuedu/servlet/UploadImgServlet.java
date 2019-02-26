package com.neuedu.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.neuedu.util.ImgUploadBackData;
import com.neuedu.util.PicEncode;


/**
 * Servlet implementation class UploadImgServlet
 */
//@WebServlet("/article/uploadimg")
public class UploadImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取数据
		String base64 = request.getParameter("base");
		System.out.println(base64);
		base64 = base64.replace("data:image/png;base64,", "");
		System.out.println(base64);
		// 指定文件上传的路径
		String realPath = request.getServletContext().getRealPath("upload");
		System.out.println(realPath);
		// 上传路径不存在需要创建该目录
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		// 利用UUID完成图片的命名冲突，防止图片覆盖
		String fileName = UUID.randomUUID()+".jpg";
		String newFileName = realPath + File.separator +  fileName;
		System.out.println(fileName);
		// 1.上传图片
		PicEncode.generateImage(base64, newFileName);
		// 2.响应页面ajax请求
		ImgUploadBackData iubd = new ImgUploadBackData();
		iubd.setCode(1);
		iubd.setPath("upload"+File.separator+fileName);
		response.getWriter().print(JSON.toJSONString(iubd));
	}
}