package com.itstep.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	static Connection conn;
	static String URL = "jdbc:h2:~/testdb";
	static String user = "sa";
	static String pass = "";
	
	static {
		try {
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(URL, user, pass);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
