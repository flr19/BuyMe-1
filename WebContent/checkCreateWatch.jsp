<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	PreparedStatement ps = null;
	ResultSet rs = null;
	Connection conn = null;
	
	try {
		
		ApplicationDB db = new ApplicationDB();	
		conn = db.getConnection();
		// Get the parameters from the createAuction request
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");

/* 		String seller = (session.getAttribute("user")).toString();
		float minPrice = Float.parseFloat(request.getParameter("min_price"));
		float price = Float.parseFloat(request.getParameter("price"));
		String startDate = request.getParameter("start_datetime");
		String endDate = request.getParameter("end_datetime"); */
		
		// Make sure all the fields are entered
/* 		if(category != null  && !category.isEmpty()
				&& brand != null && !brand.isEmpty() 
				&& color != null && !color.isEmpty()
						&& gender != null && !gender.isEmpty()
				&& startDate != null && !startDate.isEmpty()
				&& endDate != null && !endDate.isEmpty()
				&& minPrice >= 0.0f
				&& startingPrice >= 0.0f) { */
			
		// Build the SQL query with placeholders for parameters
			String insert = "INSERT INTO product (category, brand, color, gender)"
					+ "VALUES(?, ?, ?, ?)";
			ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
		
			ps.setString(1, category);
			ps.setString(2, brand);
			ps.setString(3, color);
			ps.setString(4, gender);
			
			int result = 0;
	        result = ps.executeUpdate();
	        if (result < 1) {
	        	out.println("Error: Product creation failed.");
	        } else {
	        	rs = ps.getGeneratedKeys();
	        	rs.next();
	        	int product_id = rs.getInt(1);
	        	response.sendRedirect("showAllWatch.jsp"); //success
	        	return;
	        }
/* 	 } else {
			response.sendRedirect("createAuctionError.jsp"); //error
			return;  */
		
	} catch(Exception e) {
      /*   response.sendRedirect("createWatchError.jsp"); */ // MySql error such as Start Date before End Date
       e.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>