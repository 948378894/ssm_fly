<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/layui/css/layui.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/css/global.css">
   <link href="${pageContext.request.contextPath}/res/css/mricode.pagination.css" rel="stylesheet" type="text/css" charset="utf-8">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
	<script>
		$(function(){
			/*  $.ajax({
					url : '${pageContext.request.contextPath}/article/getPostIndex2',
					type : 'get',
					dataType : 'json',
					async :true,
					success :function(data){
						var json = {
								'postlist' : data
						}
						var text = template('post_model',json);
						$('#post_ul').html(text);
					},
					error : function(){
						alert('帖子信息查询失败');
					}
				})
			 $.ajax({
					url : '${pageContext.request.contextPath}/article/getCommIndex',
					type : 'get',
					dataType : 'json',
					async :true,
					success :function(data){
						var json = {
								'commlist' : data
						}
						var text = template('comm_model',json);
						$('#comm_ul').html(text);
					},
					error : function(){
						alert('帖子信息查询失败');
					}
				}) */
		})
	</script>
</head>
<body style="margin-top: 65px;">

<div class="header">
  <div class="main">
    <a class="logo" style="background:url(${pageContext.request.contextPath}/res/images/sylg4.png) no-repeat;" href="http://www.sylu.edu.cn/sylusite/" title="沈阳理工大学官网">沈阳理工大学官网</a>
    <div class="nav">
      <a class="nav-this" href="${ pageContext.request.contextPath }/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
   
    <div class="nav-user">      
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="${ pageContext.request.contextPath }/go/home">
        <img src="${ pageContext.request.contextPath}/res/images/avatar/${login_user.head}">
        <cite>${login_user.nickname}</cite>
        <i>SVIP18</i>
      </a>
      <div class="nav">
        <a href="${ pageContext.request.contextPath}/go/set"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="${ pageContext.request.contextPath}/go/logou"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退出</a>
      </div>
      
    </div>
  </div>
</div>

<div class="fly-home" style="background-image: url();">
  <img src="${ pageContext.request.contextPath}/res/images/avatar/${usermap.head}" alt="{{info.username}}">
  <h1>
    ${usermap.nickname}
    <c:if test="${usermap.sex=='男'}">
    	 <i class="iconfont icon-nan"></i> 
    </c:if>
    <c:if test="${usermap.sex=='女'}">
    	 <i class="iconfont icon-nv"></i> 
    </c:if>
    <!-- <i class="iconfont icon-nv"></i> -->
    
    <!-- <span style="color:#c00;">（超级码农）</span>
    <span style="color:#5FB878;">（活雷锋）</span>
    <span>（该号已被封）</span> -->
  </h1>
  <p class="fly-home-info">
    <i class="iconfont icon-zuichun" title="飞吻"></i><span style="color: #FF7200;">${usermap.kissnum}飞吻</span>
    <i class="iconfont icon-shijian"></i><span > <fmt:formatDate value="${usermap.regtime }" pattern="yyyy-MM-dd"/>   加入</span>
    <i class="iconfont icon-chengshi"></i><span>来自${usermap.city}</span>
  </p>
  <p class="fly-home-sign">${usermap.sign}</p>
</div>

<div class="main fly-home-main">
  <div class="layui-inline fly-home-jie">
    <div class="fly-panel">
      <h3 class="fly-panel-title">${usermap.nickname} 最近的提问</h3>
      <ul class="jie-row" id="post_ul">
        <!-- <li>
          <span class="fly-jing">精</span>
          <a href="/jie/{{item.id}}.html" class="jie-title">使用 layui 秒搭后台大布局（基本结构）</a>
          <i>1天前</i>
          <em>1136阅/27答</em>
        </li>
        -->
      <c:forEach items="${postlist }" var="post" >
      	<li>
      	<c:if test="${post.cream==1 }">
      	 <span class="fly-jing">精</span>
      	</c:if>
          <a class="jie-title" href="${pageContext.request.contextPath}/article/detail/{{post.id}}" target="_blank">${post.title}</a>
          <i>${post.releasetime }天前</i>
          <em>${post.visitnum}阅/${post.commentnum}答</em>
        </li>
        <div>${post.markdown_content}</div></br>
      </c:forEach>
      </ul>
      

<!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div> -->
    </div>
  </div>
  
  <div class="layui-inline fly-home-da">
    <div class="fly-panel">
      <h3 class="fly-panel-title">${usermap.nickname} 最近的回答</h3>
      <ul class="home-jieda" id="comm_ul">
       <!--  <li>
          <p>
          <span>1分钟前</span>
          在<a href="" target="_blank">tips能同时渲染多个吗?</a>中回答：
          </p>
          <div class="home-dacontent">
            尝试给layer.photos加上这个属性试试：
<pre>
full: true         
</pre>
            文档没有提及
          </div>
        </li>
        <li>
          <p>
          <span>5分钟前</span>
          在<a href="" target="_blank">在Fly社区用的是什么系统啊?</a>中回答：
          </p>
          <div class="home-dacontent">
            Fly社区采用的是NodeJS。分享出来的只是前端模版
          </div>
        </li> -->
        <c:forEach items="${commlist }" var="comm" >
         <li>
          <p>
          <span>${comm.commtime }天前</span>
        	  在<a href="${pageContext.request.contextPath}/go/add?artid=${comm.artid}" target="_blank">${comm.title}</a>中回答：
          </p>
          <div class="home-dacontent">
            ${comm.commcontent}
          </div>
        </li>
      </c:forEach>
        
      </ul>
    
      <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div> -->
    </div>
  </div>

</div>

<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/">layui.com</a></p>
  <p>
    <a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a>
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
  </p>
</div>

</body>
</html>