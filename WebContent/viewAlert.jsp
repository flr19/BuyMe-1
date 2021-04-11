<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Alerts</title>
</head>
<body>
    <%
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
    Statement stmt = con.createStatement();
    PreparedStatement ps = null;
    ResultSet result = null;
    int auction_id = Integer.parseInt(request.getParameter("auction_id"));
    String username = (String)session.getAttribute("user");
  
    String insert = "INSERT INTO alerts(username, alert_message, user_bid, auction_id)"
					+ "VALUES (?, ?, ?, ?)" ;
	ps = con.prepareStatement(insert);
	String message="You have been outbidded on this item"; 
    /* int currentbid=session.getAttribute(); */
	ps.setString(1, username);
	ps.setString(2, message);
	ps.setFloat(3, currentbid);
	ps.setInt(4, auction_id);