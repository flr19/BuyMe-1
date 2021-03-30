<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
</head>
<body>
	<h2>Edit User Details</h2>
<%
	String usn=request.getParameter("username");
	System.out.println(usn);
	String email=request.getParameter("email");
	String name=request.getParameter("name");
%>
	<form method="POST" action="editUserHandler.jsp">
    	Full Name: <input type="text" name="name" value=<%=name%>> <br/>
      	Email: <input type="text" name="email" value=<%=email%>> <br/>
      	<input type="hidden" name="oldName" value=<%=name%>>
      	<input type="hidden" name="oldEmail" value=<%=email%>>
      	<input type="hidden" name="username" value=<%=usn%>>
      	<input type="submit" value="Save Changes">
	</form>
	
	<form method="POST" action="resetPassword.jsp">
		<input type="submit" value="Reset Password">
		<input type="hidden" name="usn" value=<%=usn%>>
	</form>

</body>
</html>