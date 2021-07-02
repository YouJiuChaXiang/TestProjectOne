<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp"%>
<div class="row">
<div class="col-md-12">
<div class="col-md-3">
<ul class="list-group">
    <li class="list-group-item">坚果</li>
    <li class="list-group-item">甜点</li>
    <li class="list-group-item">海味</li>
    <li class="list-group-item">
        <span class="badge">新</span>
       女装
    </li>
    <li class="list-group-item">男装</li>
    <li class="list-group-item">
        <span class="badge">新</span>
        女士内衣
    </li>
    <li class="list-group-item">男士内衣</li>
    <li class="list-group-item">孕妇装</li>
    <li class="list-group-item">儿童装</li>
    <li class="list-group-item">
        <span class="badge">新</span>
       婴幼儿装
    </li>
    <li class="list-group-item">女鞋</li>
    <li class="list-group-item">男鞋</li>
    <li class="list-group-item">
        <span class="badge">新</span>
        箱包
    </li>
</ul>

</div>
<div class="col-md-9">

 <c:forEach items="${childId}" var="c">
 <c:forEach items="${c.goods}" var="ng">
          <div class="col-md-3">
            <div class="thumbnail">
             <img alt="暂无图片" style = "width:230px;height:230px" alt="300x200"
                src="${pageContext.request.contextPath}${ng.goodsPic}" /> 
              <div class="caption text-center">
                 <h4 class="substr color">${ng.goodsName}</h4> 
                <p>
                  原件￥  ${ng.goodsPrice} <span class="glyphicon glyphicon-hand-right"
                    aria-hidden="true"></span>
                </p>
                <p>
                  现价<span class="badge label-pill label-info">￥ ${ng.goodsDiscount }</span>
                </p>
                <p>共售出 ${ng.goodsSales} 件</p>
              </div>
            </div>
          </div>
          </c:forEach>
</c:forEach>

	 <%-- <div class="row">
		<c:forEach begin="1" end="6" var="c" varStatus="vs">
			<div class="col-md-4">
				<a href="#">
					<div class="thumbnail homegoods">
						<img
							src="${pagaComtent.request.contextPath}../images/goods/01_1.jpg"
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
	 --%>
	
	

</div>

</div>



</div>
</body>
</html>