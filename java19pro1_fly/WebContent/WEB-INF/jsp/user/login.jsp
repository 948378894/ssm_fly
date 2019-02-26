<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登入</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/global.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
	<script>
	$(function(){
		/* <c:if test="${msg!=null }">
		alert('注册成功');
		</c:if> */
		$('#login_button').click(function(){
	
			if($('#L_email').val()!=""&&$('#L_pass').val()!=""){
				//发送ajax请求,查询数据库 ,验证邮箱
				$.ajax({
					url:'${pageContext.request.contextPath}/user/login',
					type:'post',
					data:{'login_email':$('#L_email').val(),
							'login_pass':$('#L_pass').val()
					},
					dataType:'json',
					async:true,
					success:function(data){
						console.log(data);
						if(data==0){
							$('#login_check_msg').html('用户名或密码错误').css('color','red').css('font-size','16px');
						}else if(data==1){
							window.location.href='${pageContext.request.contextPath}/go/index';
						}
					},
					error:function(){
						alert('登录异常');
					}
				})
			}else{
				alert("邮箱和密码不能为空!");
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
      <a class="nav-this" href="index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">      
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="${pageContext.request.contextPath }/go/index">
        <a class="unlogin" href="${pageContext.request.contextPath }/go/index"><i class="iconfont icon-touxiang"></i></a>
      <span><a href="${pageContext.request.contextPath }/go/login">登入</a>
      <a href="${pageContext.request.contextPath }/go/reg">注册</a></span>
      </a>
      <div class="nav">
        <a href="${pageContext.request.contextPath }/go/set"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="${ pageContext.request.contextPath}/go/logou"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
      
    </div>
  </div>
</div>

<div class="main layui-clear">

  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief">
      <ul class="layui-tab-title">
        <li class="layui-this">登入</li>
        <li><a href="${pageContext.request.contextPath }/go/reg">注册</a></li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form id="login_form" >
              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_email" name="email" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <span id="login_check_msg"></span>
              </div>
              
       <!--        <div class="layui-form-item">
                <label for="L_vercode" class="layui-form-label">人类验证</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;">1+1=?</span>
                </div>
              </div> -->
              <div class="layui-form-item">
                <button class="layui-btn" type="button" id="login_button">立即登录</button>
                <span style="padding-left:20px;">
                  <a href="forget.html">忘记密码？</a>
                </span>
              </div>
              <div class="layui-form-item fly-form-app">
                <span>或者使用社交账号登入</span>
                <a href="http://fly.layui.com:8098/app/qq" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
                <a href="http://fly.layui.com:8098/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
              </div>
            </form>
          </div>
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
<script src="${pageContext.request.contextPath }/res/layui/layui.js"></script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${pageContext.request.contextPath }/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '${pageContext.request.contextPath }/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>