<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Questions</title>
</head>
<body>
	<a href="askQuestion.jsp">Return to questions dashboard.</a>
	<h3>Search Questions</h3>
	<form>
      <input type="text" name="search" placeholder="question">
      <button type="submit">Search</button>
    </form>
   
<% 	try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
		
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the selected radio button from the index.jsp
	String entity = request.getParameter("search");
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
	String str = "SELECT * FROM questions WHERE question LIKE'%"+entity+"%'";
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
			out.print("Question");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Answer");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (rs.next()) {
				//make a row
				/* out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(rs.getString("question"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(rs.getString("name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(rs.getString("email"));
				out.print("</td>");
				out.print("</tr>"); */
				
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