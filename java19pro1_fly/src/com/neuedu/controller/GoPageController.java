package com.neuedu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuedu.domain.Articletype;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.impl.ArticleServiceImpl;

@Controller
@RequestMapping("/go")
public class GoPageController {
	@Autowired
	ArticleService as;
	@RequestMapping("/activate")
	public String goActivate() {
		return "user/activate";
	}
	@RequestMapping("/login")
	public String goLogin() {
		return "user/login";
	}
	@RequestMapping("/rili")
	public String goRili() {
		return "rili";
	}	
	@RequestMapping("/reg")
	public String goReg() {
		return "user/reg";
	}	
	@RequestMapping("/index")
	public String goIndex() {
		return "index";
	}	
	@RequestMapping("/set")
	public String set() {
		return "user/set";
	}
	@RequestMapping("/home")
	public String home() {
		return "user/home";
	}
	@RequestMapping("/tahome")
	public String tahome() {
		return "user/tahome";
	}	
	@RequestMapping("/center")
	public String center() {
		return "user/center";
	}
	@RequestMapping("/message")
	public String message() {
		return "user/message";
	}	
	@RequestMapping("/error")
	public String error() {
		return "404";
	}
	@RequestMapping("/pass")
	public String pass() {
		return "pass";
	}
	@RequestMapping("/logou")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	@RequestMapping("/detail")
	public String detail() {
		return "jie/detail";
	}	
	@RequestMapping("/card")
	public String card() {
		return "jie/card";
	}		
	@RequestMapping(value="/add",method= {RequestMethod.GET})
	public String addGet(String artid,HttpSession session,Model model) {
		Userinfo userinfo=(Userinfo) session.getAttribute("login_user");
		if(userinfo==null) {
			return "redirect:/go/login";
		}else {
			// 判断用户是否是激活用户
			if(userinfo.getActive() == 1) {
				if(artid!=null) {
					Map<String,Object> artmap=as.getArticleDetail(Integer.parseInt(artid));
					model.addAttribute("editmap", artmap);
					return "jie/add";
				}else {
					// 调service查询文章类型，将所有类型存入request,请求转发到add.jsp
					List<Articletype> typelist =  as.loadArticleType(userinfo.getAuthority());
					model.addAttribute("typelist", typelist);
					return "jie/add";
				}
				
			
			}else {
				return "redirect:/go/activate";
			}
		}

	}	
}
