package com.mwt_wjd.helper;

import java.sql.*;
public class GetDatabaseConnection {
	
	private static String url = "jdbc:mysql://localhost:3306/mwt_wjd_db";
	private static String username = "root";
	private static String password = "";
	
	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
				System.out.println("Connected To Database");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			return conn;
		}
		
		return conn;
	}
}
