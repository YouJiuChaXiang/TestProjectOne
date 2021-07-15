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
import model.User;
import service.HomeService;

/**
 * Servlet implementation class HomeController
 */

@WebServlet(urlPatterns ={"/index.action","/login.action","/logout.action","/reg.action","/getLogin.action"})
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
		else if(url.equals("/login.action")){
			resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			String username=req.getParameter("userName");
			String password=req.getParameter("userPass");
//			int num=HomeService.getCheckUser(username,password);
			User loginuser=new User();
			loginuser=HomeService.getCheckUser(username, password);
			
			if(loginuser!=null){
				req.getSession().setAttribute("_LOGIN_USER_",loginuser);
				out.print("{\"login\":true,\"username\":\""+username+"\"}");
			}else{
				out.print("{\"login\":false,\"msg\":\"用户名或密码错误\"}");
			}
			out.flush();
		}else if(url.equals("/logout.action")){
			req.getSession().removeAttribute("_LOGIN_USER_");
			
		}else if(url.equals("/reg.action")){
			resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			String username=req.getParameter("userName");
			String password=req.getParameter("userPass");		
			int i=HomeService.regUser(req.getParameterMap());
			if(i>=1){
				req.setCharacterEncoding("utf-8");
				User loginuser=HomeService.getCheckUser(username, password);
//			  User loginuser=new User();
//			  loginuser.setUserName(username);
			  req.getSession().setAttribute("_LOGIN_USER_",loginuser);	
			  out.print("{\"reg\":true,\"username\":\""+username+"\"}");
		    }else{
			   out.print("{\"reg\":false}");
		    }
			
			out.flush();
		}else if(url.equals("/getLogin.action")){
		      resp.setContentType("text/json; charset=utf-8");
		      PrintWriter out = resp.getWriter();
		      
		      User loginuser=new User();
		      loginuser=(User) req.getSession().getAttribute("_LOGIN_USER_");
		      
		      if(loginuser!=null){
		        req.getSession().setAttribute("_LOGIN_USER_",loginuser);
		        out.print("{\"login\":true,\"username\":\""+loginuser.getUserName()+"\"}");
		      }else{
		        out.print("{\"login\":false,\"msg\":\"用户名或密码错误\"}");
		      }
		      out.flush();
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
