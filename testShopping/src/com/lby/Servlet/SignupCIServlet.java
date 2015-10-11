package com.lby.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lby.model.UserBeanBO;

/**
 * Servlet implementation class SignupCIServlet
 */
@WebServlet("/SignupCIServlet")
public class SignupCIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupCIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String update = request.getParameter("update");
		String username = request.getParameter("username");
		String truename = request.getParameter("truename");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String postcode = request.getParameter("zipcode");
		UserBeanBO ubb = new UserBeanBO();
		if(update != null) {
			if(ubb.updateUser(username, truename, password, email, phone, address, postcode)) {
				request.setAttribute("update", "1");
				request.getRequestDispatcher("LoginCIServlet").forward(request, response);
			}
		}
		else {
			String error = ubb.checkSignUp(username, password, truename, email, phone, address, postcode);
			if(error.equals("0")) {
				//内容符合要求
				if(ubb.importUser(username, truename, password, email, phone, address, postcode)) {
					//注册成功
					request.setAttribute("username", username);
					request.getRequestDispatcher("LoginCIServlet").forward(request, response);
				}
				else {
					request.setAttribute("error", "5");
					request.getRequestDispatcher("userSignup.jsp");
				}
			}
			else if(error.equals("1")) {
				request.setAttribute("error", "usernameexist");
				request.getRequestDispatcher("userSignup.jsp").forward(request, response);
			}
			else if(error.equals("2")) {
				request.setAttribute("error", "emailexist");
				request.getRequestDispatcher("userSignup.jsp").forward(request, response);
			}
			else if(error.equals("3")) {
				request.setAttribute("error", "passwordformat");
				request.getRequestDispatcher("userSignup.jsp").forward(request, response);
			}
			else if(error.equals("4")) {
				request.setAttribute("error", "lessItem");
				request.getRequestDispatcher("userSignup.jsp").forward(request, response);
			}
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
