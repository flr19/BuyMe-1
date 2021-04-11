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
   // System.out.println("I am an asswhoel"+auction_id);

   //have to run query first to get th current bid of the item
   
    
    String insert = "INSERT INTO alerts(username, alert_message, user_bid, auction_id)"
					+ "VALUES (?, ?, ?, ?)" ;
    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
	ps = con.prepareStatement(insert);
	String message="You have been outbidded on this item"; 
    //how to get current bid??
    int currentbid=session.getAttribute()
	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	ps.setString(1, username);
	ps.setString(2, message);
	ps.setFloat(3, currentbid);
	ps.setInt(4, auction_id);