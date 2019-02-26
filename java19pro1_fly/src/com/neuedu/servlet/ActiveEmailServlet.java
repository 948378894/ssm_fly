package com.neuedu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Userinfo;
import com.neuedu.service.UserinfoService;
import com.neuedu.service.impl.UserinfoServiceImpl;

//@WebServlet("/user/activemail")
public class ActiveEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ActiveEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mailcode = request.getParameter("mailcode");
		// �����ݿ����޸ļ�����Ϊmailcode���û�����active�ֶθ�Ϊ1
		UserinfoService us = new UserinfoServiceImpl();
		us.activeMail(mailcode);
		// sessionͬ��
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		if(userinfo != null) {
			userinfo.setActive(1);
			response.sendRedirect(request.getContextPath()+"/jsp/user/activate.jsp");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/jsp/user/login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
