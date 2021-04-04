<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
		
	<% 
		PreparedStatement ps = null;
	Connection conn = null;
			
		try {
			ApplicationDB db = new ApplicationDB();	
			conn = db.getConnection();
			
			String username = (session.getAttribute("user")).toString();
			String question = request.getParameter("question");
			if(username != null && !username.isEmpty() && question != null && !question.isEmpty()){
				
				String insert = "INSERT INTO questions (user, question, answer)" + "VALUES (?, ?, ?)";
				
				ps = conn.prepareStatement(insert);
				
				ps.setString(1, username);
				ps.setString(2, question);
				ps.setString(3, "Awaiting answer from customer representative");
				
				int result = 0;
		        result = ps.executeUpdate();
		        if (result < 1) {
		        	out.println("Error: Question failed.");
		        } else {
		        	response.sendRedirect("askQuestionsHandler.jsp?submit=success");
		        	return;
		        }
			} else {
				response.sendRedirect("questionError.jsp");
				return;
			}    
		} catch(Exception e) {
	        out.print("<p>Error connecting to MYSQL server.</p>" + e);
	        e.printStackTrace();
	    } finally {
	        try { ps.close(); } catch (Exception e) {}
	        try { conn.close(); } catch (Exception e) {}
	    }
		        
		        
	%>