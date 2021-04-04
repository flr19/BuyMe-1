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
	String str = "SELECT question,answer FROM questions WHERE question LIKE'%"+entity+"%'";
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
				
				
				%>
				<tr>
					<td><%=rs.getString("question")%></td>
					<td><%=rs.getString("answer")%></td>
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