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
		// 获取前台参数
		// 文章标题
		String title = request.getParameter("title");
		// 文章内容
		String markdown_content = request.getParameter("topic_markdown_content");
		String html_content = request.getParameter("test-editormd-html-code");
		// 文章类型
		int typeid = Integer.parseInt(request.getParameter("typeid"));
		// 悬赏飞吻
		int paykiss = Integer.parseInt(request.getParameter("kiss"));
		// 作者id
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		int authorid = userinfo.getId();
		String artid=request.getParameter("artid");
		// 发布时间
		Date releasetime = new Date();
		// 封装对象
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
			// 调service完成发帖（向articleinfo当中插入一条记录，修改用户表的飞吻）
			
			as.releaseArticle(articleinfo);
			// 同步更新session中对象的飞吻
			userinfo.setKissnum(userinfo.getKissnum() - paykiss);
		}else {
			articleinfo.setId(Integer.parseInt(artid));
			as.editArticle(articleinfo);
		}
		
		response.sendRedirect(request.getContextPath()+"/loadindex");
	}

}
