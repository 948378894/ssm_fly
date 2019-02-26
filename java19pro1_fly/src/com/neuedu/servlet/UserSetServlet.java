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

//@WebServlet("/user/set")
public class UserSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("set_email");
		Userinfo olduser = (Userinfo)request.getSession().getAttribute("login_user");
			UserinfoService us=new UserinfoServiceImpl();
			Userinfo userinfo=new Userinfo();
			userinfo.setEmail(email);
			int count=us.setEmailCheck(userinfo);
			if(email.equals(olduser.getEmail())) {
				count=0;
				response.getWriter().print(count);
			}else {
				response.getWriter().print(count);
			}	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String nickname=request.getParameter("username");
		String sex=request.getParameter("sex");
		String sign=request.getParameter("sign");
		String city=request.getParameter("city");
		Userinfo olduser = (Userinfo)request.getSession().getAttribute("login_user");
		String oldemail=olduser.getEmail();
		Userinfo userinfo=new Userinfo();
		userinfo.setCity(city);
		userinfo.setEmail(email);
		userinfo.setOldemail(oldemail);
		userinfo.setNickname(nickname);
		userinfo.setSex(sex);
		userinfo.setSign(sign);
		userinfo.setHead(olduser.getHead());
		userinfo.setPassword(olduser.getPassword());
		UserinfoService us=new UserinfoServiceImpl();
		us.UpdataUserinfo(userinfo);
		request.getSession().invalidate();
		request.getSession().setAttribute("login_user", userinfo);
		request.getRequestDispatcher("/jsp/user/set.jsp").forward(request, response);
	}

}
