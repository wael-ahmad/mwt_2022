package com.mwt_wjd.helper;

import java.sql.*;
public class GetDatabaseConnection {

	private static String url = "jdbc:postgresql://ec2-52-30-67-143.eu-west-1.compute.amazonaws.com:5432/d9di4fco067fro";
	private static String username = "eyaynajizzxvfh";
	private static String password = "2180de3b721c3b93072c3bc9742eef6693792c1f92dc33d310192f69655c2725";
	
	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn == null) {
			try {
				//Class.forName("com.mysql.cj.jdbc.Driver");
				Class.forName("org.postgresql.Driver");
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
