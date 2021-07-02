<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>热销商品</title>
</head>
<body>
<%@include file="../header.jsp"%>

<div class="row">

	<%-- <c:forEach items="${catelist}" var="c" varStatus="sgvs">

		<div class="row">
			<c:forEach items="${c.goodslist}" var="g" varStatus="gvs">
				<div class="col-md-3">
					<a
						href="${pageContext.request.contextPath}/goods/saleGoods.action?goods_id=${g.goodsId}">
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
		</div>
	</c:forEach> --%>
	
	
	 <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <div class="row">
        <c:forEach items="${salesGoods}" var="sg">
          <div class="col-md-3">
            <div class="thumbnail">
              <img alt="暂无图片" style = "width:230px;height:230px" alt="300x200"
                src="${pageContext.request.contextPath}${sg.goodsPic}" />
              <div class="caption text-center">
                <h4 class="substr color">服装</h4>
                <p>
                  原件${sg.goodsPrice} <span class="glyphicon glyphicon-hand-right"
                    aria-hidden="true"></span>
                </p>
                <p>
                  现价<span class="badge label-pill label-info">￥${sg.goodsDiscount }</span>
                </p>
                <p>共售出${sg.goodsSales}件</p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
	
  <jsp:include page="../footer.jsp"/>
</body>
</html>
	
	
	
	
	
	
</div>






