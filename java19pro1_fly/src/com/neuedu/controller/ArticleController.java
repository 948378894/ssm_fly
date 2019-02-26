package com.neuedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.neuedu.domain.Articleinfo;
import com.neuedu.domain.Collectioninfo;
import com.neuedu.domain.Commentinfo;
import com.neuedu.domain.Messageinfo;
import com.neuedu.domain.Page;
import com.neuedu.domain.Signinfo;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.ArticleService;
import com.neuedu.service.UserinfoService;
import com.neuedu.service.impl.ArticleServiceImpl;
import com.neuedu.util.ImgUploadBackData;
import com.neuedu.util.PageInfo;
import com.neuedu.util.PicEncode;
import com.neuedu.util.UploadImgUtil;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Autowired
	UserinfoService us;
	@Autowired
	ArticleService as;
	@RequestMapping("/addremark")
		public void addRemark(Commentinfo info,HttpServletResponse response,Messageinfo message) throws IOException {
		info.setCommtime(new Date());
		// 调service完成评论
		as.addMainComment(info);
		message.setCommid(info.getAuthorid());//评论者
		message.setArticleid(info.getArtidorcommid());//评论文章
		message.setReplytime(new Date());
		as.addReplyMessage(message);
		response.getWriter().print(1);
		}
	@RequestMapping("/delbyid")
	public void delById(String artid,HttpServletResponse response) throws IOException {
		int count=as.delArticleById(Integer.parseInt(artid));
		response.getWriter().print(count);
	}
	@RequestMapping("/delMessbyid")
	public void delMessById(String messid,HttpServletResponse response) throws IOException {
		System.out.println("*******************************");
		System.out.println(messid);
		int count=as.delMessById(Integer.parseInt(messid));
		response.getWriter().print(count);
	}
	@RequestMapping("/delAllMess")
	public void delAllMess(String messid,HttpServletResponse response,HttpSession session) throws IOException {
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		int count=as.delAllMess(userinfo.getId());
		response.getWriter().print(1);
	}	
	@RequestMapping("/collection")
	public void Connection(Collectioninfo coll,HttpServletResponse response) throws IOException {
		coll.setColltime(new Date());
		as.getCollectioninfo(coll);
		response.getWriter().print(1);
	}
	@RequestMapping("/nocollection")
	public void noCollection(Collectioninfo coll,HttpServletResponse response) throws IOException {
		as.delcollection(coll);
		response.getWriter().print(1);
	}	
	@RequestMapping("/cream")
	public void cream(String artid,HttpServletResponse response) throws IOException {
		int count=as.iscream(Integer.parseInt(artid));
		response.getWriter().print(count);
	}
	@RequestMapping("/nocream")
	public void noCream(String artid,HttpServletResponse response) throws IOException {
		int count=as.nocream(Integer.parseInt(artid));
		response.getWriter().print(count);
	}	
	@RequestMapping("/delremark")
	public void delremark(String commid,String artidorcommid,HttpServletResponse response) throws IOException {
		int count=as.delComment(Integer.parseInt(commid));
		as.updateCommentNum(Integer.parseInt(artidorcommid));
		response.getWriter().print(count);
	}
	@RequestMapping("/getAllIndex")
	public void getAllIndex(@RequestParam("minid") String minid,@RequestParam("user-name") String name,HttpServletResponse response) throws IOException {
		List<Map<String,Object>> list=null;
		if(name.equals("all")) {
			list=as.getAllIndex(Integer.parseInt(minid));
		}else if(name.equals("noDone")) {
			list=as.getnoDoneIndex(Integer.parseInt(minid));
		}else if(name.equals("accept")) {
			list=as.getAcceptIndex(Integer.parseInt(minid));
		}else if(name.equals("cream")) {
			list=as.getCreamIndex(Integer.parseInt(minid));
		}
		response.getWriter().print(JSON.toJSONString(list));
	}
	@RequestMapping("/getIndexNoStick")
	public void getIndexNoStick(Page page,HttpServletResponse response) throws IOException {
		page.setPageIndex(page.getPageIndex()*page.getPageSize());
		// 调用service查询（1.总数，2.前10条）
		int count = as.getTotalCounts();
		List<Map<String, Object>> noStickList=as.getIndexNoStick(page);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(noStickList);
		response.getWriter().print(JSON.toJSONString(info));
	}
	@RequestMapping("/getIndexStick")
	public void getIndexStick(Page page,HttpServletResponse response) throws IOException {
		List<Map<String, Object>> sticklist =  as.getIndexStick();
		response.getWriter().print(JSON.toJSONString(sticklist));
	}
	@RequestMapping("/detail/{artid}")
	public String detail(@PathVariable("artid") String artid,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		Map<String,Object> artmap=as.getArticleDetail(Integer.parseInt(artid));
		request.setAttribute("artmap", artmap);
		System.out.println("*****************************");
		System.out.println(artmap);
		List<Map<String,Object>> list=as.getCommentByArtId(Integer.parseInt(artid));
		request.setAttribute("artlist", list);
		//查询文章是否收藏
		Collectioninfo coll = new Collectioninfo();
		coll.setArticleid(Integer.parseInt(artid));
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		if(userinfo != null) {
			coll.setUserid(userinfo.getId());
			Map<String, Object> colllist = as.getCollectiocById(coll);
			request.setAttribute("colllist", colllist);
		}
		return "forward:/go/detail";
	}
	@RequestMapping("/release")
	public String release(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取前台参数
				// 文章标题
				String title = request.getParameter("title");
				// 文章内容
				String markdown_content = request.getParameter("topic_markdown_content");
				String html_content = request.getParameter("test-editormd-html-code");
				// 文章类型
				int typeid = Integer.parseInt(request.getParameter("typeid"));
				// 悬赏飞吻
				int paykiss = Integer.parseInt(request.getParameter("kiss"));
				// 作者id
				Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
				int authorid = userinfo.getId();
				String artid=request.getParameter("artid");
				// 发布时间
				Date releasetime = new Date();
				// 封装对象
				Articleinfo articleinfo = new Articleinfo();
				articleinfo.setTitle(title);
				articleinfo.setMarkdown_content(markdown_content);
				articleinfo.setHtml_content(html_content);
				articleinfo.setTypeid(typeid);
				articleinfo.setPaykiss(paykiss);
				articleinfo.setAuthorid(authorid);
				if(artid.equals("")) {
					articleinfo.setReleasetime(releasetime);
					// 调service完成发帖（向articleinfo当中插入一条记录，修改用户表的飞吻）
					as.releaseArticle(articleinfo);
					// 同步更新session中对象的飞吻
					userinfo.setKissnum(userinfo.getKissnum() - paykiss);
				}else {
					articleinfo.setId(Integer.parseInt(artid));
					as.editArticle(articleinfo);
				}
				return "redirect:/go/index";
	}	
	@RequestMapping("/stick")
	public void Stick(String artid,HttpServletResponse response) throws IOException {
		int count=as.isStick(Integer.parseInt(artid));
		response.getWriter().print(count);
	}
	@RequestMapping("/stick2")
	public void Stick2(String artid,HttpServletResponse response) throws IOException {
		int count=as.onStick(Integer.parseInt(artid));
		response.getWriter().print(count);
	}
	@RequestMapping("/getindex")
	public void getindex(Page page,HttpServletResponse response,HttpSession session) throws IOException {
		// 封装分页对象
		Userinfo userinfo=(Userinfo) session.getAttribute("login_user");
		int userid=userinfo.getId();
		page.setUserid(userid);
		// 调用service查询（1.总数，2.前10条）
		int count = as.getCollectionNum(userid);
		List<Map<String, Object>> collList=as.getIndexCollection(page);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(collList);
		response.getWriter().print(JSON.toJSONString(info));
	}
	@RequestMapping("/accept")
	public void accept(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String commid=request.getParameter("commid");
		String artid=request.getParameter("artid");
		String offerkiss=request.getParameter("offerkiss");
		Userinfo userinfo=new Userinfo();
		int authorid= as.commentAccept(Integer.parseInt(commid));
		as.isDone(Integer.parseInt(artid));
		userinfo.setId(authorid);
		userinfo.setKissnum(Integer.parseInt(offerkiss));
		as.offerKiss(userinfo);
		System.out.println(userinfo.getKissnum());
		response.getWriter().print(1);
	}
	@RequestMapping("/getMessIndex")
	public void getMessIndex(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String strpageIndex = request.getParameter("pageIndex");
		String strpageSize = request.getParameter("pageSize");
		int pageIndex = Integer.parseInt(strpageIndex);
		int pageSize = Integer.parseInt(strpageSize);
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		int userid = userinfo.getId();
		//分页对象
		Page page = new Page();
		page.setPageIndex(pageIndex*pageSize);
		page.setPageSize(pageSize);
		page.setUserid(userid);
		//调用service查询(信息)
		List<Map<String, Object>> msglist = as.getMessageById(page);
		int count=as.getMessnumById(userid);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(msglist);
		response.getWriter().print(JSON.toJSONString(info));
	}
	@RequestMapping("/getPostIndex2")
	public void getPostIndex2(HttpSession session,HttpServletResponse response) throws IOException {
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		List<Map<String,Object>> list=as.getPostIndex2(userinfo.getId());
		response.getWriter().print(JSON.toJSONString(list));
	}	
	@RequestMapping("/getCommIndex")
	public void getCommIndex(HttpSession session,HttpServletResponse response) throws IOException {
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		List<Map<String,Object>> list=as.getCommIndex(userinfo.getId());
		response.getWriter().print(JSON.toJSONString(list));
	}		
	@RequestMapping("/getPostIndex")
	public void getPostIndex(HttpServletRequest request,HttpServletResponse response) throws IOException {
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
		int count = as.getPostNum(userid);
		List<Map<String, Object>> postList=as.getIndexPost(page);
		PageInfo info = new PageInfo();
		info.setTotal(count);
		info.setData(postList);
		response.getWriter().print(JSON.toJSONString(info));
	}
	@RequestMapping("/uploadimg")
	public @ResponseBody String uploadHead(HttpServletResponse response,HttpServletRequest request) throws IOException {
		String base64 = request.getParameter("base");
		base64 = base64.replace("data:image/png;base64,", "");
		// 指定文件上传的路径
		String realPath = request.getServletContext().getRealPath("upload");
		// 上传路径不存在需要创建该目录
		File path = new File(realPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		// 利用UUID完成图片的命名冲突，防止图片覆盖
		String fileName = UUID.randomUUID()+".jpg";
		String newFileName = realPath + File.separator +  fileName;
		// 1.上传图片
		PicEncode.generateImage(base64, newFileName);
		// 2.响应页面ajax请求
		ImgUploadBackData iubd = new ImgUploadBackData();
		iubd.setCode(1);
		iubd.setPath("upload"+File.separator+fileName);
		return JSON.toJSONString(iubd);	
	}
	@RequestMapping("/getReplyTop")
	public void getReplyTop(HttpServletResponse response) throws IOException {
		List<Map<String,Object>> list=as.getReplyTop();
		response.getWriter().print(JSON.toJSONString(list));
	}
	@RequestMapping("/getHotnote")
	public void getHotnote(HttpServletResponse response) throws IOException {
		List<Map<String,Object>> list=as.getHotnote();
		response.getWriter().print(JSON.toJSONString(list));
	}
	@RequestMapping("/getHotcomm")
	public void getHotcomm(HttpServletResponse response) throws IOException {
		List<Map<String,Object>> list=as.getHotcomm();
		response.getWriter().print(JSON.toJSONString(list));
	}
	@RequestMapping("/getTahome/{userid}")
	public String getTahome(@PathVariable("userid") String userid,HttpServletResponse response,Model model) throws IOException {
		Map<String,Object> user_map=us.getTaUser(Integer.parseInt(userid));
		List<Map<String,Object>> postlist=as.getPostIndex2(Integer.parseInt(userid));
		List<Map<String,Object>> commlist=as.getCommIndex(Integer.parseInt(userid));
		model.addAttribute("usermap",user_map);
		model.addAttribute("postlist",postlist);
		model.addAttribute("commlist",commlist);
		return "forward:/go/tahome";
	}	
	
	@RequestMapping("/addqiandao")
	public void addqiandao(Signinfo sign,HttpServletResponse response,HttpSession session) throws IOException {
		sign.setSigntime(new Date());
		Userinfo userinfo=(Userinfo) session.getAttribute("login_user");
		int num=as.checkqiandao(userinfo.getId());
		int count=1;
		System.out.println("*****************************************");
		System.out.println(num+"第一个");
		if(num==0) {
			count=as.addqiandao(sign);
		}
		response.getWriter().print(count);
	}
	
	@RequestMapping("/checkqiandao")
	public void checkqiandao(Signinfo sign,HttpServletResponse response,HttpSession session) throws IOException {
		sign.setSigntime(new Date());
		Userinfo userinfo=(Userinfo) session.getAttribute("login_user");
		int count=as.checkqiandao(userinfo.getId());
		System.out.println("*****************************************");
		System.out.println(count+"第二个");
		response.getWriter().print(count);
	}	
	@RequestMapping("/rili")
	public String checkdate(Model model,HttpServletResponse response,HttpSession session) throws IOException {
		List datelist=as.checkdate();
		datelist.add(datelist.get(0));
		datelist.add(datelist.get(1));
	/*	datelist.add(-3);*/
		model.addAttribute("datelist",datelist);
		Userinfo userinfo=(Userinfo) session.getAttribute("login_user");
		int count=as.checkqiandao(userinfo.getId());
		System.out.println("*****************************************");
		System.out.println(count);
		if(count==0) {
			model.addAttribute("bool",true);
		}else {
			model.addAttribute("bool",false);
		}
		return "forward:/go/rili";
	}	
}
