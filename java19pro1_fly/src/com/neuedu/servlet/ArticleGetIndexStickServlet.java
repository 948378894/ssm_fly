package com.neuedu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

/**
 * Servlet implementation class ArticleGetIndexStickServlet
 */
//@WebServlet("/article/getIndexStick")
public class ArticleGetIndexStickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// µ÷service²éÑ¯ÖÃ¶¥Ìû
		ArticleService as = new ArticleServiceImpl();
		List<Map<String, Object>> sticklist =  as.getIndexStick();
		System.out.println(JSON.toJSONString(sticklist));
		response.getWriter().print(JSON.toJSONString(sticklist));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
