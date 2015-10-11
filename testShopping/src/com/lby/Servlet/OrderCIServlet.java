package com.lby.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lby.model.MyCartBO;
import com.lby.model.OrderBeanBO;
import com.lby.model.SendMailToSomeone;
import com.lby.model.UserBean;

/**
 * Servlet implementation class OrderCIServlet
 */
@WebServlet("/OrderCIServlet")
public class OrderCIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//把订单写入数据库
		OrderBeanBO obb = new OrderBeanBO();
		MyCartBO mcb = (MyCartBO) request.getSession().getAttribute("myCart");
		UserBean ub = (UserBean) request.getSession().getAttribute("userInfo");
		if(obb.addOrder(mcb, ub.getUserId() + "")) {
			//添加成功
			//更新购买数量
			if(obb.changeClickNum(mcb)) {
				System.out.print("Click Number Update!");
			}
			String orderNum = obb.getOrderNumber();
			request.setAttribute("orderNum", orderNum);
			request.getRequestDispatcher("shopping4.jsp").forward(request, response);
			SendMailToSomeone smts = new SendMailToSomeone();
			String mailBody = "Dear " + ub.getTruename() + " you order ticket " + orderNum + " has been completed!";  
			smts.send("Order From Boyang Movie", "mailBody", ub.getEmail(),
				    "lby1989825@gmail.com", "Haerbin0451", "smtp.gmail.com");
		}
		else {
			System.out.println("go this way");
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
