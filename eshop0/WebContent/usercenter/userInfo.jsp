<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row clearfix">

	<div class="col-md-2">
		<div class="list-group">
			<a
				href="${pageContext.request.contextPath}/usercenter/userInfo.action"
				class="list-group-item active">修改用户信息</a> <a
				href="${pageContext.request.contextPath}/usercenter/userPassword.action"
				class="list-group-item">修改密码</a> <a
				href="${pageContext.request.contextPath}/usercenter/userAddress.action"
				class="list-group-item">管理收货地址</a>
		</div>
	</div>

	<div class="col-md-10">
		<form method="post"
			action="${pageContext.request.contextPath}/usercenter/updateUserInfo.action">
			<input type="hidden" name="userId" value="${user.userId}">
			<div class="form-group">
				<label for="userName">用户名</label> <input type="text"
					class="form-control" id="userName" name="userName"
					value="${user.userName}">
			</div>

			<div class="form-group">
				<label for="userAge">年齡</label> <input type="number"
					class="form-control" id="userAge" name="userAge"
					value="${user.userAge}">
			</div>
			<div class="form-group">
				<div class="radio-inline">
					<label> <input type="radio" name="userSex" id="userSex1"
						value="0" <c:if test="${user.userSex==0}">checked</c:if>>
						男
					</label>
				</div>
				<div class="radio-inline">
					<label> <input type="radio" name="userSex" id="userSex2"
						value="1" <c:if test="${user.userSex==1}">checked</c:if>>
						女
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for="userEmail">邮箱</label> <input type="email"
					class="form-control" id="userEmail" name="userEmail"
					value="${user.userEmail}">
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary">修改</button>
				</div>
			</div>
		</form>
		<c:if test="${flag==1}">
			<div class="font-red">用户更新成功</div>
		</c:if>
		<c:if test="${flag==0}">
			<div class="font-red">用户更新失败</div>
		</c:if>

	</div>




</div>

































<%@include file="../footer.jsp"%>