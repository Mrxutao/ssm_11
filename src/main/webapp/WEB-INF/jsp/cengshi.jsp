<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach items="${list }" var="l">
		<tr>
			<th>姓名:</th>
		</tr>
		<tr>
			<th>${l.userName }</th>
		</tr>
		</c:forEach>			
	</table>
	<h1>---------------->${list }</h1>
</body>
</html>