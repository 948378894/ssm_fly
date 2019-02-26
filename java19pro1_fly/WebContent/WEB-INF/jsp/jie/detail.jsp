<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Fly Template v2.0，基于 layui 的轻量级社区模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/res/layui/css/layui.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/res/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/mricode.pagination.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/mricode.pagination.js"></script>
	 <script src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
   <style>
  	.tab{display:none}
  </style>
  <script type="text/javascript">
  	$(function(){
  		$('#del_item').click(function(){
  			var bool = confirm('确定删除该文章?');
  			if(bool){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/delbyid',
  					data : {
  						"artid" : '${ artmap.artid }'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('删除成功');
  							window.location.href = '${ pageContext.request.contextPath }/go/index';
  						}
  					},
  					error :function(){
  						alert('删除失败');
  					}
  				})
  			}
  		})
  		$('#stick_1').click(function(){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/stick',
  					data : {
  						"artid" : '${ artmap.artid }'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('置顶成功');
  							window.location.href = '${ pageContext.request.contextPath }/go/index';
  						}
  					},
  					error :function(){
  						alert('错误');
  					}
  				})
  		})
  		$('#stick_2').click(function(){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/stick2',
  					data : {
  						"artid" : '${ artmap.artid }'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('取消置顶');
  							window.location.href = '${ pageContext.request.contextPath }/go/index';
  						}
  					},
  					error :function(){
  						alert('错误');
  					}
  				})
  		})
  		$('#cream').click(function(){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/cream',
  					data : {
  						"artid" : '${ artmap.artid }'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('加精成功');
  							window.location.href = '${ pageContext.request.contextPath }/go/index';
  						}
  					},
  					error :function(){
  						alert('错误');
  					}
  				})
  		})
  		$('#nocream').click(function(){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/nocream',
  					data : {
  						"artid" : '${ artmap.artid }'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('取消加精');
  							window.location.href = '${ pageContext.request.contextPath }/go/index';
  						}
  					},
  					error :function(){
  						alert('错误');
  					}
  				})
  		})
  		
  		// 评论的是评论
  		$(document).on('click','.small_remark',function(){
  			$(this).closest('div').next().toggleClass('tab');
  			var name = $(this).closest('li').find('cite').find('i').html();
  			$(this).closest('div').next().find('textarea').html('@'+name+':');
  		})
  		// 评论的是评论--2
  		$(document).on('click','.re_remark',function(){
  			var json = {
						'head' : '${login_user.head}', // 头像
						'nickname' : '${login_user.nickname}',// 昵称
						'remarktime' : '刚刚',// 时间
						'remarkcontent' : $(this).prev().val(),// 内容
						'goodnum' : 0, // 点赞
						'userid' : '${login_user.id}',// 用户id
						'authority' : '${login_user.authority}', // 权限
						'experience' : '${login_user.experience}'// 经验
				};
				var text = template('remark_model',json);
				$('#jieda').append(text);
				// 发ajax请求
				$.ajax({
					url : '${ pageContext.request.contextPath }/article/addremark',
					type : 'post',
					dataType : 'json',
					data : {
						'authorid' : '${login_user.id}',
						'commcontent' : $(this).prev().val(),
						'artidorcommid' : '${artmap.artid}',
						'writerid':'${artmap.authorid}'
					},
					success : function(data){
						alert('评论成功');
						// 将返回的主键值挂载在隐藏域中
						$('#jieda').find('li:last-child').find('input').val(data);
						window.location.reload();
					},
					async : true,
					error : function(){
						alert('评论失败');
					}
				})
				$(this).closest('div').toggleClass('tab');
  		})
  		
  		
  		
  	$('.remark').click(function(){
  		if('${login_user}'==''){
  		var bool=confirm('您没有登录,不能评论,是否前去登录');
  		if(bool){
  			window.location.href = '${ pageContext.request.contextPath }/go/login';
  		 }
  		}else{
  			 var json={
  					 	'head':'${login_user.head}',
  						'nickname' : '${login_user.nickname}',// 昵称
						'remarktime' : '刚刚',// 时间
						'remarkcontent' : $('#L_content').val(),// 内容
						'goodnum' : 0, // 点赞
						'userid' : '${login_user.id}',// 用户id
						'authority' : '${login_user.authority}', // 权限
						'experience' : '${login_user.experience}'// 经验
  			 };
  			 var text=template('remark_model',json);
  			 $('#jieda').append(text);
  			//发送ajax请求
  			$.ajax({
  				
  		
  			url : '${ pageContext.request.contextPath }/article/addremark',
  			type:'post',
  			dataType:'json',
  			data:{
  				'authorid':'${login_user.id}',
  				'commcontent':$('#L_content').val(),
  				'artidorcommid':'${artmap.artid}',
  					'writerid':'${artmap.authorid}'
  				},
  				async:true,
  				success:function(){
  						alert('评论成功');
  						window.location.reload();
  				
  				},
  				error:function(){
  					alert('错误');
  				}
  				
  			})
  			$('#L_content').val('');
  		 }
  	})
  	$('.del_remark').click(function(){
  		var bool=confirm('确定删除该评论!')
  		if(bool){
  				$.ajax({
  					url : '${ pageContext.request.contextPath }/article/delremark',
  					data : {
  						"commid" : $(this).closest('li').find('input').val(),
  						'artidorcommid':'${artmap.artid}'
  					},
  					dataType : 'json',
  					type : 'post',
  					success : function(data){
  						if(data == 1){
  							alert('删除成功');
  							window.location.reload();
  						}
  					},
  					error :function(){
  						alert('删除失败');
  					}
  				})
  			}
  		})
  		
  		$('.accept').click(function(){
  	  		var bool=confirm('是否采纳该评论!')
  	  		if(bool){
  	  				$.ajax({
  	  					url : '${ pageContext.request.contextPath }/article/accept',
  	  					data : {
  	  						"commid" : $(this).closest('li').find('input').val(),
  	  					"artid":'${artmap.artid}',
  	  					"authorid":'${comm.authorid}',
  	  					"offerkiss":'${artmap.paykiss}'
  	  					},
  	  					dataType : 'json',
  	  					type : 'post',
  	  					success : function(data){
  	  						if(data == 1){
  	  							alert('采纳成功');
  	  						window.location.reload();
  	  						}
  	  					},
  	  					error :function(){
  	  						alert('采纳失败');
  	  					}
  	  				})
  	  			}
  	  		})
  	  	$('#collection').click(function(){
  			if('${login_user}'==''){
  		  		var bool=confirm('您没有登录,不能收藏,是否前去登录');
  		  		if(bool){
  		  			window.location.href = '${ pageContext.request.contextPath }/go/login';
  		  		 }
  		  		}else{ 
  	  				$.ajax({
  	  					url : '${ pageContext.request.contextPath }/article/collection',
  	  					data : {
  	  						
  	  					"userid":'${login_user.id}',
  	  					"articleid":'${artmap.artid}'
  	  					
  	  					},
  	  					dataType : 'json',
  	  					type : 'post',
  	  					success : function(data){
  	  						if(data == 1){
  	  							alert('收藏成功');
  	  						window.location.reload();
  	  						}
  	  					},
  	  					error :function(){
  	  						alert('收藏失败');
  	  					}
  	  				})
  		  		}
  	  		})
  	  	$('#nocollection').click(function(){
  			
  	  				$.ajax({
  	  					url : '${ pageContext.request.contextPath }/article/nocollection',
  	  					data : {	
  	  					"userid":'${login_user.id}',
  	  					"articleid":'${artmap.artid}'
  	  					
  	  					},
  	  					dataType : 'json',
  	  					type : 'post',
  	  					success : function(data){
  	  						if(data == 1){
  	  							alert('取消成功');
  	  						window.location.reload();
  	  						}
  	  					},
  	  					error :function(){
  	  						alert('取消失败');
  	  					}
  	  				})
  		  	
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
      <a class="nav-this" href="${ pageContext.request.contextPath }/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    <%-- <input id="hide_artid" type="hidden" value="${ artmap.artid }"> --%>
    <div class="nav-user">
      <!-- 未登入状态 -->
				<c:if test="${ login_user == null }">
					<a class="unlogin" href="${ pageContext.request.contextPath }/go/login"><i
						class="iconfont icon-touxiang"></i></a>
					<span><a
						href="${ pageContext.request.contextPath }/go/login">登入</a><a
						href="user/reg.html">注册</a></span>
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


<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
        <h1>${artmap.title}</h1>
        <div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
        <c:if test="${ artmap.stick == 1 }">
         	<span class="fly-tip-stick">置顶帖</span>
        </c:if>
        <c:if test="${ artmap.cream == 1 }">
          <span class="fly-tip-jing">精帖</span>
        </c:if>  
        <c:if test="${ artmap.isdone == 0 }">
          <span>未结贴</span>
        </c:if>   
        <c:if test="${ artmap.isdone == 1 }">
          <span class="fly-tip-jie">已采纳</span>
        </c:if>
         <c:if test="${ login_user.authority == 1 || login_user.id == artmap.authorid }">
          	<span id="del_item" class="jie-admin" type="del" style="margin-left: 20px;">删除</span>
         </c:if>
        <c:if test="${ login_user.authority == 1}">
          <c:if test="${ artmap.stick == 0 }">
          	<span id="stick_1" class="jie-admin" type="set" field="stick" rank="1">置顶</span> 
          </c:if>
          <c:if test="${artmap.stick == 1}">
          	<span id="stick_2" class="jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span>
          </c:if>
          <c:if test="${artmap.cream == 0}">
          	<span id="cream" class="jie-admin" type="set" field="status" rank="1">加精</span>
          </c:if>
          <c:if test="${artmap.cream == 1}">
          	<span id="nocream" class="jie-admin" type="set" field="status" rank="0" style="background-color:#ccc;">取消加精</span>
          </c:if>
        </c:if>  
          <div class="fly-list-hint"> 
            <i class="iconfont" title="回答">&#xe60c;</i> ${artmap.commentnum}
            <i class="iconfont" title="人气">&#xe60b;</i> ${artmap.visitnum}
          </div>
        </div>
        <div class="detail-about">
          <a class="jie-user" href="">
            <img src="${pageContext.request.contextPath}/res/images/avatar/${login_user.head}" alt="">
            <cite>
              	${artmap.nickname}
              <em>${artmap.releasetime}</em>
            </cite>
          </a>
          <div class="detail-hits" data-id="{{rows.id}}">
            <span style="color:#FF7200">悬赏：${artmap.paykiss}飞吻</span>
            <c:if test="${ login_user.id == artmap.authorid }">
            	<span id="edit" class="layui-btn layui-btn-mini jie-admin" type="edit"><a href="${ pageContext.request.contextPath }/go/add?artid=${artmap.artid}">编辑此贴</a></span>
            </c:if>
            <c:if test="${login_user.id != artmap.authorid&&colllist.userid==null}">
            	<span id="collection" class="layui-btn layui-btn-mini jie-admin " type="collect" data-type="add">收藏</span>
            </c:if>
            <c:if test="${login_user.id ==colllist.userid&&login_user.id!=null}">
            <span id="nocollection" class="layui-btn layui-btn-mini jie-admin  layui-btn-danger" type="collect" data-type="add">取消收藏</span>
        	</c:if>
          </div>
        </div>
        
        <div class="detail-body photos" style="margin-bottom: 20px;">
 			${artmap.html_content}
        </div>
      </div>

      <div class="fly-panel detail-box" style="padding-top: 20px;">
        <a name="comment"></a>
        <ul class="jieda photos" id="jieda">
        <c:if test="${artlist!=null }">
        	<c:forEach items="${artlist }" var="comm" >
        		 <li data-id="12" class="jieda-daan">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="${pageContext.request.contextPath}/article/getTahome/${comm.authorid}" target="_blank">
                <img src="${ pageContext.request.contextPath }/res/images/avatar/${comm.head}" alt="">
                <cite>
                  <i>${comm.nickname}</i>
                  <c:if test="${comm.authorid == artmap.authorid}">
                  <em>(楼主)</em>
                  </c:if>
                  <c:if test="${comm.authority == 1}">
                  <em style="color:#5FB878">(管理员)</em>
                  </c:if>
                  <c:if test="${comm.experience > 100}">
                  <em style="color:#FF9E3F">（活雷锋）</em>
                  </c:if>
                </cite>
              </a>
              <div class="detail-hits">
                <span>${comm.commtime}</span>
              </div>
              <c:if test="${comm.isaccept == 1 }">
              	<i class="iconfont icon-caina" title="最佳答案"></i>
              </c:if>
            </div>
            <div class="detail-body jieda-body">
              <p>${comm.commcontent}</p>
            </div>
            <div class="jieda-reply">
              <span class="jieda-zan zanok" type="zan"><i class="iconfont icon-zan"></i><em>${comm.praisepoints}</em></span>
              <span class="small_remark" type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
              <div class="jieda-admin">
    
                <c:if test="${ login_user.id == comm.authorid || login_user.authority == 1 }">
                	<span class="del_remark" type="del">删除</span>
                </c:if>
                <c:if test="${ login_user.id == artmap.authorid && login_user.id != comm.authorid&&artmap.isdone==0}">
                	<span class="jieda-accept accept" type="accept">采纳</span>
                </c:if>
              </div>
            </div>
            <div class="tab" style="padding-top:10px;">
				<textarea placeholder="评论" row="10" col="90" class="layui-textarea fly-editor"></textarea>
				<button style="background:red;transform:scale(0.8);" type="button" class="layui-btn re_remark">提交回答</button>
			</div>
			<input type="hidden" value="${ comm.commid }">
          </li>
        	</c:forEach>
        </c:if>
        
        
         <%--  <li data-id="12" class="jieda-daan">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="${ pageContext.request.contextPath }/res/images/avatar/default.png" alt="">
                <cite>
                  <i>纸飞机</i>
                  <!-- <em>(楼主)</em>
                  <em style="color:#5FB878">(管理员)</em>
                  <em style="color:#FF9E3F">（活雷锋）</em>
                  <em style="color:#999">（该号已被封）</em> -->
                </cite>
              </a>
              <div class="detail-hits">
                <span>3分钟前</span>
              </div>
              <i class="iconfont icon-caina" title="最佳答案"></i>
            </div>
            <div class="detail-body jieda-body">
              <p>么么哒</p>
            </div>
            <div class="jieda-reply">
              <span class="jieda-zan zanok" type="zan"><i class="iconfont icon-zan"></i><em>12</em></span>
              <span type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
               <div class="jieda-admin">
                <span type="edit">编辑</span>
                <span type="del">删除</span>
                <span class="jieda-accept" type="accept">采纳</span>
              </div> 
            </div>
          </li>
           --%>
         
          
          <!-- <li class="fly-none">没有任何回答</li> -->
        </ul>
        
        <div class="layui-form layui-form-pane">
          <form action="javascript:;" method="post">
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                <textarea id="L_content" name="content" required lay-verify="required" placeholder="我要回答"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="hidden" name="jid" value="{{rows.id}}">
              <button class="layui-btn remark" type="button" >提交回答</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <div class="edge">
    <dl class="fly-panel fly-list-one" id="hotnote_dl"> 
      <dt class="fly-panel-title">最近热帖</dt>
    
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
      
    </dl>
    <script type="text/html" id="hotcomm_model">
		{{each hotcommlist as value i}}
				<dd>
					<a href="${pageContext.request.contextPath}/article/detail/{{value.id}}">{{value.title}}</a> <span><i
						class="iconfont">&#xe60c;</i> {{value.commentnum}}</span>
				</dd>
				{{/each}}
			</script>
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
<script type="text/html" id="remark_model">
	<li data-id="12" class="jieda-daan">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="${ pageContext.request.contextPath }/res/images/avatar/{{head}}" alt="">
                <cite>
                  <i>{{nickname}}</i>
				  {{ if userid == ${artmap.authorid} }}
                  <em>(楼主)</em>
				  {{ /if }}	
				  {{ if authority == 1 }}
                  <em style="color:#5FB878">(管理员)</em>
 				  {{ /if }}	
				  {{ if experience > 100 }}
                  <em style="color:#FF9E3F">（活雷锋）</em>
				  {{ /if }}	
                </cite>
              </a>
              <div class="detail-hits">
                <span>{{remarktime}}</span>
              </div>
              <i style="display:none" class="iconfont icon-caina" title="最佳答案"></i>
            </div>
            <div class="detail-body jieda-body">
              <p>{{remarkcontent}}</p>
            </div>
            <div class="jieda-reply">
              <span class="jieda-zan zanok" type="zan"><i class="iconfont icon-zan"></i><em>{{goodnum}}</em></span>
              <span class="small_remark" type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
              <div class="jieda-admin">
            
                <span type="del">删除</span>
  
              </div>
            </div>
			<div class="tab" style="padding-top:10px;">
				<textarea placeholder="评论" row="10" col="90" class="layui-textarea fly-editor"></textarea>
				<button style="background:red;transform:scale(0.8);" type="button" class="layui-btn">提交回答</button>
			</div>
			<input id="in_hidden" type="hidden" value="111">
          </li>
</script>
</body>
</html>