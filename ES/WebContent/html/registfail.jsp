<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>注册成功</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <script src="<%=request.getContextPath() %>/js/jquery-2.2.3.min.js" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js" charset="utf-8"></script>
</head>
<body>
<%
String name = request.getParameter("uname");
String password = request.getParameter("password"); 			 		
%>
<!--导航条-->
   <nav class="navbar navbar-default navbar-fixed-top">      
	<a class="navbar-brand glyphicon glyphicon-folder-open">&nbsp;题库管理系统>注册失败</a>
   </nav>
<!--导航条结束-->
<!-- 内容实体开始 -->
	<div class="container" style="width: 63%;font-family:serif;font-size: x-large;">
		<ul class="list-group" style="margin-top: 20%">
		  <li class="list-group-item list-group-item-danger glyphicon glyphicon-floppy-remove text-center">&nbsp;注册失败！</li>
		  <li class="list-group-item list-group-item-info glyphicon glyphicon-user">&nbsp;您注册的用户：<%= name %>&nbsp;已存在！</li>
		  <li class="list-group-item list-group-item-warning text-center">感谢使用！</li>
		</ul>
		<a href="<%=request.getContextPath() %>/html/login.jsp" class="btn btn-primary center-block" role="button">返回登录界面</a>
	</div>
<!-- 内容实体结束 -->
<!--脚注-->
    <footer class="center-block text-center" >
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
    </footer>
</body>
</html>