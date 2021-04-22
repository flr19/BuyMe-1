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

	out.print("<form method='post' action='checkAutoBid.jsp'>");

	out.print("<table>");

	out.print("<tr>");
	out.print("<td>The entries are required if '**' is present</td>");
	out.print("</tr>");

	out.print("<tr>");

	out.print("<td><label for='autobid_bool'>**Auto Bid?</label>");

	out.print("<select name='autobid_bool'>");
	out.print("<option value='yes'>yes</option>");
	out.print("<option value='no'>no</option>");

	out.print("</select>");
	
	out.print("</td>");

	out.print("</tr>");
	

	out.print("</table>");
	out.print("<input type='submit' value='Submit Bid!'>");
	out.print("</form>");
	%>
</body>
</html>