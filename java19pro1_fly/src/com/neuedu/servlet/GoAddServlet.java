package com.neuedu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Articletype;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;


//@WebServlet("/go/add")
public class GoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GoAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
		String artid=request.getParameter("artid");
		ArticleService as = new ArticleServiceImpl();
		if(userinfo==null) {
			response.sendRedirect(request.getContextPath()+"/jsp/user/login.jsp");
		}else {
			// 判断用户是否是激活用户
			if(userinfo.getActive() == 1) {
				if(artid!=null) {
					Map<String,Object> artmap=as.getArticleDetail(Integer.parseInt(artid));
					request.setAttribute("editmap", artmap);
					request.getRequestDispatcher("/jsp/jie/add.jsp").forward(request, response);
				}else {
					// 调service查询文章类型，将所有类型存入request,请求转发到add.jsp
				/*
					List<Articletype> typelist =  as.loadArticleType(userinfo);
					request.setAttribute("typelist", typelist);*/
					request.getRequestDispatcher("/jsp/jie/add.jsp").forward(request, response);	
				}
				
			
			}else {
				response.sendRedirect(request.getContextPath()+"/jsp/user/activate.jsp");
			}
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
		if(userinfo==null) {
			response.sendRedirect(request.getContextPath()+"/jsp/user/login.jsp");
		}else {
			// 判断用户是否是激活用户
			if(userinfo.getActive() == 1) {
				// 调service查询文章类型，将所有类型存入request,请求转发到add.jsp
				ArticleService as = new ArticleServiceImpl();
				/*List<Articletype> typelist =  as.loadArticleType(userinfo);
				request.setAttribute("typelist", typelist);*/
				request.getRequestDispatcher("/jsp/jie/add.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/jsp/user/activate.jsp");
			}
		}

	}


}
