<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="regFormModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel"
					style="font-family: Lucida Sans Unicode; color: #015198; font-size: 40px">
					<img alt=""
						src="${pageContext.request.contextPath}/images/header.png"
						width="50px" height="50px">用户注册
				</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="regForm">
					<div class="form-group">

						<label for="userName"> 用户名 </label> <input type="text"
							class="form-control" name="userName" id="userName"
							placeholder="输入用户名" required />
						<div id="checkNameResult"></div>
					</div>
					<div class="form-group">

						<label for="userPass"> 密码 </label> <input type="password"
							class="form-control" name="userPass" id="userPass" required />
					</div>
					<div class="form-group">

						<label for="userPassConfirm"> 确认密码 </label> <input type="password"
							class="form-control" id="userPass1" required />
					</div>
					<div class="form-group">

						<label for="userAge"> 年龄 </label> <input type="text"
							class="form-control" name="userAge" id="userAge" />
					</div>

					<div class="form-group">

						<label for="userSex"> 性别 </label>
						<div class="radio">
							<label> <input type="radio" name="userSex" id="sex1"
								value="0" checked> 男 <!--checked  是默认选择性别：男  -->
							</label> <label> <input type="radio" name="userSex" id="sex2"
								value="1"> 女
							</label>
						</div>
					</div>


					<div class="form-group">

						<label for="userEmail"> 邮箱 </label> <input name="userEmail"
							id="userEmail" type="email" class="form-control" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button"
					onclick="reg('${pageContext.request.contextPath}')">注册</button>
				<button class="btn btn-default" type="button" data-dismiss="modal"
					<c:if test="${!empty backUrl}">onclick=closeLogForm('${backUrl}')</c:if>>关闭窗口</button>
			</div>
		</div>

	</div>

</div>
<script>
	function reg(baseurl) {
		var reg = $('#regForm').serialize();
		$.post(baseurl + "/reg.action", reg, function(result) {
			//隐藏模态框
			$('#regForm').modal('hide');
			if (result.reg == true) {
				$("#msgTitle").html("注册成功");
				$("#msgBody").html("恭喜您，注册成功");
				//显示模态框
				$("#msgModal").modal();
				//成功等与登录
				  $("#info").html(
						  `<li id="li1">
							<span>`+result.username+`您好，欢迎来到随意购商城！</span>
							 <li><a href="#" onclick="showCart('${sessionScope.goosdlist}')">购物车
							 <span class="badge" id="cartBadge">${fn:length(sessionScope.goodslist)}</span></a></li>
							 <li><a href="${pageContext.request.contextPath}/order/getMyOrders.action">我的订单</a></li>
							 <li><a href="${pageContext.request.contextPath}/usercenter/index.action">个人中心</a></li>
						     <li><a href="#" onclick="logout()">退出登录</a></li>` );    
			} else {
				$("#msgTitle").html("注册失败");
				$("#msgBody").html("对不起，注册失败");
				//显示模态框
				$("#msgModal").modal();
			}
		});
	}
	function checkLogin(result) {
		if (result.login) {
			//$("#msgTitle").html(result.login);
			//$("#msgBody").html(result.login);
			//$("#msgModal").modal();
			$("#loginFormModal").modal();
			return false;
		}
		return true;
	}
</script>

