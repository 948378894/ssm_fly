package com.neuedu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

//@WebServlet("/article/nocream")
public class ArticlenoCreamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ArticlenoCreamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String artid=request.getParameter("artid");
		ArticleService as = new ArticleServiceImpl();
		int count=as.nocream(Integer.parseInt(artid));
		response.getWriter().print(count);
		//request.getRequestDispatcher("/jsp/jie/detail.jsp").forward(request, response);
	}

}
