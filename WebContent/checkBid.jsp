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
PreparedStatement ps4 = null;

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
		throw new Exception("You can't bid lower than the initial price or the previous highest bid! Your bid amount is:"+newBid+" , whereas the current winning bid is:"+current_bid+" , and the seller minimum is:"+initialPrice);
	}
	
	
	
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
	
	System.out.println("Check 0");
	
	if(current_bid!=0){
		
	
		String str3 = "SELECT * FROM auction a, bid b WHERE b.auction_id=a.auction_id and a.auction_id=? and b.amount=?"; 
		
		ps4 = con.prepareStatement(str3);
		ps4.setFloat(1, auction_id);
		ps4.setFloat(2, current_bid);
		result2 = ps4.executeQuery();
		result2.next();
		
		String previous_user = result2.getString("buyer");
		int previous_bid_id = result2.getInt("bid_id");
		
		
		str3 = "SELECT b.bid_id FROM bid b, auction a WHERE b.amount=? and a.auction_id=?"; 
		
		ps4 = con.prepareStatement(str3);
		ps4.setFloat(1, newBid);
		ps4.setFloat(2, auction_id);
		result2 = ps4.executeQuery();
		result2.next();
		
		
		int current_bid_id = result2.getInt("bid_id");
		
		boolean previous_auto_bid;
		float previous_auto_increment;
		float previous_auto_max;
		String temp;
		int temp2;
		
		if(previous_bid_id!=0){
			System.out.println("Check 1");
			if(!(previous_user.equals(newUser))){
				System.out.println("Check 2");
				while(true){
					System.out.println("Check 3");
					str3 = "SELECT * FROM bid b WHERE b.bid_id = ?"; 	
					ps4 = con.prepareStatement(str3);
					ps4.setFloat(1, previous_bid_id);
					result2 = ps4.executeQuery();
					result2.next();
					
					previous_auto_bid = result2.getBoolean("is_autobid");
					previous_auto_increment = result2.getFloat("bid_increment");
					previous_auto_max = result2.getFloat("upper_limit");
					
					if(previous_auto_bid && newBid+previous_auto_increment<=previous_auto_max){
						System.out.println("Check 4");
						str3 = "INSERT INTO bid(buyer, upper_limit, is_autobid, bid_increment, amount, auction_id)"
								+ "VALUES (?, ?, ?, ?, ?, ?)";
						ps3 = con.prepareStatement(str3);
						ps3.setString(1, previous_user);
						ps3.setFloat(2, previous_auto_max);
						ps3.setBoolean(3, previous_auto_bid);
						ps3.setFloat(4, previous_auto_increment);
						ps3.setFloat(5, newBid+previous_auto_increment);
						ps3.setInt(6, auction_id);
						
						ps3.executeUpdate();
						
						if(!auto_bool){
							break;
						}
						temp = newUser;
						//This project is so complicated :(
						newUser = previous_user;
						previous_user = temp;
						
						temp2 = previous_bid_id;
						previous_bid_id = current_bid_id;
						current_bid_id = temp2;
						
						auto_bool = true;
						
						newBid = newBid+previous_auto_increment;
						
						System.out.println("Check 5");
					}
					else{
						break;
					}
				}
				
			}
		}
	}
	
	
	str = "SELECT max(b.amount) FROM auction a, bid b WHERE b.auction_id=? AND b.auction_id=a.auction_id"; //get the max bid for our current auction
	ps = con.prepareStatement(str);
	ps.setInt(1, auction_id);
	//ps.setString(2, newAuction);
	result = ps.executeQuery();
	result.next();
	current_bid = result.getFloat("max(b.amount)");
	
	str = "SELECT b.buyer FROM auction a, bid b WHERE b.auction_id=? AND b.auction_id=a.auction_id and b.amount=?"; //get the max bid for our current auction
	ps = con.prepareStatement(str);
	ps.setInt(1, auction_id);
	ps.setFloat(2, current_bid);
	//ps.setString(2, newAuction);
	result = ps.executeQuery();
	result.next();
	String name = result.getString("buyer");
	
	str = "UPDATE auction a SET a.current_bid=? , a.winner=? where a.auction_id=?";
	ps = con.prepareStatement(str);
	ps.setInt(3, auction_id);
	ps.setString(2, name);
	ps.setFloat(1, current_bid);
	//ps.setString(2, newAuction);
	ps.executeUpdate();
	result.next();
	
	
	
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