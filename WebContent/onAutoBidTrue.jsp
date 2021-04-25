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
	<button onclick="window.location.href='bidOnItem.jsp';">Return to Bid Page to set AutoBid</button>

<div class="content">
		<form action="checkBid.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="autobid_bool" value = <%=session.getAttribute("autobid_bool")%>>
	</td>
	</tr> 
	<tr>    
	<td>Bid Increment: </td><td><input type="text" name="autobid_amount" required></td>
	</tr> 
	<tr>    
	<td>Max Bid Amount: </td><td><input type="text" name="max_bid" required></td>
	</tr>		
	</table>
	<input type="submit" value="Submit Bid!">
	</form>
	</div>
	
</body>
</html>