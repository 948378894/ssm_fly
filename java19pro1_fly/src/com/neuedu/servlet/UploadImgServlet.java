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
		// ��ȡ����
		String base64 = request.getParameter("base");
		System.out.println(base64);
		base64 = base64.replace("data:image/png;base64,", "");
		System.out.println(base64);
		// ָ���ļ��ϴ���·��
		String realPath = request.getServletContext().getRealPath("upload");
		System.out.println(realPath);
		// �ϴ�·����������Ҫ������Ŀ¼
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		// ����UUID���ͼƬ��������ͻ����ֹͼƬ����
		String fileName = UUID.randomUUID()+".jpg";
		String newFileName = realPath + File.separator +  fileName;
		System.out.println(fileName);
		// 1.�ϴ�ͼƬ
		PicEncode.generateImage(base64, newFileName);
		// 2.��Ӧҳ��ajax����
		ImgUploadBackData iubd = new ImgUploadBackData();
		iubd.setCode(1);
		iubd.setPath("upload"+File.separator+fileName);
		response.getWriter().print(JSON.toJSONString(iubd));
	}
}