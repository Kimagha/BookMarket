<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">

<style>

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

<title>도서 정보</title>
<script type="text/javascript">
    function addToCart() {
        if (confirm("도서를 장바구니에 추가하시겠습니까?")) {
            document.addForm.submit();
        }
        else{
            document.addForm.reset();
        }
    }
</script>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp" %>
    
    <div class="p-5 mb-4 bg-lightblue rounded-3">
        <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold text-white">도서정보</h1>
        <p class="col-md-8 fs-4 text-white">BookInfo</p>
        
        </div>
    </div>
<%@include file="dbconn.jsp" %>

    <div class="row align-items-md-stretch">
    
    <%
        String bookId = request.getParameter("id");
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql="SELECT * FROM bookmarket WHERE b_bookId=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, bookId);
        rs=pstmt.executeQuery();
        if (rs.next()) {
    %>
    
        <div class="col-md-5">
            <img src="https://210.119.103.168:8080/uploads/kjj123000/<%=rs.getString("b_filename") %>" style="width : 70%">
        </div>
        <div class="col-md-12">
            <h3><b><%=rs.getString("b_name") %></b></h3>
            <p> <%=rs.getString("b_description") %>
            <p> <b>도서코드 : </b><span class="badge text-bg-danger"><%=rs.getString("b_bookId") %></span>
            <p> <b>저자</b> : <%=rs.getString("b_author") %>
            <p> <b>출판사</b> : <%=rs.getString("b_publisher") %>
            <p> <b>출판일</b> : <%=rs.getString("b_releaseDate") %>
            <p> <b>분류</b> : <%=rs.getString("b_category") %>
            <p> <b>재고수</b> : <%=rs.getString("b_unitsInStock") %>
            <h4><%=rs.getString("b_unitPrice") %>원</h4>
            
            <p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_bookId") %>" method="post">
                <a href="#" class="btn btn-info" onclick="addToCart()">도서 주문 &raquo;</a>
                <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
                <a href="./books.jsp" class="btn custom-btn">도서 목록 &raquo;</a>
            </form>
        </div>
        
    <%
        } else {
    %>
    
        <div class="col-md-12">
            <p>해당 도서를 찾을 수 없습니다.</p>
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
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
