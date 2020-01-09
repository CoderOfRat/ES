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
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand  glyphicon glyphicon-folder-open">&nbsp;题库管理系统>管理员</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">查看试题 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=request.getContextPath()%>/previewServletCJ?who=admin">C语言>判断 </a><a href="<%=request.getContextPath()%>/previewServletCS?who=admin">C语言>单选 </a><a href="<%=request.getContextPath()%>/previewServletCJQ?who=admin">C语言>简答 </a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/previewServletCppJ?who=admin">C++&nbsp;&nbsp;&nbsp;>判断 </a><a href="<%=request.getContextPath()%>/previewServletCppS?who=admin">C++&nbsp;&nbsp;&nbsp;>单选 </a><a href="<%=request.getContextPath()%>/previewServletCppJQ?who=admin">C++&nbsp;&nbsp;&nbsp;>简答 </a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/previewServletJJ?who=admin">Java&nbsp;&nbsp;>判断 </a><a href="<%=request.getContextPath()%>/previewServletJS?who=admin">Java&nbsp;&nbsp;>单选 </a><a href="<%=request.getContextPath()%>/previewServletJJQ?who=admin">Java&nbsp;&nbsp;>简答 </a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">自动导入试题 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a type="button" data-toggle="modal" data-target="#myModalCJ">C语言>判断 </a>
							<a type="button" data-toggle="modal" data-target="#myModalCS">C语言>单选 </a>
							<a type="button" data-toggle="modal" data-target="#myModalCJQ">C语言>简答 </a></li>	
							<li role="separator" class="divider"></li>												
							<li><a type="button" data-toggle="modal" data-target="#myModalCppJ">C++&nbsp;&nbsp;&nbsp;>判断 </a>
							<a type="button" data-toggle="modal" data-target="#myModalCppS">C++&nbsp;&nbsp;&nbsp;>单选 </a>
							<a type="button" data-toggle="modal" data-target="#myModalCppJQ">C++&nbsp;&nbsp;&nbsp;>简答 </a></li>							
							<li role="separator" class="divider"></li>							
							<li><a type="button" data-toggle="modal" data-target="#myModalJJ">Java&nbsp;&nbsp;>判断 </a>
							<a type="button" data-toggle="modal" data-target="#myModalJS">Java&nbsp;&nbsp;>单选 </a>
							<a type="button" data-toggle="modal" data-target="#myModalJJQ">Java&nbsp;&nbsp;>简答 </a></li>
						</ul>
					</li>
					<li class="dropdown">
                      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">下载模板 <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li>
                        	<a href="/ES/templates/questionsExportTemplateC语言判断题.xls">C语言>判断模板 </a>
							<a href="/ES/templates/questionsExportTemplateC语言单选题.xls">C语言>单选模板 </a>
							<a href="/ES/templates/questionsExportTemplateC语言简答题.xls">C语言>简答模板 </a></li>						
							<li role="separator" class="divider"></li>
							<li><a href="/ES/templates/questionsExportTemplateCPP判断题.xls">C++&nbsp;&nbsp;&nbsp;>判断模板 </a>
							<a href="/ES/templates/questionsExportTemplateCPP单选题.xls">C++&nbsp;&nbsp;&nbsp;>单选模板 </a>
							<a href="/ES/templates/questionsExportTemplateCPP简答题.xls">C++&nbsp;&nbsp;&nbsp;>简答模板 </a></li>
							<li role="separator" class="divider"></li>
							<li><a href="/ES/templates/questionsExportTemplateJava判断题.xls">Java&nbsp;&nbsp;>判断模板 </a>
							<a href="/ES/templates/questionsExportTemplateJava单选题.xls">Java&nbsp;&nbsp;>单选模板 </a>
							<a href="/ES/templates/questionsExportTemplateJava简答题.xls">Java&nbsp;&nbsp;>简答模板 </a>
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
	<!-- 内容实体开始 -->
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#c_bank"
			role="tab" data-toggle="tab">添加C语言试题</a></li>
		<li role="presentation"><a href="#cplusplus_bank" role="tab"
			data-toggle="tab">添加C++语言试题</a></li>
		<li role="presentation"><a href="#java_bank" role="tab"
			data-toggle="tab">添加Java语言试题</a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content container" style="margin-bottom: 10%">
		<!-- C -->
		<div role="tabpanel" class="tab-pane active" id="c_bank">
			<div class="page-header">
				<h2 class="text-center">
					C语言 <small>试题添加</small>
				</h2>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#c_bank_judge"
					role="tab" data-toggle="tab">添加判断题</a></li>
				<li role="presentation"><a href="#c_bank_single" role="tab"
					data-toggle="tab">添加单选题</a></li>
				<li role="presentation"><a href="#c_bank_JQuiz" role="tab"
					data-toggle="tab">添加简答题</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content container">
				<div role="tabpanel" class="tab-pane active" id="c_bank_judge"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCJ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写判断题题目"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写正确答案：“正确”或者 “错误”，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="c_bank_single"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCS"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写单选题题目内容，题目中要选择替代的内容请以（）代替"></textarea>
						</div>
						<div class="form-group">
							<label>选项A</label>
							<textarea class="form-control" rows="2" name="A"
								placeholder="请填写A选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项B</label>
							<textarea class="form-control" rows="2" name="B"
								placeholder="请填写B选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项C</label>
							<textarea class="form-control" rows="2" name="C"
								placeholder="请填写C选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项D</label>
							<textarea class="form-control" rows="2" name="D"
								placeholder="请填写D选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="2" name="solution"
								placeholder="请填写本题答案：A或者B或者C或者D，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="c_bank_JQuiz"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCJQ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写简答题题目内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写解答题题目具体答案解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
			</div>
		</div>
		<!-- C++ -->
		<div role="tabpanel" class="tab-pane" id="cplusplus_bank">
			<div class="page-header">
				<h2 class="text-center">
					C++ <small>试题添加</small>
				</h2>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#cplusplus_bank_judge"
					role="tab" data-toggle="tab">添加判断题</a></li>
				<li role="presentation"><a href="#cplusplus_bank_single" role="tab"
					data-toggle="tab">添加单选题</a></li>
				<li role="presentation"><a href="#cplusplus_bank_JQuiz" role="tab"
					data-toggle="tab">添加简答题</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content container">
				<div role="tabpanel" class="tab-pane active" id="cplusplus_bank_judge"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCppJ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写判断题题目"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写正确答案：“正确”或者 “错误”，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="cplusplus_bank_single"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCppS"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写单选题题目内容，题目中要选择替代的内容请以（）代替"></textarea>
						</div>
						<div class="form-group">
							<label>选项A</label>
							<textarea class="form-control" rows="2" name="A"
								placeholder="请填写A选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项B</label>
							<textarea class="form-control" rows="2" name="B"
								placeholder="请填写B选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项C</label>
							<textarea class="form-control" rows="2" name="C"
								placeholder="请填写C选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项D</label>
							<textarea class="form-control" rows="2" name="D"
								placeholder="请填写D选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="2" name="solution"
								placeholder="请填写本题答案：A或者B或者C或者D，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="cplusplus_bank_JQuiz"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletCppJQ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写简答题题目内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写解答题题目具体答案解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
			</div>
		</div>
		<!-- java -->
		<div role="tabpanel" class="tab-pane" id="java_bank">
			<div class="page-header">
				<h2 class="text-center">
					Java <small>试题添加</small>
				</h2>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#java_bank_judge"
					role="tab" data-toggle="tab">添加判断题</a></li>
				<li role="presentation"><a href="#java_bank_single" role="tab"
					data-toggle="tab">添加单选题</a></li>
				<li role="presentation"><a href="#java_bank_JQuiz" role="tab"
					data-toggle="tab">添加简答题</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content container">
				<div role="tabpanel" class="tab-pane active" id="java_bank_judge"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletJJ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写判断题题目"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写正确答案：“正确”或者 “错误”，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="java_bank_single"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletJS"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写单选题题目内容，题目中要选择替代的内容请以（）代替"></textarea>
						</div>
						<div class="form-group">
							<label>选项A</label>
							<textarea class="form-control" rows="2" name="A"
								placeholder="请填写A选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项B</label>
							<textarea class="form-control" rows="2" name="B"
								placeholder="请填写B选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项C</label>
							<textarea class="form-control" rows="2" name="C"
								placeholder="请填写C选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>选项D</label>
							<textarea class="form-control" rows="2" name="D"
								placeholder="请填写D选项的内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="2" name="solution"
								placeholder="请填写本题答案：A或者B或者C或者D，也可以加上本题解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="java_bank_JQuiz"
					style="font-size: large; line-height: 1.5em">
					<form action="<%=request.getContextPath()%>/selfInsertServletJJQ"
						method="post" role="form">
						<div class="form-group">
							<label>题干</label>
							<textarea class="form-control" rows="3" name="title"
								placeholder="请填写简答题题目内容"></textarea>
						</div>
						<div class="form-group">
							<label>答案</label>
							<textarea class="form-control" rows="3" name="solution"
								placeholder="请填写解答题题目具体答案解析"></textarea>
						</div>
						<button type="submit" class="btn btn-success">确认导入</button>
						<button type="reset" class="btn btn-default">清空</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 内容实体结束 -->
	<!--脚注-->
	<footer class="center-block text-center">
		<span class="glyphicon glyphicon-book" aria-hidden="true">&nbsp;&nbsp;题库管理系统</span>
	</footer>
	
	<%-- <script>
		function setCJ() {
			<%
				request.setAttribute("sql","select title,solution from c_bank_judge");
				request.setAttribute("course","C语言");
				
			%>
		}
		function setCS() {
			<%
				request.setAttribute("sql","select title,A,B,C,D,solution from c_bank_single");
				request.setAttribute("course","C语言");
				request.getRequestDispatcher("/autoInsertServlet").forward(request, response);
				
			%>
		}
		function setCJQ() {
			<%
				request.setAttribute("sql","select title,solution from c_bank_jqquiz");
				request.setAttribute("course","C语言");
				
			%>
		}
		
	</script> --%>
<!-- CJModal -->
<div class="modal fade" id="myModalCJ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCJ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- CJQModal -->
<div class="modal fade" id="myModalCJQ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCJQ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- CSModal -->
<div class="modal fade" id="myModalCS" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCS" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- CppJModal -->
<div class="modal fade" id="myModalCppJ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCppJ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- CppJQModal -->
<div class="modal fade" id="myModalCppJQ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCppJQ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- CppSModal -->
<div class="modal fade" id="myModalCppS" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletCppS" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- JJModal -->
<div class="modal fade" id="myModalJJ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletJJ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- JJQModal -->
<div class="modal fade" id="myModalJJQ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletJJQ" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- JSModal -->
<div class="modal fade" id="myModalJS" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">题库管理系统1.1</h4>
      </div>
      <div class="modal-body">
		<form action="<%=request.getContextPath()%>/autoInsertServletJS" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">利用模板批量上传</label>
		    <input type="file" id="exampleInputFile" name="uploadFile">
		    <p class="help-block glyphicon glyphicon-screenshot">请确保上传文件的模板和选择的题型一致</p>
		  </div>
		  <button type="submit" class="btn btn-default">上传</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>