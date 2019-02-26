package com.neuedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.UserinfoService;
import com.neuedu.service.impl.UserinfoServiceImpl;
import com.neuedu.util.MD5;
import com.neuedu.util.MailUtil;
import com.neuedu.util.UploadImgUtil;

@Controller
@RequestMapping("/user")
public class UserinfoController {
	@Autowired
	UserinfoService us;
	@RequestMapping("/activemail")
	public String activeMail(String mailcode,HttpSession session) {
		us.activeMail(mailcode);
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		if(userinfo != null) {
			userinfo.setActive(1);
			
			return "redirect:/go/activate";
		}
		else {
			return "redirect:/go/login";
		}
	}
	@RequestMapping("/pass")
	public String pass(@RequestParam("set_pass") String pass,HttpSession session,HttpServletResponse response) throws IOException {
		
		Userinfo olduser = (Userinfo)session.getAttribute("login_user");
		 pass=MD5.getMD5(pass);
		if(pass.equals(olduser.getPassword())) {
			response.getWriter().print(0);
		}else {
			response.getWriter().print(1);
		}
		return "go/pass";
	}	
	@RequestMapping("/login")
	public void login(@RequestParam("login_email") String email,@RequestParam("login_pass") String password,HttpSession session,HttpServletResponse response) throws IOException {
		Userinfo userinfo= new Userinfo();
		userinfo.setEmail(email);
		userinfo.setPassword(MD5.getMD5(password));
		Userinfo user=us.LoginCheck(userinfo);
		if(user==null) {
			response.getWriter().print(0);
		}else {
			session.setAttribute("login_user", user);
			response.getWriter().print(1);
		}
	}
	@RequestMapping(value="/reg",method= {RequestMethod.GET})
	public void regGet(@RequestParam("reg_email") String email,HttpServletResponse response) throws IOException {
		int count=us.regEmailCheck(email);
		response.getWriter().print(count);
	}
	@RequestMapping(value="/reg",method= {RequestMethod.POST})
	public String regPost(Userinfo userinfo,HttpServletRequest request) throws IOException {
		String password=request.getParameter("pass");
		String nickname=request.getParameter("username");
		String email=request.getParameter("email");
		userinfo.setNickname(nickname);
		userinfo.setEmail(email);
		userinfo.setPassword(MD5.getMD5(password));
		userinfo.setRegtime(new Date());
		String activecode=UUID.randomUUID()+"";
		userinfo.setActivecode(activecode);	
		try {
			MailUtil.sendActiveMail(userinfo.getEmail(), activecode);
		} catch (Exception e) {

			e.printStackTrace();
		}
		us.addUserinfo(userinfo);
		return "redirect:/go/login";
	}
	@RequestMapping(value="/set",method= {RequestMethod.GET})
	public void setGet(@RequestParam("reg_email") String email,HttpSession session,HttpServletResponse response) throws IOException {
		Userinfo olduser = (Userinfo)session.getAttribute("login_user");
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
	@RequestMapping(value="/set",method= {RequestMethod.POST})
	public String setPost(Userinfo userinfo,HttpSession session) throws IOException {
		Userinfo olduser = (Userinfo)session.getAttribute("login_user");
		String oldemail=olduser.getEmail();
		userinfo.setOldemail(oldemail);
		userinfo.setHead(olduser.getHead());
		userinfo.setPassword(olduser.getPassword());
		UserinfoService us=new UserinfoServiceImpl();
		us.UpdataUserinfo(userinfo);
		session.invalidate();
		session.setAttribute("login_user", userinfo);
		return "go/set";
	}
	@RequestMapping("/updateHeadImg")
	public void updateHeadImg(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
		UploadImgUtil uiu = null;
		if(file.isEmpty()){
	         System.out.println("文件未上传!");
	    }else {
	    	try {
	    		// 得到上传文件名
		    	String fileName = file.getOriginalFilename();
		    	// 准备保存路径
		    	String savePath = request.getServletContext().getRealPath("/res/images/avatar/");
		    	File path = new File(savePath);
		    	if(!path.exists()) {
		    		path.mkdirs();
		    	}
		    	String uuid = UUID.randomUUID()+"";
		    	// 上传
		    	String finalPath = savePath + uuid + fileName;
		    	File local = new File(finalPath);
				file.transferTo(local);
				// session中对象更新头像路径
				Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
				if(userinfo != null) {
					userinfo.setHead(uuid + fileName);
				}
				// 调service层完成头像更改
				us.uploadHeadImg(userinfo);
				// 响应页面ajax请求
				uiu = new UploadImgUtil();
				uiu.setStatus(1);
				uiu.setSrc(request.getContextPath()+"/res/images/avatar/"+uuid + fileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				e.printStackTrace();
			}
	    }
		response.getWriter().print(JSON.toJSONString(uiu));
	}
}
