<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			一共${page.countItem}条数据  
			一共 ${page.countPage}页  当前
		<input  id="currentPage" name="currentPage" value="${page.currentPage}"  style="width:24px">
		页  每页
			<select name="pageItem">
				<option ${page.pageItem==5 ? 'selected':''} >5</option>
				<option ${page.pageItem==10 ? 'selected':''}>10</option>
				<option ${page.pageItem==20 ? 'selected':''}>20</option>
				<option ${page.pageItem==50 ? 'selected':''}>50</option>
			</select>
		条
		
		<a  href="javascript:toPage(1)">首页</a>
		<a  href="javascript:toPage(2)">上一页</a>
		<a  href="javascript:toPage(3)">下一页</a>
		<a  href="javascript:toPage(4)">末页</a>
		<a  href="javascript:toPage(5)">跳转</a>


</body>
	

  		<script type="text/javascript">
  		// 找到当前页 的标签
  			var currentPage=document.getElementById("currentPage");
  			function  toPage(type){
  					//跳转首页
		  			if(type==1){
		  			currentPage.value=1;
		  			}else if(type==2){
		  			//上一页
		  			currentPage.value--;
		  			}else if(type==3){
		  				//下一页
		  			currentPage.value++;
		  			//末页
		  			}else if(type==4){
		  			currentPage.value=${page.countPage};
		  			}else if(type==5){
		  			}
			  	//当前页 不得 大于  最大页数 不得 小于最小页数
			  	var countPage = ${page.countPage};
			  	if(currentPage.value>countPage   || currentPage.value<1){
			  		currentPage.value=1;
			  		alert("当前页数不存在");
			  		return;
			  	}
			  	//页面上第一个表单提交
			  	getPage();
			  	
			  	
  			}
  		</script>
</html>

