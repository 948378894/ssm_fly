package com.neuedu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Collectioninfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;


//@WebServlet("/article/nocollection")
public class ArticlenoCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ArticlenoCollectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String articleid=request.getParameter("articleid");
		ArticleService as = new ArticleServiceImpl();
		Collectioninfo coll=new Collectioninfo();
		coll.setUserid(Integer.parseInt(userid));
		coll.setArticleid(Integer.parseInt(articleid));
		as.delcollection(coll);
		System.out.println("*********************************************");
		response.getWriter().print(1);
	}

}
