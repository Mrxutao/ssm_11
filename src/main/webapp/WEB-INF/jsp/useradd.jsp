<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/AddUser.do" enctype="multipart/form-data">
				
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                     <label for="userCode">用户编码：</label>
                    <input type="text" name="userCode" id="userCode" value="" onblur="checkUserCode()"> 
					<!-- 放置提示信息 -->
					<font id="msg" color="red"></font>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="" onblur="checkUserName()"> 
					<font id="name" color="red"></font>
                </div>
                <div>
                    <label for="userPassword">用户密码：</label>
                    <input type="password" name="userPassword" id="userPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">确认密码：</label>
                    <input type="password" name="ruserPassword" id="ruserPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label >用户性别：</label>
					<select name="gender" id="gender">
					    <option value="1" selected="selected">男</option>
					    <option value="2">女</option>
					 </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday">
					<font color="red"></font>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                   <input name="address" id="address"  value="">
                </div>
                <div>
                    <label for="idPic">身份证照：</label>
                    <input type="file" name="idPic" id="idPic"  value="">
                </div>
                <div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<select name="userRole" id="userRole">
						<option value="0">--请选择角色--</option>
						<option value="1">系统管理员</option>
						<option value="2">经理</option>
						<option value="3">普通员工</option>
					</select>
	        		<font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit"  value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
        </div>
</div>
</section>
<%@include file="common/foot.jsp" %>
<script type="text/javascript"src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function checkUserCode(){
		var url = "${pageContext.request.contextPath }/user/check.do";
		$.ajax({
			"type":"post",//请求方法
			"url":url,//请求地址
			"async":true,//同步/异步
			"data":"userCode="+$("#userCode").val(),//请求参数
			"dataType":"json",//返回数据类型
			"success":function(data){//处理成功的回调函数
				if(data.isExists==true){
					isExists = true;
					$("#msg").html("用户编码已经存在！");
				}else{
					isExists = false;
					$("#msg").html("");
				}
			}
		});
	}
	
	function checkUserName(){
		var url="${pageContext.request.contextPath}/user/checkName.do";
		$.ajax({
			"type":"post",//请求方法
			"url":url,//请求地址
			"async":true,//同步
			"data":"userName="+$("#userName").val(),//请求参数
			"dataType":"json",//返回数据类型
			"success":function(data){//处理成功的回调函数
				if(data.isExists==true){
					isExists==true;
					$("#name").html("用户名已经存在!");
				}else{
					isExists=false;
					$("#name").html("");
				}
			}
		});
	}
</script>
 <%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/useradd.js"></script> --%> 
