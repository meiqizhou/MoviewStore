package com.lby.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//业务逻辑类
public class GoodsBeanBo {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	/**
	 * @author lby
	 * @return
	 */
	public int getPageCount (int pageSize) {
		int pageCount = 0, rowCount = 0;
		ConnDB conn = new ConnDB();
		try {
			ct = conn.getConnection();
			ps = ct.prepareStatement("Select count(*) from testdb3.goods where 1");
			rs = ps.executeQuery();
			if(rs.next()) {
				rowCount = rs.getInt(1);
			}
			pageCount = rowCount % pageSize == 0 ? rowCount / pageSize : rowCount / pageSize + 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return pageCount;
	}
	
	//分页功能
	public List<GoodsBean> getGoodsByPage (int pageSize, int pageNow) {
		List<GoodsBean> list = new ArrayList<GoodsBean>();
		try {
			ConnDB conn = new ConnDB();
			ct = conn.getConnection();
			ps = ct.prepareStatement("select * from testdb3.goods limit " + (pageNow - 1) * pageSize + 	", " + pageSize);
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
				gb.setClickNum(rs.getInt(9));
				list.add(gb);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
	}
	
	public List<GoodsBean> getMovieByPageNowAndType(String type, int pageSize, int pageNow) {
		// TODO Auto-generated method stub
		List<GoodsBean> list = new ArrayList<GoodsBean>();
		try {
			ConnDB conn = new ConnDB();
			ct = conn.getConnection();
			ps = ct.prepareStatement("select * from testdb3.goods where type='"+type+"' limit " + (pageNow - 1) * pageSize + 	", " + pageSize);
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
				gb.setClickNum(rs.getInt(9));
				list.add(gb);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
	} 
	
	
	
	//根据id，得到商品具体信息
	public GoodsBean getGoodsBean(String goodsId) {
		GoodsBean gb = new GoodsBean();		
		ConnDB conn = new ConnDB();
		ct = conn.getConnection();
		try {
			ps = ct.prepareStatement("select * from testdb3.goods where goodsId='"+goodsId+"'");
			rs = ps.executeQuery();
			if(rs.next()) {
				gb.setGoodsId(rs.getString(1));
				gb.setGoodsName(rs.getString(2));
				gb.setGoodsInfo(rs.getString(3));
				gb.setGoodsPrice(rs.getFloat(4));
				gb.setGoodsNum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));
				gb.setType(rs.getString(8));
				gb.setClickNum(rs.getInt(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return gb;
	}
	
	private void close() {
		// TODO Auto-generated method stub
		try {
			if(ct != null) {
				ct.close();
				ct = null;
			}
			if(ps != null) {
				ps.close();
				ps = null;
			}
			if(rs != null) {
				rs.close();
				rs = null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
