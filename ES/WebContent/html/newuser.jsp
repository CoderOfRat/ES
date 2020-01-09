<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <script src="<%=request.getContextPath() %>/js/jquery-2.2.3.min.js" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js" charset="utf-8"></script>
</head>
<body>
<!--导航条-->
   <nav class="navbar navbar-default navbar-fixed-top">      
	<a class="navbar-brand glyphicon glyphicon-folder-open">&nbsp;题库管理系统>注册</a>
   </nav>
<!--导航条结束-->
<!-- 内容实体开始 -->
	<div class="container" style="width: 63%">
		<img src="../images/newuser.svg" alt="注册" class="img-circle center-block" style="background: white;width: 20%">
		<form action="<%=request.getContextPath() %>/registServlet" method="post" role="form">
		  <div class="form-group">
		    <label for="exampleInputEmail1">用户名</label>
		    <input type="text" name="uname" class="form-control" id="exampleInputEmail1" placeholder="请输入少于20个字符">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密  码</label>
		    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="请输入少于16个字符">
		  </div>		  	
		  <button type="submit" class="btn btn-success">提交</button>
		  <button type="reset" class="btn btn-default">重置</button>
		  <a href="../html/login.jsp" class="btn btn-primary" role="button">返回</a>
		</form>
	</div>
<!-- 内容实体结束 -->
<!--脚注-->
    <footer class="center-block text-center" >
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
    </footer>
</body>
</html>