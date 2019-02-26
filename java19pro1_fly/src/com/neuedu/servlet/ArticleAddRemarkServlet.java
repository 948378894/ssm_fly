package com.neuedu.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Commentinfo;
import com.neuedu.domain.Messageinfo;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;


//@WebServlet("/article/addremark")
public class ArticleAddRemarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String authorid = request.getParameter("authorid");
		String commcontent = request.getParameter("commcontent");
		String artidorcommid = request.getParameter("artidorcommid");
		String writerid=request.getParameter("writerid");
		Commentinfo info = new Commentinfo();
		info.setAuthorid(Integer.valueOf(authorid));
		info.setCommtime(new Date());
		info.setCommcontent(commcontent);
		info.setArtidorcommid(Integer.valueOf(artidorcommid));
		// 调service完成评论
		ArticleService as = new ArticleServiceImpl();
		as.addMainComment(info);
		Messageinfo message=new Messageinfo();
		message.setCommid(Integer.parseInt(authorid));//评论者
		message.setWriterid(Integer.parseInt(writerid));//被评论者
		message.setArticleid(Integer.parseInt(artidorcommid));//评论文章
		message.setReplytime(new Date());
		as.addReplyMessage(message);
		response.getWriter().print(info.getId());
	}

}
