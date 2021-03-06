<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/img/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>标题</title>        
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
  
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/artDialog-master/css/ui-dialog.css">
	<script src="${pageContext.request.contextPath }/js/artDialog-master/dist/dialog-plus-min.js"></script>
	<script type="text/javascript"  src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>
	
	<!-- 引入uploadify -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadify/jquery.uploadify.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/uploadify/uploadify.css" />
	
	<!-- 引入bootstrap -->
	<script src="${pageContext.request.contextPath }/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	
 </head>
 <body>
 	<div class="container-fluid">
 		<!-- <!-- 标题 -->
 		<div class="row" >
 			<div class="col-md-12" align="center">
	 			<h1>欢迎登录用户管理系统</h1>
 			</div>
 		</div>
 		增加按钮
 		<div class="row">
 			<div class="col-md-4 col-md-offset-8" align="center">
 				<button type="button" class="btn btn-success" data-toggle="modal"  data-target="#add_user_div">增加</button>
 				<button type="button" class="btn btn-success" onclick="buildAddUserPage()">增加</button>
 				<button type="button" class="btn btn-danger">删除</button>
 			</div>
 		</div> -->
 		
 		<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
	</div>
	<div class="search">
		<form method="get"
			action="${pageContext.request.contextPath }/user/findlist.do">
			<input type="hidden" name="opr" value="userlike"> <input
				type="hidden" name="id" value="${user.id }"> <span>用户名：</span>
			<input name="queryname" class="input-text" type="text"
				value="${queryUserName }"> <span>用户角色：</span> <select
				name="queryUserRole">
				<option value="">--请选择角色--</option>
				<option value="1">系统管理员</option>
				<option value="2">经理</option>
				<option value="3">普通员工</option>
			</select> <input type="hidden" name="pageIndex" value="1" /> <input
				value="查 询" type="submit" id="searchbutton"> <a
				href="${pageContext.request.contextPath}/user/toUserAdd.do">添加用户</a>
		</form>
	</div>
 		<!-- ajax返回list页面，存放 -->
 		
 		
 		
	</div>
 	<div id="user_list_div"></div> 
 	
 	<!-- <center>
 		<input type="button" value="增加" onclick="buildAddUserPage()"/>
		<div id="user_list_div"></div> 
	</center> -->
	
 </body>
 <script type="text/javascript">
 	$(function(){
 		getPage(1);
 		
 		<%-- $("#uploadify").uploadify({
 		 	// 插件自带 不可忽略的参数
 		 	'swf': '<%=request.getContextPath()%>/js/uploadify/uploadify.swf',
 		 	// 前台请求后台的 url  不可忽略的参数
 		 	'uploader': '<%=request.getContextPath()%>/user/uploadImg.do',
 		 	// 给 div 的进度条加背景 不可忽略
 		 	'queueID': 'fileQueue',
 		 	// 上传文件文件名
 		 	'fileObjName' : 'img',
 		 	// 给上传按钮设置文字
 		 	'buttonText': ' 上传文件 ',
 		 	// 设置文件是否自动上传
 		 	'auto': true,
 		 	// 可以同时选择多个文件 默认为 true 不可忽略
 		 	'multi': true,
 		 	// 上传后队列是否消失
 		 	'removeCompleted': true,
 		 	// 队列消失时间
 		 	'removeTimeout' : 1,
 		 	// 上传文件的个数，项目中一共可以上传文件的个数
 		 	'uploadLimit': -1,
 		 	'fileExt': '*.*;',
 		 	// 成功回调函数 file ：文件对象。 data 后台输出数据
 		 	'onUploadSuccess':function(file,data,response){
 			 	$("#userImg").prop("src","<%=imgPath %>"+data);
 			 	$("#userImgInp").val(data);
 			 }
 		 	}); --%>
 	 	
 	})
 	function getPage(pn){
 		$.ajax({
 			url:"user/finfUserlist2.do",
 			data:{
 				"pn":pn
 			}, 
 			type:"post",
 			success:function(msg){
				 $("#user_list_div").html(msg);
 			}
 		});
 	}
 	
 	function buildAddUserPage(){
 		
 		//重置表单
 		$("#add_user_list")[0].reset();
 		//重置图片
 		$("#userImg").prop("src","");
 		
 		$('#add_user_div').modal({
 			 backdrop: false
 		});
 		
 		/* var addPage;
 		$.ajax({
			url:"user/toAddUserPaeg.do", 		
			type:"post",
			async:false,
			datatype:"text",
			success:function(data){
				addPage=data;
			}
 		});
 		var add_from = dialog({
 			title: '增加用户',
 			content: addPage,
 			okValue: '确 定',
 			ok: function () {
 				addUser();
 			},
 			cancelValue: '取消',
 			cancel: function () {
 				this.title('已经取消..',1);
 			}
 		});
 		add_from.show(); */
 	}
 	
 	function addUser(){
 		$.ajax({
 			url:"user/addUser.do",
 			data:$("#add_user_list").serialize(),
 			type:"post",
 			success:function(msg){
				 alert("增加成功！");
				 //关闭增加模态框
				 $('#add_user_div').modal('hide')
				 getPage(1);
 			},
 			error:function(){
 				alert("错误！");
 			}
 		});
 	}
 </script>
</html>