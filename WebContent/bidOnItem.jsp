<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Item Bid</title>
</head>
<body>
	<% 
	//Create a connection string
	
ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	ResultSet result = null;
	String amnt = null;
	String SELLER_USERNAME = null;
	String STATUS = null;
	/* if(session.getAttribute("ACCOUNT_TYPE").equals("seller"))
	{
		out.print("Logged in as: Seller");
		out.print("<br/>");
		out.print("Username: " +  session.getAttribute("USERNAME"));
		out.print("<br/>");
	}
	if(session.getAttribute("ACCOUNT_TYPE").equals("buyer"))
	{
		out.print("Logged in as: Buyer");
		out.print("<br/>");
		out.print("Username: " +  session.getAttribute("USERNAME"));
		out.print("<br/>");
	} 
	 */
/* 	out.print("<br/>"); */
	try {
			String auctionID = request.getParameter("auction");
			
			String str = "SELECT * FROM Auction " + "JOIN Items using (item_id) " +  
					"WHERE auction_id ='" + auctionID + "'";
			result = stmt.executeQuery(str);
			result.next();	
			if(result.getString("type").equals("PC"))
			{
				str = "SELECT * FROM Auction JOIN Items using (item_id)" + 
					"JOIN Bids using (auction_id)" +
					"JOIN PC using (item_id, model)" +
					"WHERE auction_id ='" + auctionID + "'" + 
					"ORDER BY amount DESC LIMIT 1;";
				result = stmt.executeQuery(str);
				result.next();
				
				SELLER_USERNAME = result.getString("username");
				STATUS = result.getString("status");
				
				out.print("Auction ID: " + result.getString("auction_id"));
				out.println("<br>");
				out.print("Seller: " + result.getString("username"));
				out.println("<br>");
				out.print("Type: " + result.getString("type"));
				out.println("<br>");
				out.print("Manufacturer: " + result.getString("maker"));
				out.println("<br>");
				out.print("Model: " + result.getString("model"));
				out.println("<br>");
				out.print("Hard Drive: " + result.getString("hd"));
				out.println("<br>");
				out.print("RAM: " + result.getString("ram"));
				out.println("<br>");
				out.print("Start Time: " + result.getString("start_date"));
				out.println("<br>");
				out.print("End Time: " + result.getString("end_date"));
				out.println("<br>");
				out.print("Status: " + result.getString("status"));
				out.println("<br>");
				String tempwinner = result.getString("winner");
				if (result.wasNull())
					tempwinner = " ";
				out.print("Winner: " + tempwinner); 
				out.println("<br>");
				out.print("Max Bid: $" + result.getString("amount"));
				out.println("<br>");
				session.setAttribute( "AUCTION", result.getString("auction_id") );
			}
			
			if(result.getString("type").equals("Laptop"))
			{
				str = "SELECT * FROM Auction JOIN Items using (item_id)" + 
					"JOIN Bids using (auction_id)" +
					"JOIN Laptops using (item_id, model)" +
					"WHERE auction_id ='" + auctionID + "'" + 
					"ORDER BY amount DESC LIMIT 1;";
				result = stmt.executeQuery(str);
				result.next();
				
				SELLER_USERNAME = result.getString("username");
				STATUS = result.getString("status");
				
				out.print("Auction ID: " + result.getString("auction_id"));
				out.println("<br>");
				out.print("Type: " + result.getString("type"));
				out.println("<br>");
				out.print("Manufacturer: " + result.getString("maker"));
				out.println("<br>");
				out.print("Model: " + result.getString("model"));
				out.println("<br>");
				out.print("Hard Drive: " + result.getString("hd"));
				out.println("<br>");
				out.print("RAM: " + result.getString("ram"));
				out.println("<br>");
				out.print("Screen: " + result.getString("screen"));
				out.println("<br>");
				out.print("Start Time: " + result.getString("start_date"));
				out.println("<br>");
				out.print("End Time: " + result.getString("end_date"));
				out.println("<br>");
				out.print("Status: " + result.getString("status"));
				out.println("<br>");
				String tempwinner = result.getString("winner");
				if (result.wasNull())
					tempwinner = " ";
				out.print("Winner: " + tempwinner); 
				out.println("<br>");
				out.print("Max Bid: $" + result.getString("amount"));
				out.println("<br>");
				session.setAttribute( "AUCTION", result.getString("auction_id") );
			}
			
			if(result.getString("type").equals("Tablet"))
			{
				str = "SELECT * FROM Auction JOIN Items using (item_id)" + 
					"JOIN Bids using (auction_id)" +
					"JOIN Tablets using (item_id, model)" +
					"WHERE auction_id ='" + auctionID + "'" + 
					"ORDER BY amount DESC LIMIT 1;";
				result = stmt.executeQuery(str);
				result.next();
				
				SELLER_USERNAME = result.getString("username");
				STATUS = result.getString("status");
				
				out.print("Auction ID: " + result.getString("auction_id"));
				out.println("<br>");
				out.print("Type: " + result.getString("type"));
				out.println("<br>");
				out.print("Manufacturer: " + result.getString("maker"));
				out.println("<br>");
				out.print("Model: " + result.getString("model"));
				out.println("<br>");
				out.print("Color: " + result.getString("color"));
				out.println("<br>");
				out.print("Capacity: " + result.getString("capacity"));
				out.println("<br>");
				out.print("Screen: " + result.getString("screen"));
				out.println("<br>");
				out.print("Start Time: " + result.getString("start_date"));
				out.println("<br>");
				out.print("End Time: " + result.getString("end_date"));
				out.println("<br>");
				out.print("Status: " + result.getString("status"));
				out.println("<br>");
				String tempwinner = result.getString("winner");
				if (result.wasNull())
					tempwinner = " ";
				out.print("Winner: " + tempwinner); 
				out.println("<br>");
				out.print("Max Bid: $" + result.getString("amount"));
				out.println("<br>");
				session.setAttribute( "AUCTION", result.getString("auction_id") );
				amnt = result.getString("amount");
			}
		} 
	catch (Exception e) 
	{
			out.print(e);
	}
	finally
	{
		if (result != null) result.close();
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}
	if(session.getAttribute("ACCOUNT_TYPE").equals("buyer"))
	{
		if(STATUS.equals("open"))
		{
			out.print("<form method='post' action='bidProcess.jsp'>");
			out.print("<table>");
			out.print("<tr>");    
			out.print("<td>Bid: </td><td><input type='text' name='bid' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' min='" + amnt +"' value='Place Bid'>");
			out.print("</form>");
		}
		else
		{
			out.print("<form method='post' action='bidProcess.jsp'>");
			out.print("<table>");
			out.print("<tr>");    
			out.print("<td>Bid: </td><td><input type='text' name='bid' disabled></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' min='" + amnt +"' value='Place Bid' disabled>");
			out.print("</form>");
		}
		
		out.print("<form method='post' action='viewBidHistory.jsp'>");
		out.print("<input type='submit' value='View Bid History'>");
		out.print("</form>");
		
		out.print("<form method='post' action='../search/userParticipation.jsp'>");
		out.print("<input type='submit' value='search user'>");
		out.print("</form>");
		
	}
	
	else if (session.getAttribute("ACCOUNT_TYPE").equals("seller"))
	{
		out.print("<form method='post' action='deleteAuction.jsp'>");
		if (SELLER_USERNAME.equals(session.getAttribute("USERNAME") ))
		{
			out.print("<form action='deleteAuction.jsp' method='get'><button name='auct' type='submit' value='" + session.getAttribute( "AUCTION") + "'>Delete Auction</button></form>");
		}
		else
		{
			out.print("<input type='submit' value='Delete Auction' disabled>");
		}
		out.print("</form>");
	
		out.print("<form method='post' action='viewBidHistory.jsp'>");
		out.print("<input type='submit' value='View Bid History'>");
		out.print("</form>");
	}
	
	out.print("<form action='similarItems.jsp' method='get'><button name='auct' type='submit' value='" + session.getAttribute("AUCTION") + "'>View Similar Items From Last Month</button></form>");
	
	%>
</body>
</html> --%>