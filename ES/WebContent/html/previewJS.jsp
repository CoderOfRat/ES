<%@page import="com.coder_rat.mybeansandDAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.HashMap,java.util.Map,java.util.Iterator"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>预览题库试题</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<script src="<%=request.getContextPath()%>/js/jquery-2.2.3.min.js"
	charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	charset="utf-8"></script>
<!-- 此页面实现了题库的显示（预览） 在此页面还可以实现题库试题的删除操作 -->
</head>
<body>
	<!--导航条-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<a class="navbar-brand glyphicon glyphicon-folder-open">&nbsp;题库管理系统>预览</a>

		<ul class="nav navbar-nav navbar-right center-block">
			<li><a class="glyphicon glyphicon-arrow-left"
				<%if(request.getParameter("who").equalsIgnoreCase("admin")){%>
				href="<%=request.getContextPath()%>/html/manager.jsp"
				<% }%><%else if(request.getParameter("who").equalsIgnoreCase("user")){%>
					href="<%=request.getContextPath()%>/html/chooser.jsp"
				<%}%>
				>返回</a></li>
		</ul>
	</nav>
	<!--导航条结束-->
	<!-- 内容实体开始 -->
	<div class="container"
		style="width: 63%; font-family: serif; font-size: large; margin-bottom: 10%">

		<ul class="list-group">
			<li
				class="list-group-item list-group-item-success glyphicon glyphicon-list-alt text-center">&nbsp;Java单选题预览如下</li>
			<li class="list-group-item list-group-item-info" id="grade">
				<%
					Map<Integer, Questions> questionMap = new HashMap<Integer, Questions>();
					questionMap = (HashMap<Integer, Questions>) request.getAttribute("qst");
					Iterator<Map.Entry<Integer, Questions>> it = questionMap.entrySet().iterator();
					int i = 0;
					while (it.hasNext()) {
						i++;
						Map.Entry<Integer, Questions> entry = it.next();
				%>
				<span>					
					<%=i + ". " + entry.getValue().getTitle()%>
				</span> <br /> 
				<input type="radio" name="single<%=i %>" value="A" /><%= entry.getValue().getA() %><br>
				<input type="radio" name="single<%=i %>" value="B" /><%= entry.getValue().getB() %><br>
				<input type="radio" name="single<%=i %>" value="C" /><%= entry.getValue().getC() %><br>
				<input type="radio" name="single<%=i %>" value="D" /><%= entry.getValue().getD() %><br>
				<!-- 点击此按钮会执行删除操作通过一个deleteServlet执行并且刷新界面 -->
				<%if(request.getParameter("who").equalsIgnoreCase("admin")){%>
					<a class="btn btn-danger btn-sm" role="button"
						id="<%=entry.getKey()%>">删除</a>
				<%}else if(request.getParameter("who").equalsIgnoreCase("user")){} %>
				<button type="button" class="btn btn-info btn-sm" data-toggle="collapse"
					data-target="#J<%=i %>">答案</button>  
				<div id="J<%=i %>" class="collapse">
					&nbsp;<%=entry.getValue().getSolution()%></div><br>
				<%}%>
			</li>

		</ul>
	</div>
	<!-- 内容实体结束 -->
	<!--脚注-->
	<footer class="center-block text-center">
		<span class="glyphicon glyphicon-folder-open" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
	</footer>

	<!-- Ajax -->
	<script type="text/javascript">
		var tempUl = document.getElementById('grade');
		var teBut = tempUl.getElementsByTagName('a');
		for (var i = 0; i < teBut.length; i++) {
			teBut[i].onclick = function() {
				console.log(this.id);
				var xmlHttp;
				if (window.XMLHttpRequest) {
					xmlHttp = new XMLHttpRequest;
				} else {
					xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
				}
				console.log(this.id);
				xmlHttp.open("post", "deleteQuestionServletJS", true);
				xmlHttp.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xmlHttp.send("number=" + this.id);
				//xmlHttp.send();
				window.location.reload();
			}
		}
	</script>
</body>
</html>