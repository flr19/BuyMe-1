<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Similar Items</title>
</head>
<body>
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
    Statement stmt = con.createStatement();
    String str = " ";
    ResultSet result = null;
    result = stmt.executeQuery(str);

</body>
</html>