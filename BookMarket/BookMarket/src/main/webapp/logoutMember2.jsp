<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate();
	response.sendRedirect("loginMember2.jsp");
%>