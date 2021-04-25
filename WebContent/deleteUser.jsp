<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Delete User</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<%
try {
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String user = request.getParameter("username");
	String str = "select * from bid join auction using (auction_id) where status = 'open' and buyer = ?";
	PreparedStatement ps = con.prepareStatement(str);
	ps.setString(1,user);
	ResultSet result = ps.executeQuery();
while(result.next())
	{
	int bid_id = result.getInt("bid_id");
	
	int auction_id = result.getInt("auction_id");
	
	String str1 = "delete from bid where bid_id = ? and auction_id = ?";
	PreparedStatement ps1 = con.prepareStatement(str1);
	ps1.setInt(1, bid_id);
	ps1.setInt(2, auction_id);
	ps1.executeUpdate();
	
	String str2 = "select max(amount) from bid where auction_id = ?";
	PreparedStatement ps3 = con.prepareStatement(str2);
	ps3.setInt(1,auction_id);
	ResultSet result2 = ps3.executeQuery();
	result2.next();
	float current_bid = result2.getFloat("max(amount)");

	str = "SELECT buyer from bid join auction using (auction_id) where amount = ? and auction_id = ?"; //get the max bid for our current auction
	ps = con.prepareStatement(str);
	ps.setFloat(1, current_bid);
	ps.setInt(2, auction_id);
	ResultSet result3 = ps.executeQuery();
	result3.next();
	String name = result3.getString("buyer");

	str = "UPDATE auction a SET a.current_bid=? , a.winner=? where a.auction_id = ?";
	ps = con.prepareStatement(str);
	ps.setString(2, name);
	ps.setFloat(1, current_bid);
	ps.setInt(3, auction_id);
	ps.executeUpdate();
	
	
	}
str = "select * from bid join auction using (auction_id) where status = 'close' and buyer = ?";
ps = con.prepareStatement(str);
ps.setString(1,user);
result = ps.executeQuery();
while(result.next())
{
	int bid_id = result.getInt("bid_id");
	int auction_id = result.getInt("auction_id");
	String str1 = "update bid set buyer =? where bid_id = ? and auction_id = ?";
	PreparedStatement ps1 = con.prepareStatement(str1);
	ps1.setString(1, null);
	ps1.setInt(2, bid_id);
	ps1.setInt(3, auction_id);
	ps1.executeUpdate();
	
}
int res = st.executeUpdate("DELETE FROM account WHERE username='" + user + "'");
if (res > 0) {
	out.println("User deleted.");
} else {
	out.println("Error deleting user.");
	out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
}

} catch (SQLException se) {
	out.println("Error.");
	out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
	se.printStackTrace();
} catch (Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>