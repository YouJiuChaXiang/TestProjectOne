<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>随意购商城</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		
				<br>
				<ol class="breadcrumb text-right" id="info">
					<li id="li1"><span>游客您好，欢迎来到随意购商城！</span> <a
						href="#loginFormModal" data-toggle="modal">[登录]</a>&nbsp;<a
						href="#regFormModal" data-toggle="modal">[新用户注册]</a></li>

					<li><a href="#" onclick="">购物车 <span class="badge"
							id="cartBadge"></span></a></li>
				</ol>
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/index.action"><span
							class="logo">随意购</span> 商城</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="${pageContext.request.contextPath}/index.action">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/goods/saleGoods.action">热销商品</a></li>
							<li><a href="${pageContext.request.contextPath}/goods/newGoods.action">新到商品</a></li>
							<li><a href="./goods/goodsCate.action">商品分类test</a></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">商品分类<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<c:forEach begin="1" end="3" var="c" varStatus="vs">
										<%-- <c:forEach begin="1" end="2" var="cl" varStatus="i"> --%>
											<li><a href="${pageContext.request.contextPath}/goods/goodsCate.action">女装</a></li>
											<li><a href="${pageContext.request.contextPath}/goods/goodsCate.action">男装</a></li>
											<li><a href="${pageContext.request.contextPath}/goods/goodsCate.action">零食</a></li>
										<%-- </c:forEach>--%>
										<li class="divider"></li>
									</c:forEach> 
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" />
							</div>
							<button type="submit" class="btn btn-default">店内搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right">

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">排序<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">按价格从低到高</a></li>
									<li><a href="#">按价格从高到低</a></li>
									<li class="divider"></li>
									<li><a href="#">按销量从高到低</a></li>
									<li><a href="#">按销量从低到高</a></li>
								</ul></li>
						</ul>
					</div>

				</nav>




				<br>
</body>
</html>