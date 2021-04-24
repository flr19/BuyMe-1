<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.sql.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account Check Details</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String str = "create temporary table t2 (SELECT * FROM auction WHERE end_date < now() and status = 'open')";
		PreparedStatement ps = null;
		ps = con.prepareStatement(str);
		ps.executeUpdate();

		str = "UPDATE auction SET status = 'close' WHERE auction_id in (SELECT auction_id FROM t2)";
		ps = null;
		ps = con.prepareStatement(str);
		ps.executeUpdate();

		str = "UPDATE auction SET winner = 'No Winner' WHERE current_bid < min_price and auction_id in (SELECT auction_id FROM t2)";
		ps = null;
		ps = con.prepareStatement(str);
		ps.executeUpdate();

		
		str = "SELECT * FROM t2 where current_bid>min_price";
		ps = con.prepareStatement(str);
		ResultSet result = ps.executeQuery();
		
		while(result.next()){
			
		str = "INSERT INTO alerts(username, alert_message, product_id, auction_id)" + "VALUES(?, ?, ?, ?)";
		ps = con.prepareStatement(str);
		ps.setString(1, result.getString("winner"));
		ps.setString(2, "Dear " +result.getString("winner")+ ", you have won the auction! Please keep the payment of amount $" + result.getString("current_bid")+ " ready :)");
		ps.setInt(3, result.getInt("product_id"));
		ps.setInt(4, result.getInt("auction_id"));

		ps.executeUpdate();
		
		}
		

		str = "drop temporary table t2";

		ps = null;
		ps = con.prepareStatement(str);
		ps.executeUpdate();
	} catch (Exception se) {
		se.printStackTrace();
	}
	%>
</body>
</html>