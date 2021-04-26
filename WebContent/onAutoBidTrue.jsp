<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check AutoBid True</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
<button onclick="window.location.href='sortAuctions.jsp';">Return to Auctions Page</button>
<div class="content">
		<form action="checkBid.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="autobid_bool" value = <%=session.getAttribute("autobid_bool")%>>
	</td>
	</tr> 
	<tr>    
	<td>Bid Increment: </td><td><input type="number" name="autobid_amount" placeholder = "0" required></td>
	</tr> 
	<tr>    
	<td>Max Bid Amount: </td><td><input type="number" name="max_bid" placeholder = "0" required></td>
	</tr>		
	</table>
	<input type="submit" value="Submit Bid!">
	</form>
	</div>
	
</body>
</html>