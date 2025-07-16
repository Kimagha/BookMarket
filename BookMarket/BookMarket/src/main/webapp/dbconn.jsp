<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn=null;

	try {
			String url;
		  String user = "kjj123000";           // 본인 id
		  String password = "199eh118^^";   // 본인 암호

		  boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
		  // 윈도우 서버
		  if(isWindows) url = "jdbc:mysql://localhost:3306/BookMarketDB";
		  // 우분투 서버  (DB서버 주소는 localhost 임)
		  else url = "jdbc:mysql://localhost:3306/kjj123000db?serverTimezone=UTC&characterEncoding=utf8"; 
		  
		  
		
		
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, user, password);
		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>