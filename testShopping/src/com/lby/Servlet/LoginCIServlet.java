package com.lby.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lby.model.GoodsBean;
import com.lby.model.MyCartBO;
import com.lby.model.UserBean;
import com.lby.model.UserBeanBO;

/**
 * Servlet implementation class LoginCIServlet
 */
@WebServlet("/LoginCIServlet")
public class LoginCIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String update = (String) request.getAttribute("update");
		String username = request.getParameter("username");
		String password = request.getParameter("password");		
		UserBeanBO ubc = new UserBeanBO();
		if(ubc.checkUser(username, password) || update != null) {
			//验证成功
			//session
			UserBean ub = ubc.getUserBean(username);
			//用户信息
			request.getSession().setAttribute("userInfo", ub);
			//购物车信息
			MyCartBO mcb = (MyCartBO) request.getSession().getAttribute("myCart");
			request.getRequestDispatcher("shopping3.jsp").forward(request, response);
		}
		else if(username != null || password != null){
			request.setAttribute("error", "error1");
			request.getRequestDispatcher("shopping2.jsp").forward(request, response);
		}
		else request.getRequestDispatcher("shopping2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
