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
import com.neuedu.util.MD5;


//@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("login_email");
		String password=request.getParameter("login_pass");
		Userinfo userinfo=new Userinfo();
		UserinfoService us=new UserinfoServiceImpl();
		userinfo.setEmail(email);
		userinfo.setPassword(MD5.getMD5(password));
		Userinfo user=us.LoginCheck(userinfo);
		if(user==null) {
			response.getWriter().print(0);
		}else {
			request.getSession().setAttribute("login_user", user);
			response.getWriter().print(1);
		}
	}

}
