<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>提示页面</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
  <script src="${pageContext.request.contextPath}/res/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/qiandao_js.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/qiandao_style.css">
<script>
		$(function(){
			//查询签到的日期
		/* 	$.ajax({
				url : '${pageContext.request.contextPath}/article/checkdate',
				type : 'post',
				
				dataType : 'json',
				async :true,
				success :function(data){
				
					$('#_handle2').val(data);
				},
				error : function(){
					alert('签到失败');
				}
			}) */
			$.ajax({
				url : '${pageContext.request.contextPath}/article/checkqiandao',
				type : 'post',
				data:{"signid":'${login_user.id}'
				},
				dataType : 'json',
				async :true,
				success :function(data){
					if(data!=0){
						$('#js-just-qiandao').addClass('actived');
						/*  $(".date" + myDate.getDate()).addClass('qiandao'); */
						 
					}
					
				},
				error : function(){
					alert('签到失败');
				}
			})
			
			
			
			
			
			
			
			
			$('#js-just-qiandao').click(function(){
				$.ajax({
					url : '${pageContext.request.contextPath}/article/addqiandao',
					type : 'post',
					data:{"signid":'${login_user.id}'
					},
					dataType : 'json',
					async :true,
					success :function(data){
					/* 	$('#_handle').val(false); */
						/* $('_handle').html((new Date().getDate())-1); */
						/* window.location.reload(); */
					},
					error : function(){
						alert('签到失败');
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
      <a class="nav-this" href="${ pageContext.request.contextPath }/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">
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
<!-- <script src="/demos/googlegg.js"></script> -->
<div class="qiandao-warp">
	<div class="qiandap-box">
		
		<div class="qiandao-con clear">
			<div class="qiandao-left">
				<div class="qiandao-left-top clear">
					<div class="current-date">2016年1月6日</div>
					<!-- <div class="qiandao-history qiandao-tran qiandao-radius" id="js-qiandao-history">我的签到</div> -->
				</div>
				<div class="qiandao-main" id="js-qiandao-main">
					<ul class="qiandao-list" id="js-qiandao-list" sign_f="true">
					</ul>
				</div>
			</div>
			<div class="qiandao-right">
				<div class="qiandao-top">
					<div class="just-qiandao qiandao-sprits" id="js-just-qiandao">
					</div>
					<p class="qiandao-notic">签到领取<span>50</span>飞吻，请坚持签到</p>
				</div>
				<div class="qiandao-bottom">
					<div class="qiandao-rule-list">
						<h4>签到规则</h4>
						<p>每天签到50飞吻</p>
					</div>
					<div class="qiandao-rule-list">
						<h4>其他说明</h4>
						<p>如果需要充值飞吻,请联系管理员</p>
						<p>不要上当受骗!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="text" value="${bool}" id="_handle"><input type="text" value="${datelist}" id="_handle2">
</div>
<!-- 我的签到 layer start -->
 <div class="qiandao-layer qiandao-history-layer">
	<!-- <div class="qiandao-layer-con qiandao-radius">
		<a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
		<ul class="qiandao-history-inf clear">
			<li>
				<p>连续签到</p>
				<h4>5</h4>
			</li>
			<li>
				<p>本月签到</p>
				<h4>17</h4>
			</li>
			<li>
				<p>总共签到数</p>
				<h4>28</h4>
			</li>
			<li>
				<p>签到累计奖励</p>
				<h4>30</h4>
			</li>
		</ul>
		<div class="qiandao-history-table">
			<table>
				<thead>
					<tr>
						<th>签到日期</th>
						<th>奖励</th>
						<th>说明</th>
					</tr>
				</thead>
				<table>
					<tr>
						<td>2016-1-6 14:23:45</td>
						<td>0.20</td>
						<td>连续签到19天奖励</td>
					</tr>
				</table>
			</table>
		</div>
	</div>
	<div class="qiandao-layer-bg"></div> -->
</div>
<!-- 我的签到 layer end -->
<!-- 签到 layer start -->
<c:if test="${bool==true}">
	<div class="qiandao-layer qiandao-active">
	<div class="qiandao-layer-con qiandao-radius">
		<a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
		<div class="yiqiandao clear">
			<div class="yiqiandao-icon qiandao-sprits"></div>您已连续签到<span>2</span>天
		</div>
		<div class="qiandao-jiangli qiandao-sprits">
			<span class="qiandao-jiangli-num">50<em>飞吻</em></span>
		</div>
	</div>
	<div class="qiandao-layer-bg"></div>
</div>
</c:if>

<!--  -->
<!-- 签到 layer end -->



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
$(function() {
    var signFun = function() {

        
      var dateArray=[-1,-2];
     var array=[];
        var $dateBox = $("#js-qiandao-list"),
            $currentDate = $(".current-date"),
            $qiandaoBnt = $("#js-just-qiandao"),
            _html = '',
            _handle = $('#_handle').val(),
            
            myDate = new Date();
        	/*var ;
        	;
        	dateArray=dayarr;*/
  /*   var daylist=$('_handle2').val(),
      array=daylist.split(',');
     for(var i=0;i<array.length;i++){
    	 dateArray.push(array[i]);
     }
     */
        function aa(){
        	var daylist=$('#_handle2').val();
            array=daylist.split(',');
        	return array;
        }
        dateArray=aa();
        dateArray.unshift(1,2);
        $currentDate.text(myDate.getFullYear() + '年' + parseInt(myDate.getMonth() + 1) + '月' + myDate.getDate() + '日');

        var monthFirst = new Date(myDate.getFullYear(), parseInt(myDate.getMonth()), 1).getDay();

        var d = new Date(myDate.getFullYear(), parseInt(myDate.getMonth() + 1), 0);
        var totalDay = d.getDate(); //获取当前月的天数

        for (var i = 0; i < 42; i++) {
            _html += ' <li><div class="qiandao-icon"></div></li>'
        }
        $dateBox.html(_html) //生成日历网格
        	$dateLi.eq(17).addClass("qiandao");
        var $dateLi = $dateBox.find("li");
        for (var i = 0; i < totalDay; i++) {
            $dateLi.eq(i + monthFirst).addClass("date" + parseInt(i + 1));
            for (var j = 0; j <=dateArray.length; j++) {
                if (i == dateArray[j]) {
                    $dateLi.eq(i + monthFirst).addClass("qiandao");
                }
            }
            if(!_handle){
            	$(".date" + myDate.getDate()).addClass('able-qiandao');
            }
        } //生成当月的日历且含已签到
       
</script>

</body>
</html>