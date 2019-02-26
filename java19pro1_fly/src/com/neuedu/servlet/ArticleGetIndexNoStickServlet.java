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
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;
import com.neuedu.util.PageInfo;


//@WebServlet("/article/getIndexNoStick")
public class ArticleGetIndexNoStickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");
		int pageIndex = Integer.parseInt(strPageIndex);
		int pageSize = Integer.parseInt(strPageSize);
		// ��װ��ҳ����
		Page page = new Page();
		page.setPageIndex(pageIndex*pageSize);
		page.setPageSize(pageSize);
		// ����service��ѯ��1.������2.ǰ10����
		ArticleService as = new ArticleServiceImpl();
		int count = as.getTotalCounts();
		List<Map<String, Object>> noStickList=as.getIndexNoStick(page);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(noStickList);
		response.getWriter().print(JSON.toJSONString(info));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
