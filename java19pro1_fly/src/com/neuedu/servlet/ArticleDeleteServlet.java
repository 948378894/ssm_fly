package com.neuedu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

//@WebServlet("/article/delbyid")
public class ArticleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ArticleDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String artid=request.getParameter("artid");
		ArticleService as = new ArticleServiceImpl();
		as.delArticleById(Integer.parseInt(artid));
		request.getRequestDispatcher("/jsp/jie/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String artid=request.getParameter("artid");
		ArticleService as = new ArticleServiceImpl();
		int count=as.delArticleById(Integer.parseInt(artid));
		response.getWriter().print(count);
		//request.getRequestDispatcher("/jsp/jie/detail.jsp").forward(request, response);
	}

}
