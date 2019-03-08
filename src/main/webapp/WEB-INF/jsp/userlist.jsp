<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<script type="text/javascript"src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function finduser(id){
		if(confirm("确认查看?")){
			location.href="finduser.do?id="+id;
		}
	}
	function toupdate(id){
		if(confirm("确认修改?")){
			location.href="toUpdate.do?id="+id;
		}
	}
</script>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/user/getuserlist.do">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>用户名：</span>
					 <input name="queryname" class="input-text"	type="text" value="${queryname}">
					 <span>用户角色：</span>
					 <select name="queryUserRole">
						<c:if test="${roleList != null }">
						   <option value="0">--请选择--</option>
						   	<c:forEach items="${roleList }" var="role">
						   	<option value="${role.id }">${role.roleName }</option>
						   	</c:forEach>
						  <%--  <c:forEach var="role" items="${roleList}">
						   		<option <c:if test="${role.id == queryUserRole}">selected="selected"</c:if>
						   		value="${role.id}">${role.roleName}</option>
						   </c:forEach> --%>
						</c:if>
	        		</select>
					 <input type="hidden" name="pageIndex" value="${index}"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath}/user/toUserAdd.do" >添加用户</a>
				</form>
            </div>
            <!--用户-->
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
				<c:if test="${ empty userList}">
					<c:redirect url="/getuserlist"></c:redirect>
				</c:if>
                   <c:forEach var="user" items="${userList}" varStatus="status">
					<tr>
						<td>
						<span>${user.userCode }</span>
						</td>
						<td>
						<span>${user.userName }</span>
						</td>
						<td>
							<span>
								<c:if test="${user.gender==1}">
									男
								</c:if>
								<c:if test="${user.gender==2}">
									女
								</c:if>
							</span>
						</td>
						<td>
						<span><fmt:formatDate value="${user.birthday }" pattern="yyyy-mm-dd"/></span>
						</td>
						<td>
						<span>${user.phone}</span>
						</td>
						<td>
						<c:if test="${user.userRole==1 }">
							<span>系统管理员</span>
						</c:if>
						<c:if test="${user.userRole==2 }">
							<span>经理</span>
						</c:if>
						<c:if test="${user.userRole==3 }">
							<span>普通员工</span>
						</c:if>
						</td>
						<td>
						<span><a   href="javascript:finduser(${user.id });"  ><img src="${pageContext.request.contextPath }/statics/images/read.png" alt="查看" title="查看"/></a></span>
						<span><a  href="javascript:toupdate(${user.id });"><img src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a  href="${pageContext.request.contextPath }/user/deluser.do?id=${user.id}" userid=${user.id } username=${user.userName } ><img src="${pageContext.request.contextPath }/statics/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}"/>
	          	<c:param name="currentPageNo" value="${currentPageNo}"/>
	          	<c:param name="totalPageCount" value="${totalPageCount}"/>
          	</c:import>
        </div>
    </section>
<c:if test="${modify=='ok'}">
	<script>
        alert("修改成功！");
	</script>
</c:if>
<c:if test="${modify=='no'}">
	<script>
        alert("修改失败！！！");
	</script>
</c:if>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/userlist.js"></script>
