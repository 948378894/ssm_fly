package com.neuedu.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Collectioninfo;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

//@WebServlet("/article/detail")
public class ArticleinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ArticleinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String artid=request.getParameter("artid");
				ArticleService as = new ArticleServiceImpl();
				Map<String,Object> artmap=as.getArticleDetail(Integer.parseInt(artid));
				request.setAttribute("artmap", artmap);
				List<Map<String,Object>> list=as.getCommentByArtId(Integer.parseInt(artid));
				request.setAttribute("artlist", list);
				/*Collectioninfo coll=new Collectioninfo();
				Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
				if(userinfo!=null) {
					coll.setUserid(userinfo.getId());
					coll.setArticleid(Integer.parseInt(artid));
					List<Map<String,Object>> colllist=as.getCollectiocById(coll);	
					request.setAttribute("colllist", colllist);
				}*/
				//查询文章是否收藏
				Collectioninfo coll = new Collectioninfo();
				coll.setArticleid(Integer.parseInt(artid));
				Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
				if(userinfo != null) {
					coll.setUserid(userinfo.getId());
					Map<String, Object> colllist = as.getCollectiocById(coll);
					request.setAttribute("colllist", colllist);
				}
				request.getRequestDispatcher("/jsp/jie/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
