<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
   
<% 	try{
	//Get the database connection
	/* Class.forName("com.mysql.jdbc.Driver"); */
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
		
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the selected radio button from the index.jsp
	String entity = request.getParameter("search");
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
	String str = "SELECT * FROM account WHERE username LIKE'%"+entity+"%' AND username NOT IN (SELECT username FROM admin) AND username NOT IN(SELECT username FROM customerrep)";
	//Run the query against the database.
	ResultSet rs = stmt.executeQuery(str);
	%>
		<% //Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Email");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (rs.next()) {
				
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
		
			out.print("</table>");
		
			   
//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>