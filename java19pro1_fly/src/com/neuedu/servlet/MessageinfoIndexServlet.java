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


//@WebServlet("/message/getIndex")
public class MessageinfoIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MessageinfoIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");
		int pageIndex = Integer.parseInt(strPageIndex);
		int pageSize = Integer.parseInt(strPageSize);
		// ��װ��ҳ����
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("login_user");
		int userid=userinfo.getId();
		Page page = new Page();
		page.setUserid(userid);
		page.setPageIndex(pageIndex*pageSize);
		page.setPageSize(pageSize);
		// ����service��ѯ��1.������2.ǰ10����
		ArticleService as = new ArticleServiceImpl();
		int count = 2;
		List<Map<String, Object>> messList=as.getMessageById(page);
		System.out.println(messList);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(messList);
		response.getWriter().print(JSON.toJSONString(info));*/
		String strpageIndex = request.getParameter("pageIndex");
		String strpageSize = request.getParameter("pageSize");
		int pageIndex = Integer.parseInt(strpageIndex);
		int pageSize = Integer.parseInt(strpageSize);
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		int userid = userinfo.getId();
		//��ҳ����
		Page page = new Page();
		page.setPageIndex(pageIndex*pageSize);
		page.setPageSize(pageSize);
		page.setUserid(userid);
		//����service��ѯ(��Ϣ)
		ArticleService as = new ArticleServiceImpl();
		List<Map<String, Object>> msglist = as.getMessageById(page);
		System.out.println(msglist);
		PageInfo info = new PageInfo();
		info.setData(msglist);
		response.getWriter().print(JSON.toJSONString(info));
		System.out.print(JSON.toJSONString(info));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
