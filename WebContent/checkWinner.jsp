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
		
	//Create a SQL statement
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
    LocalDateTime now = LocalDateTime.now();  
    //java.sql.Date date=new java.sql.Date(now);  
    
	String str = "UPDATE auction a SET a.status = 'close', WHERE a.auction_id in (SELECT a.auction_id FROM auction a WHERE a.end_date > GETDATE())";
	ResultSet result = null;
	PreparedStatement ps = null;
	ps = con.prepareStatement(str);
	//ps.setInt(1, auction_id);
	result = ps.executeQuery();
	result.next();
	
	
	
	
	
	
}
catch (Exception se) {
		se.printStackTrace();
		}

%>
</body>
</html>