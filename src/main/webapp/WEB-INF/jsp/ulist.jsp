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
<script type="text/javascript">
	/* $(function() {
		getPage(1);
	})
	function getPage(pn) {
		$.ajax({
			url : "user/finfUserlist2.do",
			data : {
				"pn" : pn
			},
			type : "post",
			success : function(msg) {
				$("#user_list_div").html(msg);
			}
		});
	} */
</script>
</head>
<script type="text/javascript">
	 /* $(function(){
		getPage(1);
	})
	function getPage(){
		$.ajax({
			url:"user/finfUserlist2.do",
			data:{
				"pn":pn
			}, 
			type:"post",
			success:function(msg){
	// 				 $("#user_list_div").html(msg);
				console.log(msg);
			}
		});
	}  */
</script>
<body>
	<!--list集合   -->
	<div class="row">
		<center>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>用户id</td>
						<td>用户名</td>
						<td>用户地址</td>
					</tr>
				<thead>
				<tbody>
					<c:forEach items="${userList.list }" var="u">
						<tr>
							<td>${u.id }</td>
							<td>${u.userName }</td>
							<td>${u.address }</td>
						</tr>
					</c:forEach>
				<tbody>
					</center>
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