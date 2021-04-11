<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid on Item</title>
</head>
<body>
	<%
	int auctionID = Integer.parseInt(request.getParameter("auction_id"));
	/*String str = "SELECT * FROM auction JOIN product using (product_id) " +  
			"WHERE auction_id = ?";

	ps = con.prepareStatement(str);
	ps.setInt(1, auctionID);*/

	//result = ps.executeQuery(str);
	//result.next();	
	//status = result.getString("status");
	session.setAttribute("auction_id", auctionID);

	out.print("<form method='post' action='checkBid.jsp'>");

	out.print("<table>");

	out.print("<tr>");
	out.print("<td>The entries are required if '**' is present</td>");
	out.print("</tr>");

	out.print("<tr>");
	out.print("<td>**Bid Amount: </td><td><input type='text' name='bid_amount' required></td>");
	out.print("</tr>");

	out.print("<tr>");
	out.print(
			"<td>**Auto Bid? (Enter 'yes' or anything else for no): </td><td><input type='text' name='autobid_bool' required></td>");
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

	/* out.print("<form method='post' action='../search/userParticipation.jsp'>");
	out.print("<input type='submit' value='search user'>");
	out.print("</form>");	 */
	%>
</body>
</html>