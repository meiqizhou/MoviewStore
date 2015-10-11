package com.lby.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lby.model.GoodsBean;
import com.lby.model.MyCartBO;

/**
 * Servlet implementation class ShoppingCIServlet
 */
@WebServlet("/ShoppingCIServlet")
public class ShoppingCIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		//每次新建一个购物车这是不行的，要用session技术
		HttpSession hs = request.getSession(true);
		hs.setMaxInactiveInterval(3600*24*7);
		MyCartBO mbo = (MyCartBO) hs.getAttribute("myCart");
		if(mbo == null) {
			mbo = new MyCartBO();
			hs.setAttribute("myCart", mbo);
		}
		if(type.equals("addGoods")) {
			String goodsId = request.getParameter("goodsId");
			mbo.addGoods(goodsId, "1");			
		}
		else if(type.equals("deleteGoods")) {
			String goodsId = request.getParameter("goodsId");
			mbo.deleteGoods(goodsId);
		}
		else if(type.equals("clear")) {
			mbo.clear();
		}
		else if(type.equals("back")) {
			//do nothing
		}
		else if(type.equals("update")) {
			//修改数量
			//怎样在servlet中得到货物的数量和Id，隐藏表单
			String[] goodsId = request.getParameterValues("goodsId");
			String[] newNum = request.getParameterValues("newNum");
			for(int i = 0; i < goodsId.length; i++) {
//				System.out.println("goodsId is " + goodsId[i] + " newNum is " + newNum[i]);
				mbo.update(goodsId[i], newNum[i]);
			}
		}
		List<GoodsBean> list = mbo.showMyCart();
		String total = mbo.calculatePrice(list);
		request.setAttribute("totalPrice", total);
		request.setAttribute("preCart", list);
		request.getRequestDispatcher("showMyCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
