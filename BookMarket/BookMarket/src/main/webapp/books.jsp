<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">

<style> 
   	
	/* 스타일링 추가 */
    .bestseller-section {
        text-align: center;
        margin-top: 30px;
    }

    .bestseller-title {
        font-size: 35px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .bestseller-images {
        display: flex;
        justify-content: center;
    }

    .bestseller-images a {
        margin: 0 10px; /* 이미지를 가로 간격으로 배치 */
        text-decoration: none;
    }

    .bestseller-images img {
        width: 225px; /* 이미지 너비 조정 */
        height: 325px; /* 이미지 높이 조정 */
        border-radius: 10px; /* 이미지에 둥근 모서리 추가 */
        transition: transform 0.3s ease;
    }

    .bestseller-images img:hover {
        transform: scale(1.05); /* 마우스 오버 시 이미지 확대 */
    }
    
   
    .bg-lightblue {
        background-color: lightblue;
    }
    
    .custom-btn {
        background-color: lightblue; 
        color: #fff;
        border-radius: 20px;
        padding: 10px 20px;
        font-size: 16px;
        margin-right: 10px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }
    .custom-btn:hover {
    	color: #fff;
        background-color: #4169E1; /* 진한 블루 */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    


	
    
</style>


<title>도서 목록</title>
</head>
<body>

<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-lightblue rounded-3">
		<div class="container-fluid py-5">
			<div class="bestseller-section">
        		<div class="bestseller-title text-white"> 급상승! 하이큐 시리즈 </div>
        		<div class="bestseller-images">
            <a href="./book.jsp?id=ISBN0010">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/하이큐1.jpg" alt="하이큐 1">
            </a>
            <a href="./book.jsp?id=ISBN0011">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/하이큐2.jpg" alt="하이큐 2">
            </a>
            <a href="./book.jsp?id=ISBN0012">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/하이큐3.jpg" alt="하이큐 3">
            </a>
            <a href="./book.jsp?id=ISBN0013">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/하이큐4.jpg" alt="하이큐 4">
            </a>
            <a href="./book.jsp?id=ISBN00014">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/하이큐5.jpg" alt="하이큐 5">
            </a>
        		</div>
    		</div>
		</div>
	</div>
	<%@include file="dbconn.jsp" %>




<div class="row align-items-md-stretch text-center">

	<%
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM bookmarket";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while (rs.next()) {
	%>
	
	
	
	
	
	<div class="col-md-4">
		<div class="h-100 p-2">
		<img src="https://210.119.103.168:8080/uploads/kjj123000/<%=rs.getString("b_filename") %>" style="width : 250px; height :350px;" />
		
			
			
			<h5><b><%=rs.getString("b_name") %></b></h5>
			<p> <%=rs.getString("b_author") %>
			<br><%=rs.getString("b_publisher") %> | <%=rs.getString("b_unitPrice") %>원
			
			<p> <%=rs.getString("b_description").substring(0,60) %>....
 
			<p> <%=rs.getString("b_unitPrice") %>원
			<p> <a href="./book.jsp?id=<%=rs.getString("b_bookId") %>"
			class="btn custom-btn" role="button"> 상세 정보 &raquo;</a>
		</div>
	</div>
	<% 
		}
		if (rs!=null)
			rs.close();
		if (pstmt!=null)
			pstmt.close();
		if (conn!=null)
			conn.close();
	%>
</div>
<%@ include file="footer.jsp" %>
</div>

</body>
</html>