<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
String user=request.getParameter("user");
try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	PreparedStatement update = con.prepareStatement("UPDATE account SET password = 'password' WHERE username = ?");
	update.setString(1,user);
	int res=update.executeUpdate();
	if(res>=0){
		out.println("Password has been reset.");
	}
}
catch(SQLException se){
	se.printStackTrace();
}
catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Reset Password</title>
</head>
<body>
	<p></p>
</body>
</html>
