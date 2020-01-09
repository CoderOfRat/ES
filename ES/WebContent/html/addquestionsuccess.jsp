<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>添加成功</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <script src="<%=request.getContextPath() %>/js/jquery-2.2.3.min.js" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js" charset="utf-8"></script>
    
</head>
<body>

<!--导航条-->
   <nav class="navbar navbar-default navbar-fixed-top">      
	<a class="navbar-brand glyphicon glyphicon-folder-open">&nbsp;题库管理系统>添加试题成功</a>
   </nav>
<!--导航条结束-->
<!-- 内容实体开始 -->
	<div class="container" style="width: 63%;font-family:serif;font-size: x-large;margin-bottom: 10%">
	<%
		//此处或类似界面从requestServlet获取的数据编码和RegistServlet相同不必再次转换，这是由请求转发机制决定的
		String title = request.getParameter("title");
		String solution = request.getParameter("solution"); 			 		
	%>
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success glyphicon glyphicon-list-alt text-center">&nbsp;试题添加成功！</li>
		  <li class="list-group-item list-group-item-info">&nbsp;题目为：<%= title %></li>
		  <li class="list-group-item list-group-item-info">&nbsp;方案为：<%= solution %></li>
		</ul>
		<a href="<%= request.getContextPath() %>/html/manager.jsp" class="btn btn-primary center-block" role="button">返回管理员界面</a>
	</div>
<!-- 内容实体结束 -->
<!--脚注-->
    <footer class="center-block text-center" >
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
    </footer>
</body>
</html>