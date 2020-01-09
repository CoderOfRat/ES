<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat,java.util.Date"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>题库管理系统</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <script src="../js/jquery-2.2.3.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" charset="utf-8"></script>
</head>
<body>
 <!--导航条-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
            	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		           <span class="sr-only">Toggle navigation</span>
		           <span class="icon-bar"></span>
		           <span class="icon-bar"></span>
		           <span class="icon-bar"></span>
		        </button>
                <a class="navbar-brand  glyphicon glyphicon-folder-open">&nbsp;题库管理系统>选题</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">              
                    <li class="dropdown">
                      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">导出试题为Excel <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li>
                        	<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from c_bank_judge&course=C语言判断题">C语言>判断 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,A,B,C,D,solution from c_bank_single&course=C语言单选题">C语言>单选 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from c_bank_jqquiz&course=C语言简答题">C语言>简答 </a></li>						
							<li role="separator" class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from cpp_bank_judge&course=CPP判断题">C++&nbsp;&nbsp;&nbsp;>判断 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,A,B,C,D,solution from cpp_bank_single&course=CPP单选题">C++&nbsp;&nbsp;&nbsp;>单选 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from cpp_bank_jqquiz&course=CPP简答题">C++&nbsp;&nbsp;&nbsp;>简答 </a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from java_bank_judge&course=Java判断题">Java&nbsp;&nbsp;>判断 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,A,B,C,D,solution from java_bank_single&course=Java单选题">Java&nbsp;&nbsp;>单选 </a>
							<a href="<%=request.getContextPath()%>/autoExportServlet?sql=select title,solution from java_bank_jqquiz&course=Java简答题">Java&nbsp;&nbsp;>简答 </a>
						</li>
                      </ul>
                    </li>			 	
                </ul>
                <ul class="nav navbar-nav navbar-right">
 			        <li><a class="glyphicon glyphicon-home" href="../index.html">退出</a></li>        
                </ul>
            </div>
        </div>
    </nav>
<!--导航条结束-->
<div class="page-header text-center">
  <h1>题库管理系统1.1 <small>登陆时间：<% SimpleDateFormat myFmt1=new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss"); 
  Date now=new Date();
  String rq=myFmt1.format(now);out.print(rq); %></small></h1>
</div>
<div class="col-lg-4">
	<h3 class="text-center">试题预览</h3>
	<dl class="dl-horizontal" style="font-size: large;">
	  <dt>C语言</dt>
	  <dd><a href="<%=request.getContextPath()%>/previewServletCJ?who=user">判断题 </a> · <a href="<%=request.getContextPath()%>/previewServletCS?who=user">单选题</a> · <a href="<%=request.getContextPath()%>/previewServletCJQ?who=user">简答题</a></dd>
	  <dt>C++</dt>
	  <dd><a href="<%=request.getContextPath()%>/previewServletCppJ?who=user">判断题 </a> · <a href="<%=request.getContextPath()%>/previewServletCppS?who=user">单选题</a> · <a href="<%=request.getContextPath()%>/previewServletCppJQ?who=user">简答题</a></dd>
	  <dt>Java</dt>
	  <dd><a href="<%=request.getContextPath()%>/previewServletJJ?who=user">判断题 </a> · <a href="<%=request.getContextPath()%>/previewServletJS?who=user">单选题</a> · <a href="<%=request.getContextPath()%>/previewServletJJQ?who=user">简答题</a></dd>
	</dl>	
</div>
<div class="col-lg-8">
	<h3 class="text-center">用户操作说明 </h3>
	<dl class="dl-horizontal text-danger">
	  <dt>登录验证</dt>
	  <dd></dd>
	  <dt>试题导出功能</dt>
	  <dd>点击导出试题为Excel，会有多个选项，选择相应的科目的题型，会将相应的试题从题库中获取导出（下载）到本地，格式为Excel，在导出的Excel中包含所有试题内容，用户可以下载后酌情组题，进行自我测试。</dd>
	  <dt>试题预览功能</dt>
	  <dd>点击试题预览，会有多个选项，选择相应的科目题型，可以预览题库中的试题，也可在预览界面直接答题，然后点击“答案”按钮，可以查看相应的正确答案及其解析。</dd>
	</dl>
</div>
<!--脚注-->
    <footer class="center-block text-center" >
            <span class="glyphicon glyphicon-book" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
    </footer>
</body>
</html>