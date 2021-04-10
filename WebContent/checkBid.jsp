<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid</title>
</head>
<body>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
//Create a SQL statement
Statement stmt = con.createStatement();
ResultSet result = null;
ResultSet result2 = null;
PreparedStatement ps = null;
PreparedStatement ps2 = null;
PreparedStatement ps3 = null;
try 
{
	//Get the combobox from the index.jsp
	float newBid = Float.parseFloat(request.getParameter("bid_amount"));
	boolean auto_bool = ("yes").equals(request.getParameter("autobid_bool").toString())? true : false;
	float auto_increment = -1;
	float max_bid = -1;
	if(auto_bool){
		auto_increment = Float.parseFloat(request.getParameter("autobid_amount"));
		max_bid = Float.parseFloat(request.getParameter("max_bid"));
	}	
	int  auction_id = Integer.parseInt(session.getAttribute("auction_id").toString());
	String newUser = (String)session.getAttribute("user"); //user or username?
	
	
	
	String str = "SELECT max(b.amount) FROM auction a, bid b WHERE b.auction_id=? AND b.auction_id=a.auction_id"; //get the max bid for our current auction
	ps = con.prepareStatement(str);
	ps.setInt(1, auction_id);
	//ps.setString(2, newAuction);
	result = ps.executeQuery();
	result.next();
	
	String str2 = "SELECT min_price FROM auction WHERE auction_id=?";
	ps2 = con.prepareStatement(str2);
	ps2.setInt(1, auction_id);
	result2 = ps2.executeQuery();
	result2.next();
	
	float initialPrice = result2.getFloat("min_price");
	float current_bid = result.getFloat("max(b.amount)");
	if((newBid <= current_bid) || newBid < initialPrice)
	{
		throw new Exception("You can't bid lower than the initial price or the previous highest bid!"+newBid+current_bid+initialPrice);
	}
	
	//SEND THE ALERT FOR HIGHEST BIDDER, BY GETTING BIDDERNAME FROM BID TABLE, WHOSE BID FOR THIS AUCTION IS EQUAL TO CURRENT_BID
	
	/*String loserUser = result.getString("buyer");
	if(loserUser != null)
	{
		String message = "You have been outbid on Auction #" + auction_id + "!";
		String insert2 = "INSERT INTO alert(username) VALUES(?)";
		ps = con.prepareStatement(insert2);
		ps.setString(1, loserUser);
		ps.executeUpdate();
	}*/
 
	
	//Make an insert statement for the Users table:
	String insert = "INSERT INTO bid(buyer, upper_limit, is_autobid, bid_increment, amount, auction_id)"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
	//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	ps3 = con.prepareStatement(insert);
	
	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	ps3.setString(1, newUser);
	ps3.setFloat(2, max_bid);
	ps3.setBoolean(3, auto_bool);
	ps3.setFloat(4, auto_increment);
	ps3.setFloat(5, newBid);
	ps3.setInt(6, auction_id);

	//Run the query against the DB
	ps3.executeUpdate();
	response.sendRedirect("showAllWatch.jsp");
	}
catch (Exception e) 
{
		out.print(e);
}
finally {
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}

%>


</body>
</html>