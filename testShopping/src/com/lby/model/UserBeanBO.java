package com.lby.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserBeanBO {
	private Connection ct = null;
	private Statement sm = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean checkUser(String username, String password) {
		// TODO Auto-generated method stub
		boolean b = false;
		ConnDB conn = new ConnDB();
		try {
			ct = conn.getConnection();
			ps = ct.prepareStatement("select password from testdb3.users where username='" + username + "' limit 1");
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPassword = rs.getString(1);
				if(dbPassword.equals(password)) {
					b = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return b;
	}
	
	public UserBean getUserBean(String username) {
		ConnDB conn = new ConnDB();
		UserBean ub = new UserBean();
		try {
			ct = conn.getConnection();
			ps = ct.prepareStatement("select * from testdb3.users where username='" + username + "'");
			rs = ps.executeQuery();
			while(rs.next()) {
				ub.setUserId(rs.getLong(1));
				ub.setUsername(rs.getString(2));
				ub.setTruename(rs.getString(3));
				ub.setPassword(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setPhone(rs.getString(6));
				ub.setAddress(rs.getString(7));
				ub.setPostcode(rs.getString(8));
				ub.setGrade(rs.getInt(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return ub;
		
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

	public String checkSignUp(String username, String password, String truename, String email, String phone, String address, String postcode) {
		// TODO Auto-generated method stub
		String error = "0";
		try {
			ct = new ConnDB().getConnection();
			ps = ct.prepareStatement("select * from testdb3.users where username='"+username+"'");
			rs = ps.executeQuery();
			if(rs.next()) {
				//用户名重复
				error = "1";
				this.close();
				return error;
			}
			ps = ct.prepareStatement("select * from testdb3.users where email='" + email + "'");
			rs = ps.executeQuery();
			if(rs.next()) {
				//email重复
				error = "2";
				this.close();
				return error;
			}
			if(!passwordFormat(password) && !password.equals("")) {
				//密码格式不正确
				error = "3";
				this.close();
				return error;
			}
			if(username.equals("") || password.equals("") || truename.equals("") || email.equals("") || phone.equals("") || address.equals("") || postcode.equals("")) {
				//没填全
				error = "4";
				this.close();
				return error;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return error;
		
	}

	private boolean passwordFormat(String password) {
		// TODO Auto-generated method stub
		boolean digit = false, character = false;
		for(int i = 0; i < password.length(); i++) {
			char c = password.charAt(i);
			if(Character.isDigit(c)) digit = true;
			else if(Character.isAlphabetic(c)) character = true;
		}
		return digit && character;
	}

	public boolean importUser(String username, String truename, String password,
			String email, String phone, String address, String postcode) {
		// TODO Auto-generated method stub
		boolean b = false;
		try {
			ct = new ConnDB().getConnection();
			sm = ct.createStatement();
			int a = sm.executeUpdate("insert into testdb3.users (username, password, truename, email, phone, address, postcode, grade) "
					+ "values ('"+username+"', '"+password+"','"+truename+"', '"+email+"','"+phone+"','"+address+"','"+postcode+"',1)");
			if(a == 1) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return b;
	}

	public boolean updateUser(String username, String truename, String password,
			String email, String phone, String address, String postcode) {
		// TODO Auto-generated method stub
		boolean b = false;
		try {
			ct = new ConnDB().getConnection();
			sm = ct.createStatement();
			String sql="update testdb3.users set truename='"+truename+"',email='"+email+"',phone='"+phone+"',address='"+address+"',postcode='"+postcode+"' where username='"+username+"'";
			int a = sm.executeUpdate(sql);
			if(a == 1) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return b;
	}
	
}
