<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row clearfix">

<div class="col-md-2">
<div class="list-group">
  <a href="${pageContext.request.contextPath}/usercenter/userInfo.action" class="list-group-item ">修改用户信息</a>
  <a href="${pageContext.request.contextPath}/usercenter/userPassword.action"class="list-group-item active">修改密码</a>
  <a href="${pageContext.request.contextPath}/usercenter/userAddress.action" class="list-group-item">管理收货地址</a>
</div>
</div>
<div class="col-md-10">
欢迎来到个人中心，您可以修改个人密码！！
</div>




 </div>

































<%@include file="../footer.jsp"%>