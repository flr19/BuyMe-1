<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.sql.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account Check Details</title>
</head>
<body>
<%	try{
	//Get the database connection
	/* Class.forName("com.mysql.jdbc.Driver"); */
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
		
    
	String str = "create temporary table t2 (SELECT auction_id FROM auction WHERE end_date < now())";
	
	
	PreparedStatement ps = null;
	ps = con.prepareStatement(str);
	//ps.setInt(1, auction_id);
	ps.executeUpdate();	
	
	str = "UPDATE auction SET status = 'close' WHERE auction_id in (SELECT auction_id FROM t2)";
	
	
	ps = null;
	ps = con.prepareStatement(str);
	//ps.setInt(1, auction_id);
	ps.executeUpdate();	

	str = "UPDATE auction SET winner = 'No Winner' WHERE current_bid < min_price and auction_id in (SELECT auction_id FROM t2)";
	
	ps = null;
	ps = con.prepareStatement(str);
	//ps.setInt(1, auction_id);
	ps.executeUpdate();	
	
	/*str = "INSERT INTO winner values(?, ?, ?) ";
	ps = con.prepareStatement(str);
	ps.setInt(1, auction_id);
	ps.setString(2,username );
	ps.setFloat(3,amount);*/
	
str = "drop temporary table t2";
	
	
	ps = null;
	ps = con.prepareStatement(str);
	//ps.setInt(1, auction_id);
	ps.executeUpdate();	
}
catch (Exception se) {
		se.printStackTrace();
		}

%>
</body>
</html>