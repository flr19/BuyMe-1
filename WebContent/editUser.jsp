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
	String user=request.getParameter("username");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
%>
	<form method="POST" action="editUserHandler.jsp">
    	Full Name: <input type="text" name="name" value=<%=name%>> <br/>
      	Email: <input type="text" name="email" value=<%=email%>> <br/>
      	Password: <input type="text" name="password" value=<%=password%>> <br/>
      	<input type="hidden" name="oldName" value=<%=name%>>
      	<input type="hidden" name="oldEmail" value=<%=email%>>
      	<input type="hidden" name="username" value=<%=user%>>
      	<input type="submit" value="Save Changes">
	</form>

</body>
</html>