<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe - Your Selling History</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
    <% if(session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
    	<%@ include file="navbar.jsp" %>
    	<div class="content">
   		<% 
   			String url = "jdbc:mysql://buyme.cas20dm0rabg.us-east-1.rds.amazonaws.com:3306/buyMe";
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			
   			try {   		
   				Class.forName("com.mysql.jdbc.Driver").newInstance();
   				conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
   				
   				String user = (session.getAttribute("user")).toString(); 				
   				// Create formatter for US currency
   				Locale locale = new Locale("en", "US");
   				NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
   				
   				//String bidQuery = "SELECT * FROM BidHistory WHERE buyer=? ORDER BY date DESC"; 
   				String sellQuery = "SELECT * FROM SellingHistory WHERE seller=?";
   				ps = conn.prepareStatement(sellQuery);
   				ps.setString(1, user);
   				rs1 = ps.executeQuery();
   				
   				if (rs1.next()) { %>
   					<h2>Your Selling History</h2>
   					<table>
   						<tr>
   							<th>Item Name</th>
   							<th>Price</th>
   							<th>Buyer</th>
   							<th>Date</th>
   							<!--<th>Date</th>-->
   						</tr>
   				<%	do { 
   						int productId = rs1.getInt("productId");
   						String itemName = null;
   						String productQuery = "SELECT brand, model, gender, size FROM Product WHERE productId=?";
   						ps = conn.prepareStatement(productQuery);
   						ps.setInt(1, productId);
   						rs2 = ps.executeQuery();
   						if (rs2.next()) {
   							itemName = rs2.getString("brand") + " " + rs2.getString("model") + " " + rs2.getString("gender") +  " " + rs2.getFloat("size");
   						} else {
   							itemName = "productId not found";
   						}
   						ps.close();
   						
   						String buyQuery = "SELECT buyer FROM BuyingHistory WHERE productId=?";
   						ps = conn.prepareStatement(buyQuery);
   						ps.setInt(1, productId);
   						rs3 = ps.executeQuery();
   						rs3.next();
   				%>
   						<tr>
   							<td><%= itemName %></td>
   							<td><%= currency.format(rs1.getDouble("price")) %></td>
   							<td><%= rs3.getString("buyer") %></td>
   							<td><%= rs1.getString("date") %></td>
   						</tr>
   				<%	} while (rs1.next()); %>
   					</table>		
   			<%	} else { %>
   					<h2>You have not sold any items.</h2>
   			<%	} 		
   			} catch (SQLException e) {
   				response.sendRedirect("error.jsp");
   				out.print("<h1>Error connecting to MYSQL server.</h1>");
		        e.printStackTrace();
   			} finally {
   				try { rs1.close(); } catch (Exception e) {}
   				try { rs2.close(); } catch (Exception e) {}
   				try { rs3.close(); } catch (Exception e) {}
   				try { ps.close(); } catch (Exception e) {}   				
   				try { conn.close(); } catch (Exception e) {}
   			} %>   		
		</div>
	<% } %>
</body>
</html>	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>