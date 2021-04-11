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
	Statement stmt = con.createStatement();
	ResultSet result = null;
	PreparedStatement ps = null;
	try
	{
		String newAuction = request.getParameter("auction_id");
	String isClosed = "SELECT status FROM auction WHERE auction_id = ? ";
	ps = con.prepareStatement(isClosed);
	ps.setString(1, newAuction);
	result = ps.executeQuery();
	result.next();
	if(result.getString("status").equals ("open"))
	{
		String delete = "DELETE FROM auction WHERE auction_id ='" + request.getParameter("auction_id") + "'";
        stmt.executeUpdate(delete);
		response.sendRedirect("manageAuctionsCustomerRep.jsp");
	}
	else
	{
		out.print("You can't delete a closed auction!");	
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
	}%>

</body>
</html>