<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>帐号设置</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/layui/css/layui.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath}/res/css/global.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
<script>
	$(function(){
		
		$('#form_1').submit(function(){
			alert("修改成功!");
		})
		$('#form_2').submit(function(){
			if($('#L_pass').val()!=$('#L_repass').val()){
				$('#pass_check_msg2').html('两次密码输入不一致').css('color','red');
				return false;
			}
			if($('#L_pass').val().length<6||$('#L_pass').val().length>16){
				$('#pass_check_msg2').html('密码长度不符合规范').css('color','red');
				return false;
			}
			alert("修改成功!");
		})
		if($('#pass_check_msg').html()=='密码错误!请重新输入'){
			return false;
		}
		$('#L_email').blur(function(){
			if($('#L_email').val()!=""){
				//发送ajax请求,查询数据库 ,验证邮箱是否合法
				$.ajax({
					url:'${pageContext.request.contextPath}/user/set',
					type:'get',
					data:{'set_email':$('#L_email').val()},
					dataType:'json',
					async:true,
					success:function(data){
						if(data==0){
						$('#email_check_msg').html('邮箱可以修改').css('color','green');	
						}else if(data==1){
						$('#email_check_msg').html('邮箱已经被注册,无法修改').css('color','red');	
						}
						
					},
					error:function(){
						
					}
				})
			}
		})
		$('#L_nowpass').blur(function(){
			if($('#L_nowpass').val()!=""){
				$('#pass_check_msg').html('${pass_msg}')
				$.ajax({
					url:'${pageContext.request.contextPath}/user/pass',
					type:'get',
					data:{'set_pass':$('#L_nowpass').val()},
					dataType:'json',
					async:true,
					success:function(data){
						if(data==0){
						$('#pass_check_msg').html('密码正确').css('color','green');	
						}else if(data==1){
						$('#pass_check_msg').html('密码错误!请重新输入').css('color','red');	
						}
						
					},
					error:function(){
						
					}
			
				})
			}
		})
		
		$('#LAY-file').change(function(){
  			var sendData = new FormData($('#upload_head')[0]);
  			$.ajax({
  				url:'${pageContext.request.contextPath}/user/updateHeadImg',
  				type:'post',
  				data:sendData,
  				dataType:'json',
  				async:true,
  				processData:false,//不自动格式化数据
  				contentType:false,//不自动设置请求头
  				success:function(res){
  					if(res.status == 1){
  						$('.headurl').attr('src',res.src);
  						alert('修改头像成功!');
  						window.location.reload();
  					}
  					/* if(res.status==2){
						alert('请上传png/jpg/gif格式的头像！');
					}
					if(res.status == 3){
						alert('请上传小于100KB的图片！');
					} */
  				},
  				error:function(){
  					alert('错误!');
  				}
  			})
  		
  		})

		
	})
</script>

</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" style="background:url(${pageContext.request.contextPath}/res/images/sylg4.png) no-repeat;" href="http://www.sylu.edu.cn/sylusite/" title="沈阳理工大学官网">沈阳理工大学官网</a>
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
        <img class="headurl" src="${ pageContext.request.contextPath}/res/images/avatar/${login_user.head}">
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
    <li class="layui-nav-item layui-this">
      <a href="${ pageContext.request.contextPath}/go/set">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
    <li class="layui-nav-item">
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
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" lay-id="info">我的资料</li>
        <li lay-id="avatar">头像</li>
        <li lay-id="pass">密码</li>
        <li lay-id="bind">帐号绑定</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form id="form_1" method="post" action="${ pageContext.request.contextPath}/go/set">
            <div class="layui-form-item">
              <label for="L_email" class="layui-form-label" >邮箱</label>
              <div class="layui-input-inline">
                <input type="email" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="${login_user.email}" class="layui-input">
              </div>
               <div class="layui-form-mid layui-word-aux"><span id="email_check_msg">首次使用,或者果您在邮箱已激活的情况下，变更了邮箱，需</span><a href="${ pageContext.request.contextPath}/go/activate" style="font-size: 12px; color: #4f99cf;">验证邮箱</a>。</div>

            </div>
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" id="L_username" name="username" required lay-verify="required" autocomplete="off" value="${login_user.nickname}" class="layui-input">
              </div>
              <div class="layui-inline">
              <c:if test="${login_user.sex=='男' }">
               <div class="layui-input-inline">
                  <input type="radio" name="sex" value="男" checked title="男">
                  <input type="radio" name="sex" value="女" title="女">
                </div>
              </c:if>
               <c:if test="${login_user.sex!='男' }">
               <div class="layui-input-inline">
                  <input type="radio" name="sex" value="男"  title="男">
                  <input type="radio" name="sex" value="女" checked title="女">
                </div>
              </c:if>
              </div>
            </div>
            <div class="layui-form-item">
              <label for="L_city" class="layui-form-label">城市</label>
              <div class="layui-input-inline">
                <input type="text" id="L_city" name="city" autocomplete="off" value="${login_user.city }" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="sign" value="${login_user.sign }" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" id="layui-btn" >确认修改</button>
            </div>
            </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <div class="layui-form-item">
              <div class="avatar-add">
                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过30KB</p>
           			<form id="upload_head" enctype="multipart/form-data">
                  <input type="file" name="file" id="LAY-file" style="margin-top:20px;margin-left:140px;width:75px;padding:10px" >
              		</form>
                <img class="headurl" src="${ pageContext.request.contextPath}/res/images/avatar/${login_user.head}">
                <span class="loading"></span>
              </div>
            </div>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <form id="form_2" action="${ pageContext.request.contextPath}/go/pass" method="post" >
              <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div><span id="pass_check_msg"></span>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="pass_check_msg2">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" >确认修改</button>
              </div>
            </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <ul class="app-bind">
              <li class="fly-msg app-havebind">
                <i class="iconfont icon-qq"></i>
                <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span>
                <a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a>
                
                <!-- <a href="" onclick="layer.msg('正在绑定微博QQ', {icon:16, shade: 0.1, time:0})" class="acc-bind" type="qq_id">立即绑定</a>
                <span>，即可使用QQ帐号登录Fly社区</span> -->
              </li>
              <li class="fly-msg">
                <i class="iconfont icon-weibo"></i>
                <!-- <span>已成功绑定，您可以使用微博直接登录Fly社区，当然，您也可以</span>
                <a href="javascript:;" class="acc-unbind" type="weibo_id">解除绑定</a> -->
                
                <a href="" class="acc-weibo" type="weibo_id"  onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})" >立即绑定</a>
                <span>，即可使用微博帐号登录Fly社区</span>
              </li>
            </ul>
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