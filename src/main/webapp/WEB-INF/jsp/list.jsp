<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/artDialog-master/css/ui-dialog.css">
<script
	src="<%=request.getContextPath()%>/js/artDialog-master/dist/dialog-plus-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>

<!-- 引入uploadify -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/uploadify/uploadify.css" />
<!--  引入bootstrap-->
<script
	src="${pageContext.request.contextPath }/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link
	href="${pageContext.request.contextPath }/js/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!--list集合   -->
	<div class="row">
		<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%">用户编码</th>
			<th width="20%">用户名称</th>
			<th width="10%">性别</th>
			<th width="10%">年龄</th>
			<th width="10%">电话</th>
			<th width="10%">用户角色</th>
			<th width="30%">操作</th>
		</tr>
		<c:forEach var="user" items="${userList.list }" varStatus="status">
			<tr>
				<td><span>${user.userCode }</span></td>
				<td><span>${user.userName }</span></td>
				<td><span> <c:if test="${user.gender==1}">男</c:if> <c:if
							test="${user.gender==2}">女</c:if>
				</span></td>
				<td><span>18</span></td>
				<td><span>${user.phone}</span></td>
				<td><c:if test="${user.userRole==1 }">
						<span>系统管理员</span>
					</c:if> <c:if test="${user.userRole==2 }">
						<span>经理</span>
					</c:if> <c:if test="${user.userRole==3 }">
						<span>普通员工</span>
					</c:if></td>
				<td><span><a href="javascript:find(${user.id })"><img
							src="${pageContext.request.contextPath }/images/read.png"
							alt="查看" title="查看" /></a></span> <span><a
						href="javascript:toupdate(${user.id })"><img
							src="${pageContext.request.contextPath }/images/xiugai.png"
							alt="修改" title="修改" /></a></span> <span><a
						href="javascript:userdel(${user.id })"><img
							src="${pageContext.request.contextPath }/images/schu.png"
							alt="删除" title="删除" /></a></span></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<!-- 分页 -->
	<div class="row">
		<div class="col-md-6" align="center">
			<h3>当前第${userList.pageNum }页 总共${userList.pages }页
				总共${userList.total }条</h3>
		</div>
		<div class="col-md-6" align="center">
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<!-- 禁用 class="disabled" 
			  		hasPreviousPage：是否有上一页  true
			  	-->
				<c:if test="${!userList.hasPreviousPage}">
					<li class="disabled"><a href="javascript:getPage(1)">首页</a></li>
					<li class="disabled"><a
						href="javascript:getPage(${userList.prePage })"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${userList.hasPreviousPage}">
					<li><a href="javascript:getPage(1)">首页</a></li>
					<li><a href="javascript:getPage(${userList.prePage })"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach items="${userList.navigatepageNums }" var="nav">
					<c:if test="${userList.pageNum == nav}">
						<li class="active"><a href="javascript:getPage(${nav})">${nav }</a></li>
					</c:if>
					<c:if test="${userList.pageNum != nav}">
						<li><a href="javascript:getPage(${nav})">${nav }</a></li>
					</c:if>
				</c:forEach>
				<!-- 尾页和下一页的禁用 -->
				<c:if test="${userList.hasNextPage}">
					<li><a href="javascript:getPage(${userList.nextPage })"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<li><a href="javascript:getPage(${userList.pages })">尾页</a></li>
				</c:if>
				<c:if test="${!userList.hasNextPage}">
					<li class="disabled"><a
						href="javascript:getPage(${userList.nextPage })" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
					<li class="disabled"><a
						href="javascript:getPage(${userList.pages })">尾页</a></li>
				</c:if>
			</ul>
			</nav>
		</div>
	</div>



	<%-- <form id="page_form">
		<jsp:include page="page-form.jsp"></jsp:include>
	</form> --%>
	</center>
</body>
</html>