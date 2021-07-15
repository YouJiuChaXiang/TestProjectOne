<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-2">
			<div class="list-group">
				<c:forEach items="${catelist}" var="c" varStatus="vs">
					<c:forEach items="${c.childlist}" var="cl" varStatus="i">
						<c:if test="${cl.childid==childid}">
							<a
								href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${cl.childid}"
								class="list-group-item active">${cl.childname}</a>

						</c:if>
						<c:if test="${cl.childid!=childid}">
							<a
								href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${cl.childid}"
								class="list-group-item">${cl.childname}</a>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-10">
			<div class="row">
				<c:forEach items="${goods}" var="ch" varStatus="vs">
					<div class="col-md-3">
						<a
							href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${ch.goodsId}">
							<div class="thumbnail homegoods">
								<img src="${pageContext.request.contextPath}${ch.goodsPic}"
									style="height: 150px" />
								<div class="caption text-center">
									<label> ${ch.goodsName}</label>
									<p>
										原价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
										${ch.goodsPrice} <span class="glyphicon glyphicon-hand-right"
											aria-hidden="true"></span>
									</p>
									<p>
										现售<span class="label label-pill label-info"> <span
											class="glyphicon glyphicon-yen" aria-hidden="true"> </span>${ch.goodsDiscount}
										</span>
									</p>
									<p>共售出${ch.goodsSales}件</p>
									<p>
										<a class="btn btn-primary"
											href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${ch.goodsId}">查看详情</a>
									</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
	$(".list-group a").click(function() {
		/* alert("tt"); */
		$(".list-group a").removeClass("active");
		$(this).addClass("active");
	});
</script>
<jsp:include page="../footer.jsp" />