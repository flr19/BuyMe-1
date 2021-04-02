<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
	
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body> 	
 	
 	<% if (session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
    <%-- 	<%@ include file="navbar.jsp" %> --%>
    	<div class="content">
    	<%
/* 	    	String url = "jdbc:mysql://buyme.cas20dm0rabg.us-east-1.rds.amazonaws.com:3306/buyMe";
 */			Connection conn = null;
			Statement s = null;
    		ResultSet rs = null;
    		 ApplicationDB db = new ApplicationDB();	
    			Connection con = db.getConnection(); 	
    		try {
    		/* 	Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(url, "cs336admin", "cs336password"); */
				Locale locale = new Locale("en", "US");
				NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
				String allAuctionsQuery = "SELECT * FROM product WHERE sold=false";
				s = conn.createStatement();
				rs = s.executeQuery(allAuctionsQuery);
				if (rs.next()) { %>
					<h2>All Live Auctions</h2>
					<table>
						<tr>
							<th>Item</th>
							<th>Seller</th>
							<th>Current Bid</th>
							<th>End Date/Time</th>
						</tr>
						<%	do { %>
						<tr>
							<td>
								<a href="auction.jsp?productId=<%= rs.getInt("productId") %>">
									<%= rs.getString("brand") + " " + rs.getString("model") + " " + rs.getString("gender") +  " " + rs.getFloat("size") %>
								</a>
							</td>
							<td><%= rs.getString("seller") %></td>
							<td><%= currency.format(rs.getDouble("price")) %></td>
							<td><%= rs.getString("endDate") %></td>
						</tr>
				 <%		} while (rs.next()); %> 
					</table>
				<%	} else { %>
						<br><h3>There are currently no live auctions.</h3>
				<%	} %>		
			<%	
			
				
				
    		} catch (SQLException e){
    			out.print("<p>Error connecting to MYSQL server.</p>");
			    e.printStackTrace();    			
    		} finally {
				try { rs.close(); } catch (Exception e) {} 
				try { s.close(); } catch (Exception e) {} 
				try { conn.close(); } catch (Exception e) {} 
    		}   	
    	%>
    	</div>
    <% } %>
</body>
</html>