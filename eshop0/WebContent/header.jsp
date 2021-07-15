<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<%@include file="common/loginFormModal.jsp" %>
<%@include file="common/regFormModal.jsp" %>
<%@include file="common/cartModal.jsp"%>
<%@include file="common/msgModal.jsp" %>

</head>
<body>
	<div class="container">
		<br>
		<ol class="breadcrumb text-right" id="info">
			<li id="li1"><span>游客您好，欢迎来到随意购商城！</span>
			<a
				href="#loginFormModal"
				data-toggle="modal">[登录]</a> 
			 &nbsp;
			<a href="#regFormModal"
				data-toggle="modal">[新用户注册]</a></li>

			<li><a href="#"  onclick="showCart('${sessionScope.goosdlist}')">购物车 <span class="badge"
					id="cartBadge"></span>
					${fn:length(sessionScope.goodslist)}
					</a></li>
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
					<li class="active" id="index"><a
						href="${pageContext.request.contextPath}/index.action">首页</a></li>
					<li id="saleGoods"><a
						href="${pageContext.request.contextPath}/goods/saleGoods.action">热销商品</a></li>
					<li id="newGoods"><a
						href="${pageContext.request.contextPath}/goods/newGoods.action">新到商品</a></li>
					<!-- <li><a href="./goodsCate.action">商品分类test</a></li> -->

					<li class="dropdown" id="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">商品分类<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<c:forEach items="${catelist}" var="c" varStatus="vs">
								<c:forEach items="${c.childlist}" var="cl" varStatus="i">
									<li><a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${cl.childid}">${cl.childname}</a></li>
								</c:forEach>
								<li class="divider"></li>
							</c:forEach>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search" method="post" action="${pageContext.request.contextPath}/goods/searchGoods.action">
          <div class="form-group">
            <input type="text" class="form-control" name="keyword"/>
          </div>
          <button type="submit" class="btn btn-default">店内搜索</button>
        </form>
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">排序<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="sortGoods(1)">按价格从低到高</a></li>
							<li><a href="#" onclick="sortGoods(2)">按价格从高到低</a></li>
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
<script>
$(function(){
  
  $.get("http://localhost:8080/eshop0/getLogin.action",
      function(result){  
    /* console.log("aaa"); */
        if(result.login==true){
        	$("#info")
            .html(
        	`<li id="li1">
			<span>`+result.username+`您好，欢迎来到随意购商城！</span>
			 <li><a href="#" onclick="showCart('${sessionScope.goosdlist}')">购物车
			 <span class="badge" id="cartBadge">${fn:length(sessionScope.goodslist)}</span></a></li>
			 <li><a href="${pageContext.request.contextPath}/order/getMyOrders.action">我的订单</a></li>
			 <li><a href="${pageContext.request.contextPath}/usercenter/index.action">个人中心</a></li>
		     <li><a href="#" onclick="logout()">退出登录</a></li>` );
          $("#uinfo").html("欢迎来到个人中心，您可以修改个人信息、密码和管理收货地址!");      
        }      
      },"json");
//导航栏切换
  var url=window.location.pathname;
  var n=url.lastIndexOf("/");
  var m=url.lastIndexOf(".");
  var p=url.substring(n+1,m);
  //alert(url);
  $("#"+p).addClass("active").siblings().removeClass("active");
  
  

})
</script> 

