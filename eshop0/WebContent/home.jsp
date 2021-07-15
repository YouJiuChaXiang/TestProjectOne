<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>




<!-- 轮播图-->
<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="./images/adver/1.jpg" alt="...">
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="./images/adver/2.jpg" alt="...">
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="./images/adver/3.jpg" alt="...">
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="./images/adver/ad5.jpg" alt="...">
			<div class="carousel-caption">...</div>
		</div>
		<div class="item">
			<img src="./images/adver/ad7.jpg" alt="...">
			<div class="carousel-caption">...</div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>


<!-- 今日推荐 -->
<div class="row">
	<div class="col-md-2">
		<div class="thumbnail today-style">
			<img src="${pagaComtent.request.contextPath}./images/goods/2016.png"
				alt="..." >
			<div class="caption">
				<h3>今日推荐</h3>
			</div>
		</div>
	</div>
	<!-- 商品介绍 -->
	<c:forEach items="${todaylist}" var="c" varStatus="vs">
		<c:if test="${vs.count<=5}">
			<div class="col-md-2 colum">
				<a href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${c.goods_id}">
				<div class="thumbnail todaygoods" id="">
					<img src="${pageComtent.request.contextPath}.${c.goods_pic}">
					<div class="caption text-center">
						<h4 class="font-red">￥ ${c.goods_price}</h4>
						<p>${c.goods_name}</p>
					</div>
				</div>
				</a>
			</div>
		</c:if>
	</c:forEach>
</div>

<!-- 商品大类展示 -->
<c:forEach items="${catelist}" var="c" varStatus="vs">
	<div class="navtitle">
		<span class="cate-title">${c.cateName}</span> <small>${c.cateDesc}</small> <a
			class="btn btn-default btn-xs pull-right btn-more" href="#" role="button"> 更多商品
		</a>
		<ul class="list-inline pull-right cate-ul">
			<c:forEach items="${c.childlist}" varStatus="i" var="cl">
				<li><a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${cl.childid}">${cl.childname}</a></li>
			</c:forEach>
		</ul>
	</div>



	<div class="row">
		<c:forEach items="${c.goodslist}" var="g" varStatus="gvs">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${g.goodsId}">
					<div class="thumbnail homegoods">
						<img
							src="${pagaComtent.request.contextPath}.${g.goodsPic}"
							alt="暂无图片">
						<div class="caption caption-style">
							<p>${g.goodsName}</p>
							<p class="font-red">￥ ${g.goodsPrice}</p>

						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>

</c:forEach> 
 
<%-- 
 <c:forEach begin="1" end="3" var="c" varStatus="vs">
	<!-- 标题行 -->
	<div class="navtitle">
		<span class="cate-title">大类${vs.index }</span> <small>大类描述</small> <a
			class="btn btn-default btn-xs pull-right btn-more" href="#"> 更多商品
		</a>
		<ul class="list-inline pull-right cate-ul">
			<c:forEach begin="1" end="3" varStatus="vs" var="c">
				<li><a href="#">子类${vs.index} </a></li>
			</c:forEach>
		</ul>
	</div>



	<div class="row">
		<c:forEach begin="1" end="6" var="c" varStatus="vs">
			<div class="col-md-2">
				<a href="#">
					<div class="thumbnail homegoods">
						<img
							src="${pagaComtent.request.contextPath}./images/goods/01_1.jpg"
							alt="...">
						<div class="caption-style">
							<p>松子</p>
							<p class="font-red">价格：30</p>

						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>

</c:forEach> 
 --%>

<!-- 热销商品 -->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Panel title</h3>
	</div>
	<div class="panel-body">
		<c:forEach items="${catelist}" var="c" varStatus="vs">
		<c:forEach items="${c.goodslist}" var="g" varStatus="gvs">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${g.goodsId}">
					<div class="thumbnail homegoods">
						<img
							src="${pageContext.request.contextPath}${g.goodsPic}"
							alt="...">
						<div class="caption">
							<p>${g.goodsName}</p>
							<p class="font-size">${g.goodsPrice}</p>
						</div>
					</div>

				</a>
			</div>
		</c:forEach>
		</c:forEach>
	</div>




</div>






<%@include file="footer.jsp"%>


