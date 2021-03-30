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
   
<% 	try{
	//Get the database connection
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsystem", "root", "aDriTa@123");
		

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
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(rs.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(rs.getString("name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(rs.getString("email"));
				out.print("</td>");
				out.print("</tr>");

			}
		
			out.print("</table>");
		
			   
//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>