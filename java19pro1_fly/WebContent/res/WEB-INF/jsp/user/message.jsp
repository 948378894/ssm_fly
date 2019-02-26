<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>我的消息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/layui/css/layui.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/mricode.pagination.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
	 <script src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
<script>
	$(function(){
		
		$('#page').pagination({
			pageIndex:0,
			pageSize:5,
			prevBtnText : '上一页',
		    nextBtnText : '下一页',
		    remote: {
		        url: '${ pageContext.request.contextPath }/article/getMessIndex',
		        success: function (res) {
		            // data为ajax返回数据
		            var json = {'messlist' : res.data}; 
		            var text = template('mess_model',json);
		           $('#message_ul').html(text);
		          
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
      <a class="nav-this" href="${ pageContext.request.contextPath}/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">      
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="${ pageContext.request.contextPath}/go/home">
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

<div class="main fly-user-main layui-clear">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="${ pageContext.request.contextPath}/go/home">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${ pageContext.request.contextPath}/go/center">
        <i class="layui-icon">&#xe612;</i>
        用户中心
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${ pageContext.request.contextPath}/go/set">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="${ pageContext.request.contextPath}/go/message">
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
	  <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
	    <button class="layui-btn layui-btn-danger" id="LAY_delallmsg">清空全部消息</button>
	    <div  id="LAY_minemsg" style="margin-top: 10px;">
        <!--<div class="fly-none">您暂时没有最新消息</div>-->
        <ul class="mine-msg" id="message_ul">
     <%--      <li data-id="123">
            <blockquote class="layui-elem-quote">
              <a href="/jump?username=Absolutely" target="_blank"><cite>Absolutely</cite></a>回答了您的求解<a target="_blank" href="/jie/8153.html/page/0/#item-1489505778669"><cite>layui后台框架</cite></a>
            </blockquote>
            <p><span>1小时前</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
          </li> --%>
   <!--        <li data-id="123">
            <blockquote class="layui-elem-quote">
              系统消息：欢迎使用 layui
            </blockquote>
            <p><span>1小时前</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
          </li> -->
        </ul>
         <script type="text/html" id="mess_model">
		{{each messlist as value i}}
			 <li data-id="123">
            <blockquote class="layui-elem-quote">
              <a href="${pageContext.request.contextPath}/article/detail?artid={{value.articleid}}" target="_blank"><cite>{{value.nickname}}</cite></a>回答了您的求解<a target="_blank" href="${pageContext.request.contextPath}/article/detail?artid={{value.articleid}}"><cite>{{value.title}}</cite></a>
            </blockquote>
            <p><span>{{value.replytime }}</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
          </li>
		{{/each}}
	      </script>
        
        
        
        <div style="text-align: center">
					<!-- <div class="laypage-main">
						<a href="jie/index.html" class="laypage-next">更多求解</a>
					</div> -->
					<!-- 放分页按钮的div -->
				<div id="page" class="m-pagination"></div>
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
<script src="${ pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${ pageContext.request.contextPath}/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '${ pageContext.request.contextPath}/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>