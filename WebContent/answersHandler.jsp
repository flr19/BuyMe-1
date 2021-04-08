<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
PreparedStatement ps = null;
Connection conn =  null;
try {
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();

	int questionId = Integer.parseInt(request.getParameter("question_id"));
	String answer = request.getParameter("answer");
	if (answer != null && !answer.isEmpty()) {

		String insert = "UPDATE questions SET answer=? WHERE question_id=?";

		ps = conn.prepareStatement(insert);

		ps.setString(1, answer);
		ps.setInt(2, questionId);

		int result = 0;
		result = ps.executeUpdate();
		if (result < 1) {
	out.println("Error: Question failed.");
		} else {
%>

<jsp:include page="questions.jsp" flush="true" />
<div class="content center">
	<h1>Question was successfully answered.</h1>
</div>
<%
}
} else {
response.sendRedirect("questionError.jsp");
return;
}
} catch (Exception e) {
out.print("<p>Error connecting to MYSQL server.</p>" + e);
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