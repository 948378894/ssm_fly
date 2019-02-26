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
import com.neuedu.domain.Page;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;
import com.neuedu.util.PageInfo;


//@WebServlet("/collection/getindex")
public class CollectionGetindexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.
		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");
		int pageIndex = Integer.parseInt(strPageIndex);
		int pageSize = Integer.parseInt(strPageSize);
		// 封装分页对象
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
		int userid=userinfo.getId();
		Page page = new Page();
		page.setUserid(userid);
		page.setPageIndex(pageIndex*pageSize);
		page.setPageSize(pageSize);
		// 调用service查询（1.总数，2.前10条）
		ArticleService as = new ArticleServiceImpl();
		int count = as.getCollectionNum(userid);
		List<Map<String, Object>> collList=as.getIndexCollection(page);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(collList);
		response.getWriter().print(JSON.toJSONString(info));
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
