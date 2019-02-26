package com.neuedu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;


//@WebServlet("/comment/accept")
public class CommentAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CommentAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String commid=request.getParameter("commid");
			String artid=request.getParameter("artid");
			String offerkiss=request.getParameter("offerkiss");
			Userinfo userinfo=new Userinfo();
		
			ArticleService as = new ArticleServiceImpl();
			int authorid= as.commentAccept(Integer.parseInt(commid));
			as.isDone(Integer.parseInt(artid));
			userinfo.setId(authorid);
			userinfo.setKissnum(Integer.parseInt(offerkiss));
			as.offerKiss(userinfo);
			System.out.println(userinfo.getKissnum());
			
			response.getWriter().print(1);
	}

}
