package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Address;
import model.Category;
import model.User;
import service.HomeService;
import service.UserService;

/**
 * Servlet implementation class UserCenterController
 */
@WebServlet(urlPatterns = { "/usercenter/index.action", "/usercenter/userInfo.action",
		"/usercenter/userPassword.action", "/usercenter/userAddress.action", "/usercenter/updateUserInfo.action",
		"/usercenter/delAddr.action","/usercenter/addAddr.action"})
public class UserCenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserCenterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getServletPath();
		// 导航菜单商品分类下拉列表
		List<Category> catelist = HomeService.getcateList();
		req.setAttribute("catelist", catelist);

		if (url.equals("/usercenter/index.action")) {
			req.getRequestDispatcher("/usercenter/index.jsp").forward(req, resp);
		} else if (url.equals("/usercenter/userInfo.action")) {
			// 获取当前用户的ID
			User loginuser = (User) req.getSession().getAttribute("_LOGIN_USER_");
			// 根据id获取对象
			User user = UserService.getUseById(loginuser.getUserId());
			req.setAttribute("user", user);
			req.getRequestDispatcher("/usercenter/userInfo.jsp").forward(req, resp);
		} else if (url.equals("/usercenter/userPassword.action")) {
			req.getRequestDispatcher("/usercenter/userPassword.jsp").forward(req, resp);
		}
		// 管理收货地址
		else if (url.equals("/usercenter/userAddress.action")) {
			User loginuser = (User) req.getSession().getAttribute("_LOGIN_USER_");
			List<Address> addrlist = UserService.getAddressByUser(loginuser.getUserId());
			req.setAttribute("addrlist", addrlist);
			req.getRequestDispatcher("/usercenter/userAddress.jsp").forward(req, resp);
		}

		//删除收货地址
	    else if (url.equals("/usercenter/delAddr.action")) {
	      int addrId=Integer.parseInt(req.getParameter("addr_id"));
	      //按照id删除地址
	      int i=UserService.delAddress(addrId);
	      int flag=0;
	      if(i>=1) {
	        flag=1;
	      }
	      User loginuser = (User) req.getSession().getAttribute("_LOGIN_USER_");
	      List<Address> addrlist=UserService.getAddressByUser(loginuser.getUserId());
	      req.setAttribute("addrlist",addrlist);
	      req.setAttribute("flag", flag);
	      req.getRequestDispatcher("/usercenter/userAddress.jsp").forward(req, resp);
	    }
		//添加收货地址
	    else if(url.equals("/usercenter/addAddr.action")) {
	    	 req.getRequestDispatcher("/usercenter/addAddress.jsp").forward(req, resp);
	    }

		// 更新用户信息
		else if (url.equals("/usercenter/updateUserInfo.action")) {
			resp.setContentType("text/json; charset=utf-8");
			String username = req.getParameter("userName");
			int userid = Integer.parseInt(req.getParameter("userId"));
			String password = req.getParameter("userPass");
			int i = UserService.updateUserInfo(req.getParameterMap());
			int flag = 0;
			if (i >= 1) {
				flag = 1;
				User loginuser = new User();
				loginuser.setUserName(username);
				loginuser.setUserId(userid);
				req.getSession().setAttribute("_LOGIN_USER_", loginuser);
			}
			// 根据id获取对象
			User user = UserService.getUseById(userid);
			req.setAttribute("user", user);
			req.setAttribute("flag", flag);
			req.getRequestDispatcher("/usercenter/userInfo.jsp").forward(req, resp);
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
