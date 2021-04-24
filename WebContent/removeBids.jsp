<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Bids</title>
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
		String delete = "DELETE FROM bid WHERE bid_id =" + request.getParameter("bid_id");
        stmt.executeUpdate(delete);
		response.sendRedirect("manageAuctionsCustomerRep.jsp");		
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
