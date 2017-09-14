package com.itstep.core;

import java.sql.*;

public class DbService {
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
	
	public static ResultSet getArticles() {
		ResultSet rs = null;
		String q = "SELECT ID,CATEGORY,TITLE,CONTENTS,IMGURL,RATING FROM ARTICLES";
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(q);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static ResultSet getArticle(int id) {
		ResultSet rs = null;
		String q = "SELECT CATEGORY, TITLE, CONTENTS, IMGURL, RATING FROM ARTICLES WHERE ID=?";
		try {
			PreparedStatement st = conn.prepareStatement(q);
			st.setInt(1, id);
			rs = st.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
