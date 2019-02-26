package com.neuedu.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Articleinfo;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

/**
 * Servlet implementation class ArticleReleaseServlet
 */
//@WebServlet("/article/release")
public class ArticleReleaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��ȡǰ̨����
		// ���±���
		String title = request.getParameter("title");
		// ��������
		String markdown_content = request.getParameter("topic_markdown_content");
		String html_content = request.getParameter("test-editormd-html-code");
		// ��������
		int typeid = Integer.parseInt(request.getParameter("typeid"));
		// ���ͷ���
		int paykiss = Integer.parseInt(request.getParameter("kiss"));
		// ����id
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		int authorid = userinfo.getId();
		String artid=request.getParameter("artid");
		// ����ʱ��
		Date releasetime = new Date();
		// ��װ����
		Articleinfo articleinfo = new Articleinfo();
		articleinfo.setTitle(title);
		articleinfo.setMarkdown_content(markdown_content);
		articleinfo.setHtml_content(html_content);
		articleinfo.setTypeid(typeid);
		articleinfo.setPaykiss(paykiss);
		articleinfo.setAuthorid(authorid);
		ArticleService as = new ArticleServiceImpl();
		System.out.println("***************************");
		System.out.println(artid);
		if(artid.equals("")) {
			articleinfo.setReleasetime(releasetime);
			// ��service��ɷ�������articleinfo���в���һ����¼���޸��û���ķ��ǣ�
			
			as.releaseArticle(articleinfo);
			// ͬ������session�ж���ķ���
			userinfo.setKissnum(userinfo.getKissnum() - paykiss);
		}else {
			articleinfo.setId(Integer.parseInt(artid));
			as.editArticle(articleinfo);
		}
		
		response.sendRedirect(request.getContextPath()+"/loadindex");
	}

}
