<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	/* String url = "jdbc:mysql://buyme.cas20dm0rabg.us-east-1.rds.amazonaws.com:3306/buyMe"; */
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		
		/* Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336admin", "cs336password");  */
		
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		// Get the parameters from the createAuction request
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String gender = request.getParameter("gender");
		float size = Float.parseFloat(request.getParameter("size"));		
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String seller = (session.getAttribute("user")).toString();
		float minPrice = Float.parseFloat(request.getParameter("min_price"));
		float startingPrice = Float.parseFloat(request.getParameter("starting_price"));
		String startDate = request.getParameter("start_datetime");
		String endDate = request.getParameter("end_datetime");
		
		// Make sure all the fields are entered
		if(category != null  && !category.isEmpty()
				&& brand != null && !brand.isEmpty() 
				&& gender != null && !gender.isEmpty()
				&& size != 0.0f
				&& model != null && !model.isEmpty()
				&& color != null && !color.isEmpty()
				&& startDate != null && !startDate.isEmpty()
				&& endDate != null && !endDate.isEmpty()
				&& minPrice >= 0.0f
				&& startingPrice >= 0.0f) {
			
		// Build the SQL query with placeholders for parameters
			String insert = "INSERT INTO Product (category, brand, model, size, color, seller, min_price, price, sold, startDate, endDate)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
		
			// Add parameters to query
			//ps.setString(1, name);
			ps.setString(1, category);
			ps.setString(2, brand);
			ps.setString(3, model);
			//ps.setString(4, gender);
			ps.setFloat(5, size);
			ps.setString(6, color);
			ps.setString(7, seller);
			ps.setFloat(8, minPrice);
			ps.setFloat(9, startingPrice);			
			ps.setBoolean(10, false);
			ps.setString(11, startDate);
			ps.setString(12, endDate);
			
			int result = 0;
	        result = ps.executeUpdate();
	        if (result < 1) {
	        	out.println("Error: Auction creation failed.");
	        } else {
	        	rs = ps.getGeneratedKeys();
	        	rs.next();
	        	int productId = rs.getInt(1);
	        	response.sendRedirect("auction.jsp?productId=" + productId); //success
	        	return;
	        }
		} else {
			response.sendRedirect("createAuctionError.jsp"); //error
			return;
		}
	} catch(Exception e) {
        response.sendRedirect("createAuctionError.jsp"); // MySql error such as Start Date before End Date
        e.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>