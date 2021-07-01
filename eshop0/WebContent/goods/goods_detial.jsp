<%@include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugs/zoom/css/ShopShow.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugs/zoom/css/MagicZoom.css" type="text/css" />
<script src="${pageContext.request.contextPath}/plugs/zoom/js/MagicZoom.js" type="text/javascript"></script>
<script >
	function btnSelect(contentId,typeId){
		$("."+typeId).removeClass("btn-info");
		$("#btn_"+contentId).addClass("btn-info");
	}
</script>

	<ul class="breadcrumb">
		<li>
			 <a href="#">首页</a>
		</li>
		<li>
			 <a href="#">商品分类</a>
		</li>
		<li class="active">
			商品名称
		</li>
	</ul>

	<div class="row">
		<div class="col-md-4">
				
				<!-- 代码开始 -->
				<div id="tsShopContainer">
					<div id="tsImgS"><a href="${pageContext.request.contextPath}/images/goods/00.jpg" title="Images" class="MagicZoom" id="MagicZoom"><img src="${pageContext.request.contextPath}/images/goods/02_1.jpg" /></a></div> 
					<div id="tsPicContainer">
						<div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
						<div id="tsImgSCon">
							<ul>								   
								    <li onclick="showPic(0)" rel="MagicZoom"><img height="42" width="42" src="${pageContext.request.contextPath}/images/goods/02_1.jpg" tsImgS="${pageContext.request.contextPath}/images/goods/02_1_big.jpg" /></li>
									<li onclick="showPic(0)" rel="MagicZoom"><img height="42" width="42" src="${pageContext.request.contextPath}/images/goods/02_2.jpg" tsImgS="${pageContext.request.contextPath}/images/goods/02_2_big.jpg" /></li>
									<li onclick="showPic(0)" rel="MagicZoom"><img height="42" width="42" src="${pageContext.request.contextPath}/images/goods/02-3.jpg" tsImgS="${pageContext.request.contextPath}/images/goods/02_3_big.jpg" /></li>
									

							</ul>
						</div>
						<div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
					</div>
					<img class="MagicZoomLoading" width="16" height="16" src="${pageContext.request.contextPath}/plugs/zoom/images/loading.gif" alt="Loading..." />
				</div>
				<!-- 引入放大镜效果脚本 -->
				<script src="${pageContext.request.contextPath}/plugs/zoom/js/ShopShow.js"></script>
				<!-- 代码结束 -->				
				
		</div>
		<div class="col-md-8">
			<h3>松子</h3>
			<div class="panel panel-default">
			  <div class="panel-body bg_goodsdetail">
			    <p>促销价：<span class="price_red "><small>￥</small>22</span></p>
			    <p>原价：<span class="price"><small>￥</small>30</span></p>
			    <p>已售出 <span style="color:gray">1000 </span>件</p>
			  </div>
			</div>
	    <form id="fm_goods" class="form-inline" role="form"  method="post">			
			<%-- <div class="row row_style">
			  <div class="col-md-12">
	            <label>包装：</label>
	                
	               <button type="button" class="btn btn-default btn-xs btn-info" id="btn_${t.contentId}"  >1包</button>						
						<button type="button" class="btn btn-default btn-xs" id="btn_${t.contentId}"  >3连包</button>
						<button type="button" class="btn btn-default btn-xs" id="btn_${t.contentId}"  >5连包</button> 

					</div>
	          </div>  
            </div>
            
			<div class="row row_style">
			  <div class="col-md-12">
	            <label>口味：</label>
	                
		            <div class="btn-group" role="group" id="btn_group_${s.typeId}">
						<button type="button" class="btn btn-default btn-xs btn-info" id="btn_${t.contentId}"  >原味</button>						
						<button type="button" class="btn btn-default btn-xs" id="btn_${t.contentId}"  >五香味</button>
						<button type="button" class="btn btn-default btn-xs" id="btn_${t.contentId}"  >奶油味</button>

					</div>
	          </div>  --%> 
	          <div class="row row_style">
			  <div class="col-md-12">
	            <label>包装：</label>
	                
		            <div class="btn-group" role="group" id="btn_group_${s.typeId}">
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 1" id="btn_1"  onclick="btnSelect(1,1)">1包</button>
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 1" id="btn_2"  onclick="btnSelect(2,1)">3连包</button>
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 1" id="btn_3"  onclick="btnSelect(3,1)">5连包</button>

					</div>
	          </div>  
              </div>
            
			<div class="row row_style">
			  <div class="col-md-12">
	            <label>口味：</label>
	                
		            <div class="btn-group" role="group" id="btn_group_${s.typeId}">
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 2" id="btn_11"  onclick="btnSelect(11,2)">原味</button>
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 2" id="btn_12"  onclick="btnSelect(12,2)">五香味</button>
                        <button type="button" class="btn btn-default btn-xs ${tvs.first?'btn-info':'' } btn-info 2" id="btn_13"  onclick="btnSelect(13,2)">奶油味</button>
					</div>
	          </div>  
            </div>
	          
	          
	        
             <div class="row row_style">
	             <div class="col-md-12">
	            	<div class="form-group">	
					    <label for="num">数量：</label>		 								
						<div class="input-group input-group-sm col-xs-4">
						<input class="form-control" id="goodsSales" name="goodsSales" type="number" value="1" min="1"/>
						</div>
					</div>
				  </div>	
             </div>
         </form>    
		     <div class="row row_style">
		        <div class="col-md-12">

			        <p class="p_height">运费：<small>￥</small>12</p>			        
					<p>
						<button class="btn btn-primary btn-sm" type="submit">
							立即购买
						</button>
						<button class="btn btn-primary btn-sm" type="button" >
							加入购物车
						</button>
						
					</p>
				 </div>	
        
		     </div>
		</div>	
				
 
			</div>								
		 </div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column">

			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">商品详情</h3>
				</div>
				<div class="panel-body">
			<dl class="dl-horizontal">
				<dt>宝贝详情</dt>
				<dd>宝贝详情宝贝详情宝贝详情宝贝详情宝贝详情宝贝详情</dd>
				<dt>产地</dt>
				<dd>产地产地产地产地产地产地产地产地产地</dd>
			</dl>				
            <hr>
			<div style="margin-top:20px" class="text-center">

			      <div>
				  <img alt="暂无图片" src="${pageContext.request.contextPath}/images/goods/01_1.jpg" />
			      </div>
			      <div>
				  <img alt="暂无图片" src="${pageContext.request.contextPath}/images/goods/01_2.jpg" />
			      </div>
			</div>
					
				</div>
			</div>
		</div>
	</div>

<%@include  file="../footer.jsp"%>	
