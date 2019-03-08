<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		getPage(1);
	})
	function getPage(pn){
 		$.ajax({
 			url:"user/finfUserlist3.do",
 			data:{
 				"pn":pn
 			}, 
 			type:"post",
 			success:function(msg){
				 $("#user_list_div").html(msg);
 			}
 		});
 	}
</script>
</head>
<body>
		<div id="user_list_div"></div> 
</body>
</html>