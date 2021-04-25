<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid History</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='sortAuctions.jsp';">Return to Auctions Page</button>

<h2> View Bid History</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	PreparedStatement ps = null;
	try {
		int auction_id = Integer.parseInt(request.getParameter("auction_id"));
		String viewBid = "SELECT * FROM bid WHERE auction_id = ? ORDER BY amount desc";
		ps = con.prepareStatement(viewBid);
		ps.setInt(1, auction_id);
		result = ps.executeQuery();
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID ");
		out.print("</th>");
		out.print("<th>");
		out.print("Buyer");
		out.print("</th>");
		out.print("<th>");
		out.print("Amount");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_id"));
			out.print("</td>");
			
			if(result.getString("buyer")==null)
			{
				out.print("<td>");
				out.print("deleted user");
				out.print("</td>");
			}
			else{
			out.print("<td>");
			out.print(result.getString("buyer"));
			out.print("</td>");
			}

			out.print("<td>");
			out.print("$" + result.getFloat("amount"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");

	} catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (ps != null)
			ps.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>


</body>
</html>
