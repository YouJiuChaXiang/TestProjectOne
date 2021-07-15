<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<%-- <div class="row">
		<c:forEach items="${catelist}" var="c" varStatus="sgvs">

				
					<div class="col-md-3">
						<a
							href="${pageContext.request.contextPath}/goods/newGoods.action?goods_id=${g.goodsId}">
							<div class="thumbnail homegoods">
								<img src="${pagaComtent.request.contextPath}..${g.goodsPic}"
									alt="暂无图片">
								<div class="caption caption-style">
									<p>${g.goodsName}</p>
									<p class="font-red">￥ ${g.goodsPrice}</p>

								</div>
							</div>
						</a>
					</div>
	
		</c:forEach>
	</div> --%>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">

				<c:forEach items="${newGoods}" var="ng">
					<div class="col-md-3">
						<a
							href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${ng.goodsId}">
							<div class="thumbnail">
								<img alt="暂无图片" style="width: 230px; height: 230px"
									alt="300x200"
									src="${pageContext.request.contextPath}${ng.goodsPic}" />
								<div class="caption text-center">
									<h4 class="substr color">${ng.goodsName}</h4>
									<p>
										原件￥ ${ng.goodsPrice} <span
											class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
									</p>
									<p>
										现价<span class="badge label-pill label-info">￥
											${ng.goodsDiscount }</span>
									</p>
									<p>共售出 ${ng.goodsSales} 件</p>
								</div>
							</div>
						</a>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!--包含语句  -->
<jsp:include page="../footer.jsp" />

