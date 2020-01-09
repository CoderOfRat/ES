<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>登录</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <script src="../js/jquery-2.2.3.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" charset="utf-8"></script>
</head>
<body>
<!--导航条-->
   <nav class="navbar navbar-default navbar-fixed-top">      
	<a class="navbar-brand glyphicon glyphicon-folder-open">&nbsp;题库管理系统>登录</a>
   </nav>
<!--导航条结束-->
<!-- 内容实体开始 -->
	<div class="container" style="width: 63%">
		<img src="../images/login.svg" alt="登录" class="img-circle center-block" style="background: gray;width: 20%">
		<form action="<%=request.getContextPath() %>/loginServlet" method="post" role="form">
		  <div class="form-group">
		    <label for="exampleInputEmail1">用户名</label>
		    <input type="text" name="uname" class="form-control" id="exampleInputEmail1" placeholder="请输入用户名">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密  码</label>
		    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
		  </div>
		  <button type="submit" class="btn btn-success">登录</button>
		  <a href="newuser.jsp" class="btn btn-primary" role="button">注册</a>		  
		  <a href="../index.html" class="btn btn-danger" role="button">退出</a>		  
		</form>
	</div>
<!-- 内容实体结束 -->
<!--脚注-->
    <footer class="center-block text-center" >
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
    </footer>
</body>
</html>