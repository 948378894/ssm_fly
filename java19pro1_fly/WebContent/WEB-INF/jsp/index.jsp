<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>基于 layui 的极简社区页面模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/mricode.pagination.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
	 <script src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
	<script type="text/javascript">
	$(function(){
		// 查询置顶帖子
		$.ajax({
			url : '${pageContext.request.contextPath}/article/getIndexStick',
			type : 'get',
			dataType : 'json',
			async :true,
			success :function(data){
				var json = {
						'sticklist' : data
				}
				var text = template('stick_model',json);
				$('#stick_ul').html(text);
			},
			error : function(){
				alert('帖子信息查询失败');
			}
		})
		
		// 查询非置顶帖子
		$("#no_page").pagination({
			pageIndex : 0,
		    pageSize: 10, 
		    prevBtnText : '上一页',
		    nextBtnText : '下一页',
		    remote: {
		        url: '${ pageContext.request.contextPath }/article/getIndexNoStick',
		        success: function (res) {
		            // data为ajax返回数据
		            var json = {'nosticklist' :res.data};
		            var text = template('comm_list',json);
		            $('#comm_ul').html(text);
		            console.log(res.data);
		            console.log(text);
		        }
		    }
		});
		 $.ajax({
				url : '${pageContext.request.contextPath}/article/getReplyTop',
				type : 'get',
				dataType : 'json',
				async :true,
				success :function(data){
					var json = {
							'replylist' : data
					}
					var text = template('reply_model',json);
					$('#reply_dl').html(text);
				},
				error : function(){
					alert('帖子信息查询失败');
				}
			})
			
			 $.ajax({
					url : '${pageContext.request.contextPath}/article/getHotnote',
					type : 'get',
					dataType : 'json',
					async :true,
					success :function(data){
						var json = {
								'hotnotelist' : data
						}
						var text = template('hotnote_model',json);
						$('#hotnote_dl').append(text);
					},
					error : function(){
						alert('帖子信息查询失败');
					}
				})
				 $.ajax({
						url : '${pageContext.request.contextPath}/article/getHotcomm',
						type : 'get',
						dataType : 'json',
						async :true,
						success :function(data){
							var json = {
									'hotcommlist' : data
							}
							var text = template('hotcomm_model',json);
							$('#hotcomm_dl').append(text);
						},
						error : function(){
							alert('帖子信息查询失败');
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
      <a class="nav-this" href="${pageContext.request.contextPath }/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">
      <!-- 未登入状态 -->
      <c:if test="${login_user==null }">
      
      <a class="unlogin" href="${pageContext.request.contextPath }/go/login"><i class="iconfont icon-touxiang"></i></a>
      <span><a href="${pageContext.request.contextPath }/go/login\">登入</a>
      <a href="${pageContext.request.contextPath }/go/reg.">注册</a></span>
      <p class="out-login">
        <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
        <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
      </p>   
      </c:if>
      <!-- 登入后的状态 -->
     
      <c:if test="${login_user!=null }">
      <a class="avatar" href="${pageContext.request.contextPath }/go/home">
        <img src="${ pageContext.request.contextPath}/res/images/avatar/${login_user.head}">
        <cite>${login_user.nickname}</cite>
        <i>SVIP18</i>
      </a>
      <div class="nav">
        <a href="${ pageContext.request.contextPath}/go/set"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="${ pageContext.request.contextPath}/go/logou"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退出</a>
      </div>
       </c:if>
     
      
    </div>
  </div>
</div>



	<div class="main layui-clear">
		<div class="wrap">
			<div class="content">
				<div class="fly-tab fly-tab-index">
					<span> <a href="${ pageContext.request.contextPath }/go/card">全部</a> <a
						href="${ pageContext.request.contextPath }/go/card">未结帖</a> 
						<a href="${ pageContext.request.contextPath }/go/card">已采纳</a> <a
						href="${ pageContext.request.contextPath }/go/card">精帖</a>
						 <a href="${ pageContext.request.contextPath }/go/card">我的帖</a>
					</span>
					<form action="http://cn.bing.com/search" class="fly-search">
						<i class="iconfont icon-sousuo"></i> <input class="layui-input"
							autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
					</form>
					<a href="${ pageContext.request.contextPath }/go/add"
						class="layui-btn jie-add">发布问题</a>
				</div>

			<!-- 置顶部分 -->
				<ul id="stick_ul" class="fly-list fly-list-top">
				<%-- <c:forEach items="${ artlist }" var="articleinfo">
				<c:if test="${ articleinfo.stick == 1 }">
					<li class="fly-list-li"><a href="user/home.html"
						class="fly-list-avatar"> <img
							src="${ pageContext.request.contextPath }/res/images/avatar/${articleinfo.headurl}" alt="">
					</a>
						<h2 class="fly-tip">
							<a href="jie/detail.html">${articleinfo.title}</a> 
							<c:if test="${articleinfo.stick == 1}">
								<span class="fly-tip-stick">置顶</span> 
							</c:if>
							<c:if test="${articleinfo.cream == 1}">
								<span class="fly-tip-jing">精帖</span>
							</c:if>
						</h2>
						<p>
							<span><a href="user/home.html">${articleinfo.nickname}</a></span> <span><fmt:formatDate value="${articleinfo.releasetime}" pattern="yyyy-MM-dd"/></span> 
							<span>${articleinfo.typename}</span>
							<span class="fly-list-hint"> <i class="iconfont"
								title="回答">&#xe60c;</i> ${articleinfo.commentnum} <i class="iconfont" title="人气">&#xe60b;</i>
								${articleinfo.visitnum}
							</span>
						</p></li>
						</c:if>
					</c:forEach> --%>
				</ul>
				
				<script type="text/html" id="stick_model">
					{{ each sticklist as value i }}
					<li class="fly-list-li"><a href="${pageContext.request.contextPath}/article/getTahome/{{value.authorid}}" target="_blank"
						class="fly-list-avatar"> <img
							src="${ pageContext.request.contextPath }/res/images/avatar/{{value.head}}" alt="">
					</a>
						<h2 class="fly-tip">
							<a href="${ pageContext.request.contextPath }/article/detail/{{value.artid}}">{{value.title}}</a> 
								<span class="fly-tip-stick">置顶</span> 
								{{ if value.cream == 1 }}
								<span class="fly-tip-jing">精帖</span>
								{{ /if }}
						</h2>
						<p>
							<span><a href="${pageContext.request.contextPath}/article/getTahome/{{value.authorid}}" target="_blank">{{value.nickname}}</a></span> <span>{{value.releasetime}}</span> 
							<span>{{value.typename}}</span>
							<span class="fly-list-hint"> <i class="iconfont"
								title="回答">&#xe60c;</i> {{value.commentnum}} <i class="iconfont" title="人气">&#xe60b;</i>
								{{value.visitnum}}
							</span>
						</p></li>
					{{ /each  }}
				</script>
				
				<!-- 普通文章部分 -->
				<ul id="comm_ul" class="fly-list">
					<%-- <c:forEach items="${ artlist }" var="articleinfo">
					<c:if test="${ articleinfo.stick == 0 }">
						<li class="fly-list-li">
							<!-- 头像是超链接，需要挂载用户id articleinfo.authorid-->
							<a href="user/home.html" class="fly-list-avatar"> 
								<img src="${ pageContext.request.contextPath }/res/images/avatar/${articleinfo.headurl}" alt="">
							</a>
							<h2 class="fly-tip">
								<!-- 文章标题需要挂载文章id -->
								<a href="jie/detail.html">${articleinfo.title}</a>
								<c:if test="${articleinfo.cream == 1}">
									<span class="fly-tip-jing">精帖</span>
								</c:if>
							</h2>
							<p>
								<span><a href="user/home.html">${articleinfo.nickname}</a></span> 
								<span><fmt:formatDate value="${articleinfo.releasetime}" pattern="yyyy-MM-dd"/> </span>
								<span>${articleinfo.typename}</span> <span class="fly-list-hint"> <i
									class="iconfont" title="回答">&#xe60c;</i> ${articleinfo.commentnum} <i class="iconfont"
									title="人气">&#xe60b;</i> ${articleinfo.visitnum}
								</span>
							</p>
						</li>
						</c:if>
					</c:forEach> --%>
				</ul>
				
				<script type="text/html" id="comm_list">
					{{ each nosticklist as value i }}
					<li class="fly-list-li">
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
				
				<div style="text-align: center">
					<!-- <div class="laypage-main">
						<a href="jie/index.html" class="laypage-next">更多求解</a>
					</div> -->
					<!-- 放分页按钮的div -->
					<div id="no_page" class="m-pagination"></div>
				</div>

			</div>
		</div>
		<div class="edge">
			<div class="fly-panel leifeng-rank">
				<h3 class="fly-panel-title">近一月回答榜 - TOP</h3>
				<dl id="reply_dl">
					<%-- <dd>
						<a href="user/home.html"> <img
							src="${ pageContext.request.contextPath }/res/images/avatar/default.png">
							<cite>纸飞机</cite> <i>159次回答</i>
						</a>
					</dd> --%>
				</dl>
				<script type="text/html" id="reply_model">
				{{each replylist as value i}}
				<dd>
				<a href="${pageContext.request.contextPath}/article/getTahome/{{value.userid}}" target="_blank"> <img
					src="${ pageContext.request.contextPath }/res/images/avatar/{{value.head}}">
					<cite>{{nickname}}</cite> <i>{{value.num}}次回答</i>
				</a>
			</dd>
				{{/each}}
				
				</script>
			</div>

			<dl class="fly-panel fly-list-one" id="hotnote_dl">
				<dt class="fly-panel-title">最近热帖</dt>
				
				<!-- <dd>
					<a href="jie/detail.html">Java实现LayIM后端的核心代码</a> <span><i
						class="iconfont">&#xe60b;</i> 767</span>
				</dd> -->
			</dl>
	<script type="text/html" id="hotnote_model">
		{{each hotnotelist as value i}}
				<dd>
					<a href="${pageContext.request.contextPath}/article/detail/{{value.id}}">{{value.title}}</a> <span><i
						class="iconfont">&#xe60b;</i> {{value.visitnum}}</span>
				</dd>
				{{/each}}
			</script>
			<dl class="fly-panel fly-list-one" id="hotcomm_dl">
				<dt class="fly-panel-title">近期热议</dt>
				<!-- 
				<dd>
					<a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a> <span><i
						class="iconfont">&#xe60f;</i> 96</span>
				</dd> -->
			</dl>
		<script type="text/html" id="hotcomm_model">
		{{each hotcommlist as value i}}
				<dd>
					<a href="${pageContext.request.contextPath}/article/detail/{{value.id}}">{{value.title}}</a> <span><i
						class="iconfont">&#xe60c;</i> {{value.commentnum}}</span>
				</dd>
				{{/each}}
			</script>
			<div class="fly-panel fly-link">
				<h3 class="fly-panel-title">友情链接</h3>
				<dl>
					<dd>
						<a href="http://www.layui.com/" target="_blank">layui</a>
					</dd>
					<dd>
						<a href="http://layim.layui.com/" target="_blank">LayIM</a>
					</dd>
					<dd>
						<a href="http://layer.layui.com/" target="_blank">layer</a>
					</dd>
				</dl>
				
			</div>


		</div>
	</div>

	<div class="footer">
		<p>
			<a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a
				href="http://www.layui.com/">layui.com</a>
		</p>
		<p>
			<a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a> <a
				href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
			<a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
		</p>
	</div>
	<script src="${ pageContext.request.contextPath }/res/layui/layui.js"></script>
</body>
</html>