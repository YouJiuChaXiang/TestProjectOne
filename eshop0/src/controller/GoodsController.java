package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Category;
import model.Goods;
import service.GoodsService;
import service.HomeService;

@WebServlet("*.action")

public class GoodsController extends HttpServlet {

	public GoodsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	// @SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getServletPath();
		// 导航菜单商品分类下拉列表
		List<Category> catelist = HomeService.getcateList();
		req.setAttribute("catelist", catelist);

		if (url.equals("/goods/goodsDetail.action")) {
			Goods goodsDetail = new Goods();
			int goodsId = Integer.parseInt(req.getParameter("goods_id"));
			goodsDetail = GoodsService.getGoodsDetail(goodsId);

			req.setAttribute("goodsDetail", goodsDetail);
			Category cate = new Category();

			cate = GoodsService.getCateName(goodsId);
			req.setAttribute("cate", cate);
			req.getRequestDispatcher("/goods/goods_detail.jsp").forward(req, resp);
		}
		// 新到商品
		else if (url.equals("/goods/newGoods.action")) {
			List<Goods> goodslist = new ArrayList<Goods>();
			goodslist = GoodsService.getNewgoods();

			req.setAttribute("newGoods", goodslist);

			req.getRequestDispatcher("/goods/new_goods.jsp").forward(req, resp);
		}
		// 热销商品
		else if (url.equals("/goods/saleGoods.action")) {
			List<Goods> goodslist = new ArrayList<Goods>();
			goodslist = GoodsService.getSalegoods();
			req.setAttribute("salesGoods", goodslist);
			req.getRequestDispatcher("/goods/sale_goods.jsp").forward(req, resp);

		}
		//搜索
		else if(url.equals("/goods/searchGoods.action")) {
			req.setCharacterEncoding("utf-8");
	          List<Goods> goodslist=new ArrayList<Goods>();
	          String keyword=req.getParameter("keyword");
	          //获取商品列表
	          goodslist=GoodsService.searchGoods(keyword);
	          //把商品列表保存到request对象
	          req.setAttribute("goods", goodslist);
	          //请求转发
	          req.getRequestDispatcher("/goods/search_goods.jsp").forward(req, resp);
		}
		// 商品分类
		else if (url.equals("/goods/goodsCate.action")) {

			List<Goods> goodslist = new ArrayList<Goods>();
			// 获取参数
			int childid = Integer.parseInt(req.getParameter("childid"));
			// goodslist=GoodsService.getCategoods(0);
			// 根据id获得商品
			goodslist = GoodsService.getCategoods(childid);
			req.setAttribute("childid", childid);
			// System.out.println("========"+req.getParameter("childid"));
			req.setAttribute("goods", goodslist);
			req.getRequestDispatcher("/goods/goods_list.jsp").forward(req, resp);

		}
		// 加入购物车
		else if (url.equals("/goods/addCart.action")) {
			List<Goods> goodslist = new ArrayList<Goods>();
			Object ob = req.getSession().getAttribute("goodslist");
			if (ob != null) {
				goodslist = (List<Goods>) ob;
			}
			resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			try {
				int goodsId = Integer.parseInt(req.getParameter("goodsId"));
				String goodsName = req.getParameter("goodsName");
				Float goodsPrice = Float.parseFloat(req.getParameter("goodsPrice"));
				Float goodsDiscount = Float.parseFloat(req.getParameter("goodsDiscount"));
				int goodsPostalfee = Integer.parseInt(req.getParameter("goodsPostalfee"));
				int goodsSales = Integer.parseInt(req.getParameter("goodsSales"));

				Goods good = new Goods();
				good.setGoodsId(goodsId);
				good.setGoodsName(goodsName);
				good.setGoodsPrice(goodsPrice);
				good.setGoodsDiscount(goodsDiscount);
				good.setGoodsPostalfee(goodsPostalfee);

				if (ob != null) {
					for (int i = 0; i < goodslist.size(); i++) {
						int goods_id = goodslist.get(i).getGoodsId();
						if (goods_id == goodsId) {
							// System.out.println("--相等---"+i);
							good.setGoodsSales(goodslist.get(i).getGoodsSales() + goodsSales);
							goodslist.remove(i);
						} else {
							good.setGoodsSales(goodsSales);
						}
					}
				} else {
					good.setGoodsSales(goodsSales);
				}
				goodslist.add(good);

				req.getSession().setAttribute("goodslist", goodslist);

				out.print("{\"success\":true,\"cartnum\":" + goodslist.size() + "}");

			} catch (Exception e) {
				e.printStackTrace();
				out.print("{\"success\":false}");
			}
			out.flush();
		}
		// 新到商品移动端接口json
		else if (url.equals("/goods/newGoodsForMobile.action")) {
			resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();

			List<Goods> goodslist = new ArrayList<Goods>();
			goodslist = GoodsService.getNewgoods();

			ObjectMapper mapper = new ObjectMapper();
			String jsonlist = mapper.writeValueAsString(goodslist);
			System.out.println(jsonlist);
			out.print(jsonlist);
			out.flush();
		}
		//删除
	    else if(url.equals("/goods/delCart.action")){
	      List<Goods> goodslist=(List<Goods>)req.getSession().getAttribute("goodslist");
	      
	      int goodsId=Integer.parseInt(req.getParameter("goodsId"));
	      resp.setContentType("text/json; charset=utf-8");
	      PrintWriter out = resp.getWriter();
	      try{
	        
	                if(goodslist!=null){
	                    for(int i=0;i<goodslist.size();i++){
	                      int goods_id=goodslist.get(i).getGoodsId();
	                      if(goods_id==goodsId){                                 
	                        goodslist.remove(i);  
	                      }
	                      }
	                    }
	              

	        req.getSession().setAttribute("goodslist", goodslist);
	      
	        out.print("{\"success\":true,\"cartnum\":"+goodslist.size()+"}");
	      
	      }catch(Exception e){
	        e.printStackTrace();
	        out.print("{\"success\":false}");
	      }
	             out.flush();
	    }    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
