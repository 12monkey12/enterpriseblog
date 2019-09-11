<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>main</title>
    <!-- Bootstrap -->
    <link href="../bootstrap3/bootstrap.css" rel="stylesheet">

  </head>
  <body>
    <!-- 导航栏 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="javascript:void(0);">我的博客</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
					<li><a href="javascript:void(0);" onclick = "toUser()">用户管理</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">内容管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);" onclick = "toContent()">内容首页</a></li>
							<li><a href="addcontent.jsp">添加内容</a></li>
						</ul></li>
					<li class="active"><a href="#">用户建议</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">${admin[0].department } <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">个人中心</a></li>
							<li><a href="#">修改资料</a></li>
							<li><a href="javascript:void(0);" onclick = "logout()">退出登录</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<div class="container" style = "width : 95%">
		<!-- 路径导航 -->
		<ol class="breadcrumb">
		  <li><a href="javascript:void(0);">首页</a></li>
		  <li><a href="javascript:void(0);">用户建议</a></li>
		</ol>
	</div>
	
	<c:forEach var = "advise" items = "${advises }" varStatus = "status">
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="panel-title" style = "display:inline-block;width:60%;">subject：${advise.subject }</span>
				<span style = "margin-right:50px;">uid：${advise.uid }</span>
				<span style = "margin-right:50px;">uname：${advise.uname }</span>
				<span style = "margin-right:50px;">addtime：${advise.addtime }</span>
				<!--<button type="button" class="btn btn-warning" onclick = "reply(${advise.uid })">回复</button> -->
			</div>
			<div class="panel-body">
				${advise.message }
			</div>
		</div>
	</div>
	</c:forEach>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../bootstrap3/bootstrap.js"></script>
    
    <script>
	    function toUser(){
			//用户首页
			$.post("../adminServlet",{
				op : 'getAllUser'
			},function(data){
				if ( data == 1 ) {
					location.href = "user.jsp";
				} else {
					alert("获取数据失败！");
				}
				
			});
		}
	    //注销
	    function logout(){
	    	$.post("/companyblog/userServlet",{
				op : 'alogout'
			},function(data){
				if ( data == 1 ) {
					location.href = "../index.jsp";
				} else {
					alert("注销失败！");
				}
			});
	    }
	    //内容首页
	    function toContent(){
	    	$.post("/companyblog/adminServlet",{
				op : 'getAllContent'
			},function(data){
				if ( data == 1 ) {
					location.href = "content.jsp";
				} else {
					alert("获取数据失败！");
				}
				
			});
	    }
		//回复建议
		function reply(num){
			
		}
    
    </script>
    
  </body>
</html>