package com.lby.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnDB {
	private Connection ct = null;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Found");
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Diver not Found" + e);
		}
		String url = "jdbc:mysql://127.0.0.1/mysql";
		String user = "root";
		String password = "53939109";
		try {
			ct = DriverManager.getConnection(url, user, password);
			System.out.println("Connection Successfully");
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Something wrong with Connection" + e);
		}
		return ct;
	}
}
