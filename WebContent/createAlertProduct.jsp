<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Alerts</title>

</head>
<body>
    <%
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
    Statement stmt = con.createStatement();
    PreparedStatement ps = null;
    ResultSet result = null;
    int product_id = Integer.parseInt(request.getParameter("product_id"));
    String username = (String)session.getAttribute("user");
    String insert = "INSERT INTO alerts(username, alert_message, product_id)"
					+ "VALUES (?, ?, ?)" ;
	ps = con.prepareStatement(insert);
	String message="Alert set for this item"; 
	ps.setString(1, username);
	ps.setString(2, message);
	ps.setInt(3, product_id);
	ps.executeUpdate();
	
	response.sendRedirect("alertSuccess.jsp");		
	 %>

	 </body>
	 </html>
	 