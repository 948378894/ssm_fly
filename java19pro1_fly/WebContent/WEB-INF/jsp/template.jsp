<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="${ pageContext.request.contextPath }/res/js/jquery-2.1.4.min.js"></script>
  <script src="${pageContext.request.contextPath}/res/js/template-web.js"></script>
  <script>
  	$(function(){
  		var json={
  				'list':[
  				{'name':'张三','age':'22','sex':'男'},
  				{'name':'张三2','age':'32','sex':'男'},
  				{'name':'张三3','age':'12','sex':'女'}
  				]
  		}
  		var html=template('test_content',json);
  		$('#real_content').html(html);
  	})
  </script>
</head>
<body>
<div id="real_content"></div>
	<script type="text/html" id="test_content">
		<ul class="nostyle">
	
		{{ each list as value i}}
			{{if value.age<18}}
			<div>未成年人不让进</div>
			{{/if}}
			{{if value.age>18}}
			<li>{{i}} {{value.name}},{{value.age}},{{value.sex}}</li>
			{{/if}}
			
		{{/each}}
		
		</ul>
 	</script>
</body>
</html>