<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>热销商品</title>
<script type="text/javascript">
//排序
 function sortGoods(x) {
    var clientList = new Array();
    <c:forEach items="${salesGoods}" var="item">
    var m=new Object();
    m.goodsID="${item.goodsId}";
    m.goodsName="${item.goodsName}";
    m.goodsPrice="${item.goodsPrice}";
    m.goodsDiscount="${item.goodsDiscount}";
    m.goodsSales="${item.goodsSales}";
    m.goodsPic="${item.goodsPic}";
    clientList.push(m);
    </c:forEach>

    if(x==1){
    //按价格从低到高 排序
     clientList.sort((a, b)=> a.goodsDiscount-b.goodsDiscount);
    }
    if(x==2){
      //按价格从高到低 排序
       clientList.sort((a, b)=> b.goodsDiscount-a.goodsDiscount);
      }
    console.log(clientList);
     $("#rowbox").html(null);
     for(ch of clientList){
     $("#rowbox").append(      
        `<c:forEach items="`+clientList+`" var="ch" varStatus="vs">
        <div class="col-md-3">
        <a href="#">
          <div class="thumbnail homegoods">
            <img src="${pageContext.request.contextPath}`+ch.goodsPic+`"
              style="height: 150px" />
            <div class="caption text-center">
              <label>`+ ch.goodsName+ `</label>
              <p>
                原价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
                `+ch.goodsPrice+` <span class="glyphicon glyphicon-hand-right"
                  aria-hidden="true"></span>
              </p>
              <p>
                现售<span class="label label-pill label-info"> <span
                  class="glyphicon glyphicon-yen" aria-hidden="true"> </span>`+ch.goodsDiscount +`</span>
              </p>
              <p>共售出`+ch.goodsSales +`件</p>
            </div>
          </div>
        </a>
      </div>      
      </c:forEach>     
     `); 
     }
  }
</script>
</head>
<body>
	<div class="container"  >
		<div class="row clearfix" id="rowbox">
			<div class="col-md-12 column">
				<div class="row">
					<c:forEach items="${salesGoods}" var="sg">
						<div class="col-md-3">
							<a
								href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${sg.goodsId}">
								<div class="thumbnail">
									<img alt="暂无图片" style="width: 230px; height: 230px"
										alt="300x200"
										src="${pageContext.request.contextPath}${sg.goodsPic}" />
									<div class="caption text-center">
										<h4 class="substr color">服装</h4>
										<p>
											原件${sg.goodsPrice} <span
												class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
										</p>
										<p>
											现价<span class="badge label-pill label-info">￥${sg.goodsDiscount }</span>
										</p>
										<p>共售出${sg.goodsSales}件</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<jsp:include page="../footer.jsp" />


<%-- <c:forEach items="${catelist}" var="ch" varStatus="sgvs">
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


