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
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;



//@WebServlet("/article/getAllIndex")
public class ArticleGetAllIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ArticleGetAllIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String minid=request.getParameter("minid");
		String name="all";
		 name=request.getParameter("user-name");
		ArticleService as = new ArticleServiceImpl();
		List<Map<String,Object>> list=null;
		if(name.equals("all")) {
			list=as.getAllIndex(Integer.parseInt(minid));
		}else if(name.equals("noDone")) {
			list=as.getnoDoneIndex(Integer.parseInt(minid));
		}else if(name.equals("accept")) {
			list=as.getAcceptIndex(Integer.parseInt(minid));
		}else if(name.equals("cream")) {
			list=as.getCreamIndex(Integer.parseInt(minid));
		}/*else if(name.equals("mypost")) {
			Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
			list=as.getMypostIndex(userinfo.getId());
		}*/
		
		
		response.getWriter().print(JSON.toJSONString(list));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
