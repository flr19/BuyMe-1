<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AutoBid False</title>
</head>
<body>
   <form action="checkBid.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="autobid_bool" value = <%=session.getAttribute("autobid_bool")%>>
	</td>
	</tr> 
	<tr>    
	<td>Bid Amount: </td><td><input type="text" name="bid_amount" required></td>
	</tr> 	
	
	</table>
	<input type="submit" value="Submit Bid!">
	</form>
	

</body>
</html>