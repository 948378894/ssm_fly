package com.neuedu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

//@WebServlet("/loadindex")
public class LoadIndexContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 调service层完成首页内容查询（1.帖子信息；2.热榜信息）
		ArticleService as = new ArticleServiceImpl();
		List<Map<String,Object>> artlist = as.getIndexArticleInfo();
		if(artlist != null) {
			request.setAttribute("artlist", artlist);
		}
		
		request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
