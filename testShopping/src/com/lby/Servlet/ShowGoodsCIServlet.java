package com.lby.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lby.model.GoodsBean;
import com.lby.model.GoodsBeanBo;

/**
 * Servlet implementation class ShowGoodsCIServlet
 */
@WebServlet("/ShowGoodsCIServlet")
public class ShowGoodsCIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowGoodsCIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//得到要显示货物的ID号
		String flag = request.getParameter("flag");
		if(flag.equals("showdetail") || flag.equals("updateGoods")) {
			String goodsId = request.getParameter("goodsId");
			GoodsBeanBo gbb = new GoodsBeanBo();
			GoodsBean gb = gbb.getGoodsBean(goodsId);
			//把gb让入request
			request.setAttribute("GoodsBean", gb);
			request.getRequestDispatcher("showDetails.jsp").forward(request, response);
		}
		else if(flag.equals("fenye")) {
			String pageNow = request.getParameter("pageNow");
			String type = request.getParameter("type");
			if(type != null) request.setAttribute("type", type);
			request.setAttribute("pageNow", pageNow);
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
