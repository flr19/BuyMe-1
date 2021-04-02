<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
		
	<% 
		String url = "jdbc:mysql://buyme.cas20dm0rabg.us-east-1.rds.amazonaws.com:3306/buyMe";
		Connection conn = null;
		PreparedStatement ps = null;
			
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
			
			int questionId = Integer.parseInt(request.getParameter("questionId"));
			String answer = request.getParameter("Answer");
			if(answer != null && !answer.isEmpty()){
				
				String insert = "UPDATE Questions SET answer=? WHERE questionId=?";
				
				ps = conn.prepareStatement(insert);
				
				ps.setString(1, answer);
				ps.setInt(2, questionId);
				
				int result = 0;
		        result = ps.executeUpdate();
		        if (result < 1) {
		        	out.println("Error: Question failed.");
		        } else { %>
		        	<jsp:include page="questions.jsp" flush="true"/>
					<div class="content center">
						<h1>Question was successfully answered.</h1>
					</div>
		    <%  }
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