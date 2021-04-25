<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
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
	try {
		//Get the combobox from the index.jsp
		//only get bid_amount when auto bid if false - bid amount is not required if autobid is true
		int auction_id = Integer.parseInt(session.getAttribute("auction_id").toString());

		String str = "SELECT max(b.amount) FROM auction a, bid b WHERE b.auction_id=? AND b.auction_id=a.auction_id"; //get the max bid for our current auction
		ps = con.prepareStatement(str);
		ps.setInt(1, auction_id);
		//ps.setString(2, newAuction);
		result = ps.executeQuery();
		result.next();

		String str2 = "SELECT price, new_bid_increment FROM auction WHERE auction_id=?";
		ps2 = con.prepareStatement(str2);
		ps2.setInt(1, auction_id);
		result2 = ps2.executeQuery();
		result2.next();

		float initialPrice = result2.getFloat("price");
		float current_bid = result.getFloat("max(b.amount)");
		float new_bid_increment = result2.getFloat("new_bid_increment");

		float newBid = -1;
		boolean auto_bool = ("yes").equals(session.getAttribute("autobid_bool").toString()) ? true : false;
		float auto_increment = -1;
		float max_bid = -1;
		if (auto_bool) {

			auto_increment = Float.parseFloat(request.getParameter("autobid_amount"));
			max_bid = Float.parseFloat(request.getParameter("max_bid"));
			if (new_bid_increment > auto_increment) {
		throw new Exception("Your bid increment is lesser than the seller minimum. You entered : "
				+ new_bid_increment + " , and your's is : " + auto_increment);
			}

			if (current_bid == 0) {
		newBid = initialPrice;
			} else {
		newBid = new_bid_increment + current_bid;
			}
		} else {
			newBid = Float.parseFloat(request.getParameter("bid_amount"));

			if (current_bid == 0) {

		if ((newBid - initialPrice) < new_bid_increment) {
			throw new Exception("Your bid " + newBid + " , is less than the seller's bid increment + price ");
		}
			} else {

		if ((newBid - current_bid) < new_bid_increment) {
			throw new Exception("Your bid " + newBid + " , is less than the seller's bid increment + current bid ");
		}
			}

		}

		String newUser = (String) session.getAttribute("user"); //user or username?

		if ((newBid <= current_bid) || newBid < initialPrice) {
			throw new Exception(
			"You can't bid lower than the initial price or the previous highest bid! Your bid amount is:" + newBid
					+ " , whereas the current winning bid is:" + current_bid + " , and the seller minimum is:"
					+ initialPrice);
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

		//System.out.println("Check 0");

		if (current_bid != 0) {

			String str3 = "SELECT * FROM auction a, bid b WHERE b.auction_id=a.auction_id and a.auction_id=? and b.amount=?";

			ps4 = con.prepareStatement(str3);
			ps4.setFloat(1, auction_id);
			ps4.setFloat(2, current_bid);
			result2 = ps4.executeQuery();
			result2.next();

			String previous_user = result2.getString("buyer");
			int previous_bid_id = result2.getInt("bid_id");
			String product_id = result2.getString("product_id");

			str3 = "SELECT b.bid_id FROM bid b, auction a WHERE b.amount=? and a.auction_id=?";

			ps4 = con.prepareStatement(str3);
			ps4.setFloat(1, newBid);
			ps4.setFloat(2, auction_id);
			result2 = ps4.executeQuery();
			result2.next();
			int i = 0;
			float tem = 0;
			int current_bid_id = result2.getInt("bid_id");

			boolean previous_auto_bid;
			float previous_auto_increment;
			float previous_auto_max;
			String temp;
			int temp2;

			if (previous_bid_id != 0) {
		//System.out.println("Check 1");
		if (!(previous_user.equals(newUser))) {
			//System.out.println("Check 2");
			while (true) {
				//System.out.println("Check 3");
				i++;
				str3 = "SELECT * FROM bid b WHERE b.bid_id = ?";
				ps4 = con.prepareStatement(str3);
				ps4.setFloat(1, previous_bid_id);
				result2 = ps4.executeQuery();
				result2.next();

				previous_auto_bid = result2.getBoolean("is_autobid");
				previous_auto_increment = result2.getFloat("bid_increment");
				previous_auto_max = result2.getFloat("upper_limit");

				if (previous_auto_bid) {
					//System.out.println("Check 4");
					if (newBid + previous_auto_increment > previous_auto_max) {
						if (previous_auto_max - newBid < new_bid_increment) {
							break;
						} else {
							tem = previous_auto_max;
						}
					} else {
						tem = newBid + previous_auto_increment;
					}
					str3 = "INSERT INTO bid(buyer, upper_limit, is_autobid, bid_increment, amount, auction_id)"
							+ "VALUES (?, ?, ?, ?, ?, ?)";
					ps3 = con.prepareStatement(str3, Statement.RETURN_GENERATED_KEYS);
					ps3.setString(1, previous_user);
					ps3.setFloat(2, previous_auto_max);
					ps3.setBoolean(3, previous_auto_bid);
					ps3.setFloat(4, previous_auto_increment);
					ps3.setFloat(5, tem);
					ps3.setInt(6, auction_id);
					ps3.executeUpdate();
					
					result = ps3.getGeneratedKeys();
					result.next();
					
					previous_bid_id = current_bid_id;

					current_bid_id = result.getInt(1);
					
					temp = newUser;
					//This project is so complicated :(
					newUser = previous_user;
					previous_user = temp;

					newBid = tem;

					if (!auto_bool) {
						break;
					}

					auto_bool = true;

					//System.out.println("Check 5");
				} else {
					break;
					///Set the alert for buyer who has higher bid has been placed
				}
			}

			//
			str3 = "INSERT INTO alerts(username, alert_message, product_id, auction_id)" + "VALUES(?, ?, ?, ?)";
			ps3 = con.prepareStatement(str3);
			ps3.setString(1, previous_user);
			ps3.setString(2, "You have been outbidded by " + newUser + ", who has currently bidded $" + newBid
					+ ". Bid now to get the item!");
			ps3.setString(3, product_id);
			ps3.setInt(4, auction_id);

			ps3.executeUpdate();
		}
			}
		}

		//or set alert here to the loser buyer

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

		response.sendRedirect("bidSuccess.jsp");

	} catch (Exception e) {
		out.print(e);
	} finally {
		if (ps != null)
			ps.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>


</body>
</html>