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

//@WebServlet("/user/pass")
public class UpdatepassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdatepassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass=request.getParameter("set_pass");
		Userinfo olduser = (Userinfo)request.getSession().getAttribute("login_user");
		 pass=MD5.getMD5(pass);
		if(pass.equals(olduser.getPassword())) {
			response.getWriter().print(0);
		}else {
			response.getWriter().print(1);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String pass=request.getParameter("pass");
			Userinfo olduser = (Userinfo)request.getSession().getAttribute("login_user");
			Userinfo userinfo=new Userinfo();
			userinfo.setId(olduser.getId());
			userinfo.setPassword(MD5.getMD5(pass));
				UserinfoService us=new UserinfoServiceImpl();
				us.updatePass(userinfo);
			request.getRequestDispatcher("/jsp/user/set.jsp").forward(request, response);
	}

}
