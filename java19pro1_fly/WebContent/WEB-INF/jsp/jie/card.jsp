<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>基于Layui的轻量级问答社区页面模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/res/layui/css/layui.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/res/css/global.css">
  
  <!-- 下面为分页内容 -->
	<!-- 首先需要引入css样式表 与 js -->
    <link href="${pageContext.request.contextPath}/res/css/mricode.pagination.css" rel="stylesheet" type="text/css" charset="utf-8">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
    <style>
    	.fly-tab span button{display:inline-block; *display:inline; *zoom:1; vertical-align:top;}
    	.fly-tab span button{position: relative; height: 36px; line-height: 36px; padding: 0 20px; border-right: 1px solid #ddd; font-size: 14px; background-color: #fff;}
    </style>
    <script>
    $(function(){ 
    

    $.ajax({
		url : '${pageContext.request.contextPath}/article/getAllIndex',
		type : 'get',
		data:{'minid':0,
			'user-name':'all'	
		},
		dataType : 'json',
		async :true,
		success :function(data){
			var json = {
					'list' : data
			}
			var text = template('comm_list',json);
			$('#comm_ul').html(text);
		},
		error : function(){
			alert('帖子信息查询失败');
		}
	}) 

	$('.fly-tab span').find('button').click(function(){
		$('#us-name').val($(this).attr('user-name'));
		if($(this).attr('user-name')=="mypost"){
			if('${login_user}'==''){
  		  		var bool=confirm('您没有登录,不能查看自己贴子,是否前去登录');
  		  		if(bool){
  		  			window.location.href = '${ pageContext.request.contextPath }/go/login';
  		  		 }
  		  		}else{
			window.location.href='${pageContext.request.contextPath}/go/center';}
		}else{
			
		
		$.ajax({
			url : '${pageContext.request.contextPath}/article/getAllIndex',
			type : 'get',
			data:{'minid':0,
					'user-name':$(this).attr('user-name')	
			},
			dataType : 'json',
			async :true,
			success :function(data){
				var json = {
						'list' : data
				}
				var text = template('comm_list',json);
				$('#comm_ul').html(text);
			},
			error : function(){
				alert('帖子信息查询失败');
			}
		})
		}
	})
	
	
	$(document).scroll(function(){
		if($('#us-name').val()!="mypost"){
			if($(document).height()<=$(window).height()+$(document).scrollTop()){
			$.ajax({
					url : '${pageContext.request.contextPath}/article/getAllIndex',
				
				type : 'get',
				data:{'minid':$('#comm_ul').find('li:last-child').attr('comm-id'),
					'user-name':$('#us-name').val()	
				},
				dataType : 'json',
				async :true,
				success :function(data){
					var json = {
							'list' : data
					}
					var text = template('comm_list',json);
					$('#comm_ul').append(text);
				},
				error : function(){
					alert('帖子信息查询失败');
				}
			})
			
			}
		}
		})
    })
    </script>

    
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" style="background:url(${pageContext.request.contextPath}/res/images/sylg4.png) no-repeat;" href="http://www.sylu.edu.cn/sylusite/" title="沈阳理工大学官网">沈阳理工大学官网</a>
    <div class="nav">
      <a class="nav-this" href="${pageContext.request.contextPath}/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">
      <!-- 未登入状态 -->
				<c:if test="${ login_user == null }">
					<a class="unlogin" href="${ pageContext.request.contextPath }/go/login"><i
						class="iconfont icon-touxiang"></i></a>
					<span><a
						href="${ pageContext.request.contextPath }/go/login">登入</a><a
						href="${ pageContext.request.contextPath }/go/reg">注册</a></span>
					<p class="out-login">
						<a href=""
							onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})"
							class="iconfont icon-qq" title="QQ登入"></a> <a href=""
							onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})"
							class="iconfont icon-weibo" title="微博登入"></a>
					</p>
				</c:if>
				<!-- 登入后的状态 -->
				<c:if test="${ login_user != null }">
					<a class="avatar" href="${pageContext.request.contextPath }/go/home."> <img
						src="${ pageContext.request.contextPath }/res/images/avatar/${login_user.head}">
						<cite>${login_user.nickname}</cite> <i>SVIP18</i>
					</a>
					<div class="nav">
						<a href="${pageContext.request.contextPath }/go/set"><i class="iconfont icon-shezhi"></i>设置</a> <a
							href="${ pageContext.request.contextPath }/go/logou"><i
							class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退出</a>
					</div>
				</c:if>
    </div>
  </div>
</div>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span id="card-sapn">
         <button type="button" id="all" user-name="all">全部</button>
        <button type="button" id="noDone" user-name="noDone">未结帖</button>
        <button type="button" id="accept" user-name="accept">已采纳</button>
        <button type="button" id="cream" user-name="cream">精帖</button>
        <button type="button" id="mypost" user-name="mypost">我的帖</button>
         
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
         
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
       		<input type="hidden" id="us-name" value="all">
        </form>
        <a href="add.html" class="layui-btn jie-add">发布问题</a>
      </div>
    
      <ul class="fly-list" id="comm_ul">
 <!--        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">基于Layui的轻量级问答社区页面模版</a>
            <span class="fly-tip-stick">置顶</span>
            <span class="fly-tip-jing">精帖</span>
          </h2>
          <p>
            <span><a href="user/home.html">贤心</a></span>
            <span>刚刚</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 317
              <i class="iconfont" title="人气">&#xe60b;</i> 6830
            </span>
          </p>
        </li> -->
       
      </ul>
      
				<script type="text/html" id="comm_list">
					{{ each list as value i }}
					<li class="fly-list-li" comm-id="{{value.artid}}">
							<a href="${pageContext.request.contextPath}/article/getTahome/{{value.authorid}}" target="_blank" class="fly-list-avatar"> 
								<img src="${ pageContext.request.contextPath }/res/images/avatar/{{value.head}}" alt="">
							</a>
							<h2 class="fly-tip">
								<a href="${ pageContext.request.contextPath }/article/detail/{{value.artid}}">{{value.title}}</a>
									{{ if value.cream == 1 }}
									<span class="fly-tip-jing">精帖</span>
									{{ /if }}
							</h2>
							<p>
								<span><a href="${pageContext.request.contextPath}/article/getTahome/{{value.authorid}}" target="_blank">{{value.nickname}}</a></span> 
								<span>{{value.releasetime}} </span>
								<span>{{value.typename}}</span> <span class="fly-list-hint"> <i
									class="iconfont" title="回答">&#xe60c;</i> {{value.commentnum}} <i class="iconfont"
									title="人气">&#xe60b;</i> {{value.visitnum}}
								</span>
							</p>
						</li>
					{{ /each }}
				</script>
    
      
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
<script src="${ pageContext.request.contextPath }/res/layui/layui.js"></script>
<script>
layui.cache.page = 'jie';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${ pageContext.request.contextPath }/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '${ pageContext.request.contextPath }/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>