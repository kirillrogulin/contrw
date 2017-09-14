<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.itstep.core.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Welcome page</title>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div id="navbar" class="navbar-collapse collapse align-right">
				<ul class="nav navbar-nav">
            		<li><a href="#">Register</a></li>
            		<li><a href="#">Login</a></li>
            	</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-md-8">
			<h1>Welcome!</h1>
			<h2>Это стартовая страница.</h2>
			<br>
		</div>
	</div>
	<hr>
	<p>Статьи:</p>
	<table>
		<thead>
			<tr>
				<th>Category</th>
				<th>Title</th>
				<th>Rating</th>
			</tr>
		</thead>
	<%
		List<Article> list = new ArrayList<Article>();
		Article a = null;
	try {
		ResultSet rs = DbService.getArticles();
		while(rs.next()) {
			a = new Article();
			a.setId(rs.getInt("ID"));
			a.setCategory(rs.getString("CATEGORY"));
			a.setTitle(rs.getString("TITLE"));
			a.setContents(rs.getString("CONTENTS"));
			a.setImgURL(rs.getString("IMGURL"));
			a.setRating(rs.getInt("RATING"));
			list.add(a);
		}
	} catch(Exception e) {e.printStackTrace();}
		Collections.sort(list, new Comparator<Article>() {
			@Override
			public int compare(Article a1, Article a2) {
				if(a1.getRating()>a2.getRating()) return 1;
				else if(a1.getRating()<a2.getRating()) return -1;
				return 0;
			}
		});
		for(Article aa: list){
	%>
		<tr>
			<td>
				<a href="article?id=${aa.getId()}"><c:out value="${aa.getCategory()}"/></a>
			</td>
			<td><%=aa.getTitle() %></td>
			<td><%=aa.getRating() %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>