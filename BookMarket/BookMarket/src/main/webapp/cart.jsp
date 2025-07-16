<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

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

<title>장바구니</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container py-4">
    
    <div class="p-5 mb-4 bg-lightblue rounded-3">
    <div class="container-fluid py-5">
        <div class="text-center">
            <h1 class="display-3 fw-bold text-white">장바구니</h1>
        </div>
    </div>
    </div>
    
    <div class="row align-items-md-stretch">
        <div class="row">
            <table width="100%">
                <tr>
                    <td align="left"><a href="./deleteCart.jsp?cartId=<%= session.getId() %>" class="btn btn-danger">삭제하기</a></td>
                    <td align="right"><a href="./shippingInfo.jsp" class="btn btn-success">주문하기</a></td>
                </tr>
            </table>
        </div>
        
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>도서</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                    <th>비고</th>
                </tr>
                <%
                    int sum = 0;
                    ArrayList<String[]> cartList = (ArrayList<String[]>) session.getAttribute("cartlist");
                    if (cartList != null) {
                        for (String[] book : cartList) {
                            int unitPrice = Integer.parseInt(book[3]);
                            int quantity = Integer.parseInt(book[2]);
                            int total = unitPrice * quantity;
                            sum += total;
                %>
                <tr>
                    <td><%= book[1] %> - <%= book[0] %></td>
                    <td><%= unitPrice %></td>
                    <td><%= quantity %></td>
                    <td><%= total %></td>
                    <td><a href="./removeCart.jsp?id=<%= book[0] %>" class="badge text-bg-danger">삭제</a></td>
                </tr>
                <%
                        }
                    }
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%= sum %></th>
                    <th></th>
                </tr>                    
            </table>
            <a href="./books.jsp" class="btn custom-btn"> &laquo; 쇼핑 계속하기</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</div>

<%
    // 세션에 cartId 저장
    session.setAttribute("cartId", session.getId());
%>

</body>
</html>
