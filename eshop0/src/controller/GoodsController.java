package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	//@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url=req.getServletPath();
		//导航菜单商品分类下拉列表
		List<Category> catelist = HomeService.getcateList();
	    req.setAttribute("catelist", catelist);
		
		if(url.equals("/goods/goodsDetail.action")){
			Goods goodsDetail=new Goods();
			int goods_id=Integer.parseInt(req.getParameter("goods_id"));
			goodsDetail=GoodsService.getGoodsDetail(goods_id);

			req.setAttribute("goodsDetail", goodsDetail);
			Category cate=new Category();
			
			cate=GoodsService.getCateName(goods_id);
			req.setAttribute("cate", cate);
			req.getRequestDispatcher("/goods/goods_detail.jsp").forward(req, resp);
		//新到商品
		}else if(url.equals("/goods/newGoods.action")){
			List<Goods> goodslist=new ArrayList<Goods>();
			goodslist=GoodsService.getNewgoods();
			
			req.setAttribute("newGoods", goodslist);

			req.getRequestDispatcher("/goods/new_goods.jsp").forward(req, resp);
			
		//热销商品
		}else if(url.equals("/goods/saleGoods.action")){
			List<Goods> goodslist=new ArrayList<Goods>();
			goodslist=GoodsService.getSalegoods();		
			req.setAttribute("salesGoods", goodslist);
			req.getRequestDispatcher("/goods/sale_goods.jsp").forward(req, resp);
		
		//商品分类
		}else if(url.equals("/goods/goodsCate.action")){

			List<Goods> goodslist=new ArrayList<Goods>();
			int childid=Integer.parseInt(req.getParameter("childid"));
			goodslist=GoodsService.getCategoods(childid);	
			req.setAttribute("childid", childid);
//			System.out.println("========"+req.getParameter("childid"));
			req.setAttribute("goods", goodslist);
			req.getRequestDispatcher("/goods/goods_list.jsp").forward(req, resp);
			
		}		
	}


	
}
