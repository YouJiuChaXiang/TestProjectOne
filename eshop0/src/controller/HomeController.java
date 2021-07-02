package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.HomesUserDatabase;

import model.Category;
import model.Goods;
import service.HomeService;

/**
 * Servlet implementation class HomeController
 */

@WebServlet(urlPatterns ={"/index.action"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getServletPath();		
		if(url.equals("/index.action")){
			List <Map<String,String>> list = HomeService.getTodayGoodsList();
			req.setAttribute("todaylist", list);
			
			List<Category> list1 = HomeService.getcateList();
			req.setAttribute("catelist", list1);

			List<Goods> list2=HomeService.getHotGoodsList();
			req.setAttribute("hotgoodslist", list2);
			
		    req.getRequestDispatcher("/home.jsp").forward(req, resp);		
		   	
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
