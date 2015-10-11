package com.lby.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//处理与购物相关的业务逻辑
public class MyCartBO {
	private Map<String, String> map = new HashMap<String, String>();
	private Connection ct = null;
	private Statement sm = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	//
	public String getGoodsNumById(String goodsId) {
		return map.get(goodsId);
	}
	
	//添加货物
	public void addGoods(String goodsId, String num) {
		if(!map.containsKey(goodsId)) map.put(goodsId, num);
		else {
			String prev_s = map.get(goodsId);
			int prev = Integer.parseInt(prev_s);
			map.put(goodsId, String.valueOf(prev + 1));
		}
	}
	
	//删除货物
	public void deleteGoods(String goodsId) {
		map.remove(goodsId);
	}
	
	//修改货物(数量)
	public void update(String goodsId, String num) {
		map.put(goodsId, num);
	}
	
	//清空货物
	public void clear() {
		map.clear();
	}
	
	//显示购物车
	public List<GoodsBean> showMyCart() {
		List<GoodsBean> list = new ArrayList<GoodsBean>();
		try {
			ct = new ConnDB().getConnection();
			String str = getSQLString();
			if(str != null) {
				ps = ct.prepareStatement("select * from testdb3.goods where goodsId in("+str+")");
				rs = ps.executeQuery();
				while(rs.next()) {
					GoodsBean gb = new GoodsBean();
					gb.setGoodsId(rs.getString(1));
					gb.setGoodsName(rs.getString(2));
					gb.setGoodsInfo(rs.getString(3));
					gb.setGoodsPrice(rs.getFloat(4));
					gb.setGoodsNum(rs.getInt(5));
					gb.setPublisher(rs.getString(6));
					gb.setPhoto(rs.getString(7));
					gb.setType(rs.getString(8));
					list.add(gb);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
		
	}
	
	public String getSQLString() {
		StringBuilder sb = new StringBuilder();
		for(String userId: map.keySet()) {
			sb.append(userId);
			sb.append(",");
		}
		return sb.length() == 0 ? sb.toString() : sb.substring(0, sb.length() - 1).toString();
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

	public String calculatePrice(List<GoodsBean> list) {
		// TODO Auto-generated method stub
		double res = 0;
		for(int i = 0; i < list.size(); i++) {
			GoodsBean gb = list.get(i);
			float goodsPrice = gb.getGoodsPrice();
			String goodsId = gb.getGoodsId();
			int goodsNum = Integer.parseInt(getGoodsNumById(goodsId));
			res += goodsPrice * goodsNum;
		}
		return res + "";
	}
}
