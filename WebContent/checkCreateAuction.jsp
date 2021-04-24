<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page
	import="javax.servlet.http.*,javax.servlet.*, java.text.SimpleDateFormat"%>

<%
PreparedStatement ps = null;
ResultSet rs = null;
Connection conn = null;

try {

	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();

	int product_id = Integer.parseInt(request.getParameter("product_id"));
	String seller = (session.getAttribute("user")).toString();
	float minPrice = Float.parseFloat(request.getParameter("min_price"));
	float price = Float.parseFloat(request.getParameter("starting_price"));
	float new_bid_increment = Float.parseFloat(request.getParameter("new_bid_increment"));

	String endDate = request.getParameter("end_datetime");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	java.util.Date date = sdf.parse(endDate);
	java.sql.Timestamp endTimestamp = new java.sql.Timestamp(date.getTime());

	String insert = "INSERT INTO auction (product_id, seller, new_bid_increment, min_price, price, status, start_date, end_date, winner, current_bid)"
	+ "VALUES(?, ?, ?, ?, ?, ?, now(), ?, ?, ?)";
	ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
	ps.setInt(1, product_id);
	ps.setString(2, seller);
	ps.setFloat(3, new_bid_increment);
	ps.setFloat(4, minPrice);
	ps.setFloat(5, price);
	ps.setString(6, "open");
	ps.setTimestamp(7, endTimestamp);
	ps.setString(8, null);
	ps.setFloat(9, 0);

	int result = 0;
	result = ps.executeUpdate();
	rs = ps.getGeneratedKeys();
	rs.next();
	int auction_id = rs.getInt(1);
	
	
	String query = "select * from alerts where product_id = ?";
	PreparedStatement ps2 = conn.prepareStatement(query);
	ps2.setInt(1, product_id);
	ResultSet result2 = ps2.executeQuery();
	
	while(result2.next()){
		if(result2.getString("alert_message").equals("Alert set for this item") && !result2.getString("username").equals(seller))
		{
			String str = "INSERT INTO alerts(username, alert_message, product_id, auction_id)" + "VALUES(?, ?, ?, ?)";
			ps = conn.prepareStatement(str);
			ps.setString(1, result2.getString("username"));
			ps.setString(2, "The item " +result2.getString("product_id")+ ", is available in auction with id: "+auction_id+". Go bid to own it!");
			ps.setInt(3, result2.getInt("product_id"));
			ps.setInt(4, auction_id);

			ps.executeUpdate();
		}
		
	}

response.sendRedirect("sortAuctions.jsp");



	
	

} catch (Exception e) {
	response.sendRedirect("createAuctionError.jsp");
	e.printStackTrace();
} finally {
	try {
		ps.close();
	} catch (Exception e) {
	}
	try {
		conn.close();
	} catch (Exception e) {
	}
}
%>
