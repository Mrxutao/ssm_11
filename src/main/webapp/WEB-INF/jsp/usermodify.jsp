<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="common/head.jsp"%>
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面 >> 用户修改页面</span>
	</div>
	<div class="providerAdd">
	<form:form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/userupdate.do" modelAttribute="user">
		<form  action="${pageContext.request.contextPath }/user/userupdate.do"> <input
				type="hidden" name="id" value="${user.id }" />
			<div>
				<label for="userName">用户名称：</label> <input type="text"
					name="userName" id="userName" value="${user.userName }"> <font
					color="red"></font>
			</div>
			<div>
				<label>用户性别：</label> <select name="gender" id="gender">
					<c:choose>
						<c:when test="${user.gender == 1 }">
							<option value="1" selected="selected">男</option>
							<option value="2">女</option>
						</c:when>
						<c:otherwise>
							<option value="1">男</option>
							<option value="2" selected="selected">女</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			 <div>
				<label for="data">出生日期：</label> 
				<form:input path="birthday"/>
				
			</div> 

			<div>
				<label for="userphone">用户电话：</label> <input type="text" name="phone"
					id="phone" value="${user.phone }"> <font color="red"></font>
			</div>
			<div>
				<label for="userAddress">用户地址：</label> <input type="text"
					name="address" id="address" value="${user.address }">
			</div>
			<div>
				<label>用户角色：</label> <select name="userRole" id="userRole">
				<%-- 	<c:choose> --%>
					<c:if test="${user.userRole == 1 }">
						<option value="1" selected="selected">系统管理员</option>
						<option value="2">经理</option>
						<option value="3">普通员工</option>
					</c:if>
					<c:if test="${user.userRole == 2 }">
						<option value="2" selected="selected">经理</option>
						<option value="1">系统管理员</option>
						<option value="3">普通员工</option>
					</c:if>
					<c:if test="${user.userRole == 3 }">
						<option value="3" selected="selected">普通员工</option>
						<option value="1">系统管理员</option>
						<option value="2">经理</option>
					</c:if>
						<%-- <c:when test="${user.userRole == 1 }">
							<option value="1" selected="selected">系统管理员</option>
							<option value="2">经理</option>
							<option value="2">普通员工</option>
						</c:when>
						<c:otherwise>
							<option value="1">男</option>
							<option value="2" selected="selected">女</option>
						</c:otherwise>
					</c:choose> --%>
				</select>
			</div>
			<div class="providerAddBtn">
				<input type="submit"  value="保存" /> <input
					type="button" id="back" name="back" value="返回" />
			</div>
		</form>
		</form:form>
	</div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/usermodify.js"></script>