<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Auction</title>
</head>
<body>
<% 
//Create a connection string
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
ResultSet result = null;
PreparedStatement ps = null;
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
} */
try 
{
	String newAuction = request.getParameter("auct");
	String isClosed = "SELECT status FROM Auction WHERE auction_id = ? ";
	ps = con.prepareStatement(isClosed);
	ps.setString(1, newAuction);
	result = ps.executeQuery();
	result.next();
	if(result.getString("status").equals ("closed"))
	{
		out.print("You can't delete a closed auction!");
	}
	else
	{
	
	String delete = "DELETE FROM Autobids WHERE auction_id = ?;";
	ps = con.prepareStatement(delete);
	ps.setString(1, newAuction);
	ps.executeUpdate();
	
	delete = "DELETE FROM Alert_Messages WHERE auction_id = ?;";
	ps = con.prepareStatement(delete);
	ps.setString(1, newAuction);
	ps.executeUpdate();
	
	delete = "DELETE FROM Bids WHERE auction_id = ?;";
	ps = con.prepareStatement(delete);
	ps.setString(1, newAuction);
	ps.executeUpdate();
	
	delete = "DELETE FROM Auction WHERE auction_id = ?;";
	ps = con.prepareStatement(delete);
	ps.setString(1, newAuction);
	ps.executeUpdate();
	}
	
	
}
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}%>


</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Auctions</title>
</head>
<body>
	<% 	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	ResultSet result = null;
	try
	{
		String delete = "DELETE FROM auction WHERE auction_id ='" + request.getParameter("auction_id") + "'";
        stmt.executeUpdate(delete);
		response.sendRedirect("browseAuctionsCustomerRep.jsp");		
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
	}%>

</body>
</html>