<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, java.text.SimpleDateFormat"%>

<%
	PreparedStatement ps = null;
	ResultSet rs = null;
	Connection conn = null;
	
	try {
		
		ApplicationDB db = new ApplicationDB();	
		conn = db.getConnection();
		
		// Get the parameters from the createAuction request
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String seller = (session.getAttribute("user")).toString();
		float minPrice = Float.parseFloat(request.getParameter("min_price"));
		float price = Float.parseFloat(request.getParameter("price"));
		/* String startDate = request.getParameter("start_datetime"); */
		String endDate = request.getParameter("end_datetime");
		
		System.out.println(endDate);
	/* 	out.println(endDate); */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//give format in which you are receiving the `String date_updated`
	    java.util.Date date = sdf.parse(endDate);
	    java.sql.Date sqlDate_updated = new java.sql.Date(date.getTime());	    
	    
	/*     Calendar calendar = Calendar.getInstance();
	    
	    java.util.Date currentTime = calendar.getTime();
	    
	    long time = currentTime.getTime(); */

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
		String insert = "INSERT INTO auction(product_id, seller, min_price, price, status, end_date, winner, current_bid)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		/* 	String insert = "INSERT INTO auction (product_id, seller, min_price, price, status)"
					+ "VALUES(?, ?, ?, ?, ?)";*/ 
			ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, product_id);
			ps.setString(2, seller);
			ps.setFloat(3, minPrice);
			ps.setFloat(4, price);			
			ps.setString(5,"open");
		/* 	ps.setTimestamp(6,new Timestamp(time)); */
			ps.setDate(6, sqlDate_updated);
			ps.setString(7,null);
			ps.setFloat(8,0);

		 	int result = 0;
	        ps.executeUpdate();
	        
	       /* if (result < 1) {
	        	out.println("Error: Auction creation failed.");
	        } else {
	        	rs = ps.getGeneratedKeys();
	        	rs.next();
	        	int auction_id = rs.getInt(1);
	        	response.sendRedirect("sortAuctions.jsp?auction_id=" + auction_id); //success 
	        	return;
	        } 
			*/
		
	} catch(Exception e) {
        response.sendRedirect("createAuctionError.jsp");  // MySql error such as Start Date before End Date
       e.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>