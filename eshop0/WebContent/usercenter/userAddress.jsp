<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		
	
<div class="row clearfix">
 <c:if test="${flag==1 }">
			<script>
				alert("删除成功");
			</script>
		</c:if>

	<div class="col-md-2">
		<div class="list-group">
			<a
				href="${pageContext.request.contextPath}/usercenter/userInfo.action"
				class="list-group-item ">修改用户信息</a> <a
				href="${pageContext.request.contextPath}/usercenter/userPassword.action"
				class="list-group-item">修改密码</a> <a
				href="${pageContext.request.contextPath}/usercenter/userAddress.action"
				class="list-group-item active">管理收货地址</a>
		</div>
	</div>

	<div class="col-md-10">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/usercenter/addAddr.action">添加收货地址</a>
		<table class="table">
			<tr>
				<th>#</th>
				<th>省市区</th>
				<th>街道</th>
				<th>收货人</th>
				<th>电话</th>
				<th>默认地址</th>
				<th>操作</th>
			</tr>
			<tr>

				<c:forEach items="${addrlist}" var="i" varStatus="vs">
					<tr>
						<td>${vs.index}</td>
						<td>${i.addrProvince}${i.addrCity}${i.addrArea}</td>
						<td>${i.addrContent}</td>
						<td>${i.addrReceiver}</td>
						<td>${i.addrTel}</td>
						<td>${i.addrIsdefault}</td>
						 <td><a href="#">修改</a>| 
						<a href="${pageContext.request.contextPath}/usercenter/delAddr.action?addr_id=${i.addrId}">删除</a>|
						<a href="#">设置默认地址</a>
						</td>
					</tr>
				</c:forEach>

			</tr>
		</table>
	</div>









</div>

































<%@include file="../footer.jsp"%>