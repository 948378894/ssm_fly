<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
  <script src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
  <script src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mricode.pagination.css">
  <script src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
  <script type="text/javascript">
  	$(function(){
  		//查询收藏的帖子
  		$('#page').pagination({
			pageIndex:0,
			pageSize:5,
			prevBtnText : '上一页',
		    nextBtnText : '下一页',
		    remote: {
		        url: '${ pageContext.request.contextPath }/article/getindex',
		        success: function (res) {
		            // data为ajax返回数据
		            var json = {'colllist' :res.data,
		            		'total':res.total};
		            var text = template('coll_list',json);
		   			var text1 = template('coll_count',json)
		            $('#coll_ul').html(text);
		            $('#coll1').html(text1);
		        }
		    }
		})
		//查询发布的帖子
		$('#post_page').pagination({
			pageIndex:0,
			pageSize:5,
			prevBtnText : '上一页',
		    nextBtnText : '下一页',
		    remote: {
		        url: '${ pageContext.request.contextPath }/article/getPostIndex',
		        success: function (res) {
		            // data为ajax返回数据
		            var json = {'postlist' :res.data,
		            		'total':res.total};
		            var text = template('post_list',json);
		   			var text1 = template('post_count',json)
		            $('#post_ul').html(text);
		            $('#post1').html(text1);
		        }
		    }
		})
  	})
  </script>
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly">Fly社区</a>
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
					<a class="avatar" href="${pageContext.request.contextPath }/go/home"> <img
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


<div class="main fly-user-main layui-clear">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/go/home">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="${pageContext.request.contextPath}/gor/center">
        <i class="layui-icon">&#xe612;</i>
        用户中心
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/go/set">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/go/message">
        <i class="layui-icon">&#xe611;</i>
        我的消息
      </a>
    </li>
  </ul>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="fly-panel fly-panel-user" pad20>
    <!--
    <div class="fly-msg" style="margin-top: 15px;">
      您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
    </div>
    -->
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖（<span id="post1"></span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">我收藏的帖（<span id="coll1"></span>）</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <ul id="post_ul" class="mine-view jie-row">
           
          </ul>
	<script type="text/html" id="post_list">
		{{each postlist as value i}}
			<li>
              <a class="jie-title" href="${pageContext.request.contextPath}/article/detail?artid={{value.id}}" target="_blank">{{value.title}}</a>
              <i>发帖时间 {{value.releasetime}}</i>
              <a class="mine-edit" href="/jie/edit/8116">编辑</a>
              <em>{{value.visitnum}}阅/{{value.commentnum}}答</em>
            </li>
		{{/each}}
		  </script>
		  <script type="text/html" id="post_count">
			{{total}}
		  </script>
          <div style="text-align: center">
					<!-- <div class="laypage-main">
						<a href="jie/index.html" class="laypage-next">更多求解</a>
					</div> -->
					<!-- 放分页按钮的div -->
				<div id="post_page" class="m-pagination"></div>
		 </div>
        </div>
        <div class="layui-tab-item">
          <ul id="coll_ul" class="mine-view jie-row">
            
          </ul>
       <script type="text/html" id="coll_list">
		{{each colllist as value2 i}}
			<li>
              <a class="jie-title" href="${pageContext.request.contextPath}/article/detail?artid={{value2.articleid}}" target="_blank">{{value2.title}}</a>
              <i>收藏于 {{value2.colltime}}</i> 
 			</li>
		{{/each}}
	      </script>
	      <script type="text/html" id="coll_count">
			{{total}}
		  </script>
          <div style="text-align: center">
					<!-- <div class="laypage-main">
						<a href="jie/index.html" class="laypage-next">更多求解</a>
					</div> -->
					<!-- 放分页按钮的div -->
				<div id="page" class="m-pagination"></div>
		 </div>
          <!-- <div id="LAY_page1"></div> -->
        </div>
      </div>
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
<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '${pageContext.request.contextPath}/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>