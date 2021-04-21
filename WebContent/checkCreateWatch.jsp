<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
PreparedStatement ps = null;
ResultSet rs = null;
Connection conn = null;

try {

	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();
	String category = request.getParameter("category");
	String brand = request.getParameter("brand");
	String gender = request.getParameter("gender");
	String color = request.getParameter("color");
	String username = session.getAttribute("user").toString();
	String insert = "INSERT INTO product (category, brand, color, gender, seller)" + "VALUES(?, ?, ?, ?, ?)";
	ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);

	ps.setString(1, category);
	ps.setString(2, brand);
	ps.setString(3, color);
	ps.setString(4, gender);
	ps.setString(5, username);

	int result = 0;
	result = ps.executeUpdate();
	if (result < 1) {
		out.println("Error: Product creation failed.");
	} else {
		rs = ps.getGeneratedKeys();
		rs.next();
		int product_id = rs.getInt(1);
		response.sendRedirect("showAllWatch.jsp");
		return;
	}

} catch (Exception e) {
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