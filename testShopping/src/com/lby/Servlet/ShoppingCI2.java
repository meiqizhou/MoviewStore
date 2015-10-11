package com.lby.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lby.model.UserBean;

/**
 * Servlet implementation class ShoppingCI2
 */
//检测用户是否登陆过
@WebServlet("/ShoppingCI2")
public class ShoppingCI2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCI2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		if(type != null) {
			request.getSession().removeAttribute("userInfo");
		}
		//看看session中是否有用户登录的信息
		UserBean ub = (UserBean) request.getSession().getAttribute("userInfo");
		if(ub == null) {
			request.getRequestDispatcher("shopping2.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("shopping3.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
