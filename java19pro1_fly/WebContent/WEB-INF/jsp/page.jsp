<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/res/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		function test(obj){
			/* alert(obj.attr('index')); */
			$.ajax({
				url : '${ pageContext.request.contextPath }/page',
				type : 'get',
				data : {
					'pageIndex' : obj.attr('index'),
					'pageSize' : 5
				},
				dataType : 'json',
				async : true,
				success : function(res){
					console.log(res.total);
					console.log(Math.ceil(res.total/5));
					console.log(res.data);
					$('#content').html('');
					for(var i = 0; i < res.data.length;i++){
						var $oP = $('<p>'+res.data[i]['nickname']+','+res.data[i]['title']+'</p>');
						$('#content').append($oP);
					}
				}
			})
		}
		$.ajax({
			url : '${ pageContext.request.contextPath }/page',
			type : 'get',
			data : {
				'pageIndex' : 0,
				'pageSize' : 5
			},
			dataType : 'json',
			async : true,
			success : function(res){
				console.log(res.total);
				console.log(Math.ceil(res.total/5));
				console.log(res.data);
				for(var i = 0; i < Math.ceil(res.total/5);i++){
					var $oA = $('<a href="javascript:;" style="margin-right:20px;">'+(i+1)+'</a>');
					// 给每一个页码加自定义索引
					$oA.attr('index',i);
					$oA.on('click',function(){
						test($(this));
					})
					$('#pagenum').append($oA);
				} 
				for(var i = 0; i < res.data.length;i++){
					var $oP = $('<p>'+res.data[i]['nickname']+','+res.data[i]['title']+'</p>');
					$('#content').append($oP);
				}
			}
		})
	})
</script>
</head>
<body>
	<div id="content"></div>
	<div id="pagenum"></div>
</body>
</html>