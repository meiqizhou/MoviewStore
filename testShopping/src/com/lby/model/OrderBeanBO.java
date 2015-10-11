package com.lby.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
//和订单表对应

public class OrderBeanBO {
	private Connection ct = null;
	private Statement sm = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private int orderId = 1;
	
	public boolean addOrder(MyCartBO mcb, String userId) {
		boolean b = false;
		try {
			ct = new ConnDB().getConnection();
			ps = ct.prepareStatement("insert into testdb3.orders (userId, isPayed, totalPrice) values (?, ?, ?)");
			ps.setString(1, userId);
			ps.setByte(2, (byte) 0);			
			ps.setString(3, mcb.calculatePrice(mcb.showMyCart()));
			int a = ps.executeUpdate();
			if(a == 1) {
				//orders表添加成功，
				//取出刚刚添加的订单号(最后那条)
				b = true;
				ps = ct.prepareStatement("select max(orderId) from testdb3.orders");
				rs = ps.executeQuery();
				if(rs.next()) {
					orderId = rs.getInt(1);
				}
				//添加orderdetail
				List<GoodsBean> list = mcb.showMyCart();
				//批量操作数据库，提高效率
				sm = ct.createStatement();
				for(int i = 0; i < list.size(); i++) {
					GoodsBean gb = list.get(i);
					sm.addBatch("insert into testdb3.orderDetail (orderId, goodsId, nums) values ('"+orderId+"','"+gb.getGoodsId()+"',"+mcb.getGoodsNumById(gb.getGoodsId())+")");
				}
				sm.executeBatch();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return b;
	}	
	
	private void close() {
		// TODO Auto-generated method stub
		try {
			if(ct != null) {
				ct.close();
				ct = null;
			}
			if(sm != null) {
				sm.close();
				sm = null;
			}
			if(ps != null) {
				ps.close();
				ps = null;
			}
			if(rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getOrderNumber() {
		// TODO Auto-generated method stub
		return String.valueOf(orderId);
	}

	public boolean changeClickNum(MyCartBO mcb) {
		// TODO Auto-generated method stub
		boolean b = true;
		List<GoodsBean> list = mcb.showMyCart();
		try {
			ct = new ConnDB().getConnection();
			for(int i = 0; i < list.size(); i++) {
				GoodsBean gb = list.get(i);
				String goodsId = gb.getGoodsId();
				//取出click number
				ps = ct.prepareStatement("select clickNum from testdb3.goods where goodsId='"+goodsId+"'");
				rs = ps.executeQuery();
				int clickNum = 0;
				if(rs.next()) {
					clickNum = rs.getInt(1);
				}
				ps = ct.prepareStatement("update testdb3.goods set clickNum=? where goodsId='"+goodsId+"'");
				ps.setInt(1, clickNum + Integer.parseInt(mcb.getGoodsNumById(goodsId)));
				int a = ps.executeUpdate();
				if(a != 1) b = false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return b;
	}
}
