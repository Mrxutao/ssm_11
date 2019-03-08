<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function find(id) {
		location.href = "findprovider.do?id=" + id;
	}
	function toupdate(id) {
		if (confirm("确定修改?")) {
			location.href = "findidupdate.do?proid=" + id;
		}
	}
	function del(id) {
		if (confirm("确定删除?")) {
			location.href = "delprovider.do?id=" + id;
		}
	}
</script>
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>供应商管理页面</span>
	</div>
	<div class="search">
		<form method="post"
			action="${pageContext.request.contextPath }/provider/providerlist.do">
			<input name="pageIndex" value="${index}" type="hidden">
			 <span>供应商编码：</span>
			<input name="queryProCode" type="text" value="${proCode }">
			<span>供应商名称：</span> 
			<input name="queryProName" type="text"value="${proName }"> 
			
			<input value="查 询" type="submit"	id="searchbutton"> 
			<a href="${pageContext.request.contextPath }/provider/toAddProvideryemian.do">添加供应商</a>
		</form>
	</div>
	<!--供应商操作表格-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%">供应商编码</th>
			<th width="20%">供应商名称</th>
			<th width="10%">联系人</th>
			<th width="10%">联系电话</th>
			<th width="10%">传真</th>
			<th width="10%">创建时间</th>
			<th width="30%">操作</th>
		</tr>
		<c:forEach var="l" items="${providerList }" varStatus="status">
			<tr>
				<td><span>${l.proCode }</span></td>
				<td><span>${l.proName }</span></td>
				<td><span>${l.proContact}</span></td>
				<td><span>${l.proPhone}</span></td>
				<td><span>${l.proFax}</span></td>
				<td><span> <fmt:formatDate value="${l.creationDate}"
							pattern="yyyy-MM-dd" />
				</span></td>
				<td><span><a href="javascript:find(${l.id })"><img
							src="${pageContext.request.contextPath }/statics/images/read.png"
							alt="查看" title="查看" /></a></span> <span><a
						href="javascript:toupdate(${l.id });"><img
							src="${pageContext.request.contextPath }/statics/images/xiugai.png"
							alt="修改" title="修改" /></a></span> <span><a
						href="javascript:del(${l.id })"<%-- proid=${l.id } proname=${l.proName } --%>><img
							src="${pageContext.request.contextPath }/statics/images/schu.png"
							alt="删除" title="删除" /></a></span></td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="totalPageCount" value="${totalPageCount}" />
<c:import url="rollpage.jsp">
		<c:param name="totalCount" value="${totalCount}" />
		<c:param name="currentPageNo" value="${currentPageNo}" />
		<c:param name="totalPageCount" value="${totalPageCount}" />
	</c:import>
</div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除该供应商吗？</p>
			<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
		</div>
	</div>
</div>

<%@include file="common/foot.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/providerlist.js"></script>
