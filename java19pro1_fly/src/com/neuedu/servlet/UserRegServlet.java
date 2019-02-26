package com.neuedu.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.domain.Userinfo;
import com.neuedu.service.UserinfoService;
import com.neuedu.service.impl.UserinfoServiceImpl;
import com.neuedu.util.MD5;
import com.neuedu.util.MailUtil;


//@WebServlet("/user/reg")
public class UserRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reg_email=request.getParameter("reg_email");
		//调用service层,完成邮箱验证,已经注册返回1,没有注册返回0
		UserinfoService us=new UserinfoServiceImpl();
		int count=us.regEmailCheck(reg_email);
		response.getWriter().print(count);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String nickname=request.getParameter("username");
		String password=request.getParameter("pass");
		UserinfoService us=new UserinfoServiceImpl();
		Userinfo userinfo=new Userinfo();
		userinfo.setEmail(email);
		userinfo.setPassword(MD5.getMD5(password));
		userinfo.setNickname(nickname);
		userinfo.setRegtime(new Date());
		String activecode=UUID.randomUUID()+"";
		userinfo.setActivecode(activecode);
		
		try {
			MailUtil.sendActiveMail(email, activecode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		us.addUserinfo(userinfo);
		//request.setAttribute("msg", 1);
		//response.sendRedirect(request.getContextPath()+"/jsp/user/reg.jsp");
		request.getRequestDispatcher("/jsp/user/login.jsp").forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
