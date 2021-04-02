<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
    	<%@ include file="navbar.jsp" %>
    	<div class="content">
    		<h1>Hello, <%=session.getAttribute("first_name")%></h1>
    		<%
	    	// String url = "jdbc:mysql://buyme.cas20dm0rabg.us-east-1.rds.amazonaws.com:3306/buyMe";
	    		Connection conn = null;
	    		PreparedStatement ps = null;
	    		PreparedStatement accountPs = null;
	    		PreparedStatement alertPs = null;
	    		ResultSet rs = null;
	    		ResultSet accountRs = null;
	    		ResultSet alertRs = null;
	    		
	    		try {
				/* 	Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(url, "cs336admin", "cs336password"); */
				
	    		
		    		Locale locale = new Locale("en", "US");
					NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
					String user = (session.getAttribute("user")).toString();
					
					String alertQuery = "SELECT * FROM Alerts WHERE user=? AND seen=false";
		    		String auctionQuery = "SELECT * FROM Product WHERE seller=?";
		    		String accountQuery = "SELECT * FROM Account WHERE username=?";
		    		
		    		alertPs = conn.prepareStatement(alertQuery);
		    		alertPs.setString(1, user);
		    		alertRs = alertPs.executeQuery();
		    		if (alertRs.next()) { %>
		    			<h2>Unread Alerts</h2>
		    			<table>
		    				<tr>
		    					<th>Message</th>
		    				</tr>
		    		<%	do { %>
		    				<tr>
		    					<td>
		    						<%= alertRs.getString("message") %>
		    						<a href="markAsRead.jsp?messageId=<%= alertRs.getInt("messageId") %>">
		    							<input type="submit" value="Mark as read">
		    						</a>
		    					</td>
		    				</tr>
		    		<%	} while (alertRs.next()); %>
		    			</table>
		    	<%	}   		
		    		
		    		accountPs = conn.prepareStatement(accountQuery);
		    		accountPs.setString(1, user);
		    		accountRs = accountPs.executeQuery();
		    		accountRs.next();
		    		// Display admin commands if access level is 3
		    		if (accountRs.getInt("access_level") == 3) { %>
		    			<jsp:include page="adminDashboard.jsp"/>
		 	    			
		    	<%	} 
		    		if (accountRs.getInt("access_level") == 2) { %>
		    			<jsp:include page="customerRepDashboard.jsp"/>
		    	<%  }
		    		
		    		ps = conn.prepareStatement(auctionQuery);
		    		ps.setString(1, user);
		    		rs = ps.executeQuery();
		    		
		   			
		   			if (rs.next() && accountRs.getInt("access_level") == 1) { 
		   		%>
		    			<h2>Your created auctions:</h2>
		    			<table>
		    				<tr>
		    					<th>Item</th>
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
								<td><%= currency.format(rs.getDouble("price")) %></td>
								<td><%= rs.getString("endDate") %></td>
							</tr> 			
		   			<%	} while (rs.next()); %>
		   				</table>
		   		<%	} else if (accountRs.getInt("access_level") == 1){ %>
		   				<h2>You currently have no items for auction.</h2>
		   		<%	}
    		} catch (SQLException e) {
				out.print("<p>Error connecting to MYSQL server.</p>");
			    e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) {} 
				try { accountRs.close(); } catch (Exception e) {} 
				try { accountPs.close(); } catch (Exception e) {} 
				try { ps.close(); } catch (Exception e) {} 
				try { conn.close(); } catch (Exception e) {}			
			}	
			%>
    	</div>
    <% } %>
</body>
</html> --%>