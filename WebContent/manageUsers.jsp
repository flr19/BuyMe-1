<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
</head>
<body>
	<a href="customerRepHomepage.jsp">Return to dashboard.</a>
	<h3>Manage Customer Accounts</h3>
	<form>
      <input type="text" name="search" placeholder="Username">
      <button type="submit">Search</button>
    </form>
    <table>
    	<tr>
    		<th>Username</th>
    		<th>Name</th>
    		<th>Email</th>
    	</tr>
<% 	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsystem", "root", "aDriTa@123");
    	Statement st = con.createStatement();
    	ResultSet rs;
    	String name = request.getParameter("search");
    	//if (name != null && name.length() > 0) {
    	    rs = st.executeQuery("SELECT * FROM users WHERE username LIKE'%"+name+"%'");
    	//} else {
    	    //rs = st.executeQuery("SELECT * FROM users WHERE username NOT IN (SELECT username FROM admin) AND username NOT IN(SELECT username FROM customerrep)");
    	//} 
    	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td>
			<form action="editUser.jsp" method="POST">
      			<input type="submit" value="Edit">
      			<input type="hidden" value=<%=rs.getString("username")%> name="username">
      			<input type="hidden" value=<%=rs.getString("name")%> name="name">
       			<input type="hidden" value=<%=rs.getString("email")%> name="email">
   			</form>
   			</td>
   			<td>
  			<form method="POST">
   				<input type="submit" value="Delete" onclick="if(confirm('Are you sure? This action cannot be undone.')){form.action='deleteUser.jsp'}">
  				<input type="hidden" name="usn" value=<%=rs.getString("username")%>> 
  			</form>
   			</td>
			
		</tr>     
<%    
		}
	}
	catch(SQLException se){
		se.printStackTrace();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>
</body>
</html>