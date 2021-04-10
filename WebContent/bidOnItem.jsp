<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Bid on Item</title>
</head>
<body>
	<%
	//Create a connection string
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	String amnt = null;
	String seller = null;
	String status = null;
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
	/*try {
			String str = "SELECT * FROM auction " + "JOIN product using (product_id) " +  
					"WHERE auction_id ='" + auctionID + "'";
			result = stmt.executeQuery(str);
			result.next();	
				
			String str1 = "SELECT * FROM auction JOIN product using (item_id)" + 
					"JOIN Bids using (auction_id)" +
					"JOIN PC using (item_id, model)" +
					"WHERE auction_id ='" + auctionID + "'" + 
					"ORDER BY amount DESC LIMIT 1;";
				result = stmt.executeQuery(str1);
				result.next();
				
				seller = result.getString("username");
				status = result.getString("status");
				
				/*out.print("Auction ID: " + result.getString("auction_id"));
				out.println("<br>");
				out.print("Seller: " + result.getString("username"));
				out.println("<br>");
				out.print("Category " + result.getString("category"));
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
				out.println("<br>");*/
				/*String tempwinner = result.getString("winner");
				if (result.wasNull())
					tempwinner = " ";
				out.print("Winner: " + tempwinner); 
				out.println("<br>");
				out.print("Max Bid: $" + result.getString("current_bid"));
				out.println("<br>");
				session.setAttribute( "auction_id", result.getString("auction_id") );
			
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
	*/
	int auctionID = Integer.parseInt(request.getParameter("auction_id"));
	/*String str = "SELECT * FROM auction JOIN product using (product_id) " +  
					"WHERE auction_id = ?";

	ps = con.prepareStatement(str);
	ps.setInt(1, auctionID);*/

	//result = ps.executeQuery(str);
	//result.next();	
	//status = result.getString("status");
	session.setAttribute( "auction_id", auctionID);
		
			out.print("<form method='post' action='checkBid.jsp'>");
			
			out.print("<table>");
			
			out.print("<tr>");    
			out.print("<td>The entries are required if '**' is present</td>");
			out.print("</tr>");
			
			out.print("<tr>");    
			out.print("<td>**Bid Amount: </td><td><input type='text' name='bid_amount' required></td>");
			out.print("</tr>");
			
			out.print("<tr>");    
			out.print("<td>**Auto Bid? (Enter 'yes' or anything else for no): </td><td><input type='text' name='autobid_bool' required></td>");
			out.print("</tr>");
			
			out.print("<tr>");    
			out.print("<td>Auto Bid Amount (if yes above): </td><td><input type='text' name='autobid_amount'></td>");
			out.print("</tr>");
			
			out.print("<tr>");    
			out.print("<td>Max Bid: </td><td><input type='text' name='max_bid'></td>");
			out.print("</tr>");
			
			out.print("</table>");
			
			out.print("<input type='submit' value='Submit Bid!'>");
			out.print("</form>");
		
		/*out.print("<form method='post' action='viewBidHistory.jsp'>");
		out.print("<input type='submit' value='View Bid History'>");*/
		//out.print("</form>");
	/*	
		out.print("<form method='post' action='../search/userParticipation.jsp'>");
		out.print("<input type='submit' value='search user'>");
		out.print("</form>");
	*/	
	

	//out.print("<form action='similarItems.jsp' method='get'><button name='auct' type='submit' value='" + session.getAttribute("AUCTION") + "'>View Similar Items From Last Month</button></form>");
	
	%>
</body>
</html>