<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <form:form modelAttribute="user">
        <div class="providerView">
            <p><strong>用户编号：</strong><span>${user.userCode }</span></p>
            <p><strong>用户名称：</strong><span>${user.userName }</span></p>
            <p><strong>用户性别：</strong>
            	<span>
            		<c:if test="${user.gender == 1 }">男</c:if>
					<c:if test="${user.gender == 2 }">女</c:if>
				</span>
			</p>
            <p><strong>出生日期：</strong><span><form:input path="birthday"/></span></p>
            <p><strong>用户电话：</strong><span>${user.phone }</span></p>
            <p><strong>用户地址：</strong><span>${user.address }</span></p>
			<c:if test="${user.userRole==1 }"><p><strong>用户角色：</strong><span>系统管理员</span></p></c:if>
			<c:if test="${user.userRole==2 }"><p><strong>用户角色：</strong><span>经理</span></p></c:if>
			<c:if test="${user.userRole==3 }"><p><strong>用户角色：</strong><span>普通员工</span></p></c:if>
			<p><strong>证件照:<img src="${pageContext.request.contextPath }${user.idPicPath}" width="500px",height="150px"></strong></p>
            <%-- <p><strong>用户角色：</strong><span>${user.userRoleName}</span></p> --%>
			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
    </form:form>
</section>
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userview.js"></script>