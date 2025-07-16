<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String sessionId=(String) session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
    
    .custom-btn {
            background-color: lightblue; 
            color: #fff;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px; /* 여백 추가 */
        }
        .custom-btn:hover {
            color: #fff;
            background-color: #4169E1; /* 진한 블루 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .custom-nav {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
        }
        .custom-nav .nav-link {
            color: #fff;
            transition: color 0.3s ease;
        }
        .custom-nav .nav-link:hover {
            color: #fff;
        }
        .custom-icon {
            margin-right: 8px;
        }
        
        .bank-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }
        .bank-header img {
            width: 800px;
            height: 100px;
        }
    
    </style>
    
</head>
<body>

<header class="pb-3 mb-4 border-bottom bank-header">
    <a href="./bank.jsp" class="text-dark text-decoration-none">
        <img src="https://210.119.103.168:8080/uploads/kjj123000/농협홈.png" alt="Bank Icon">
    </a>

    <ul class="nav custom-nav">
        <c:choose>
            <c:when test="${empty sessionId}">
                <li class="nav-item"><a class="nav-link" href="<c:url value='./loginMember2.jsp'/>" style="color: black;"> 로그인</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='./addMember2.jsp'/>" style="color: black;"> 회원가입</a></li>
            </c:when>
            <c:otherwise>
                <li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='./logoutMember2.jsp'/>" style="color: black;"> 로그아웃</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='./updateMember2.jsp'/>" style="color: black;"> 회원 수정</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</header>

<ul class="nav custom-nav" style="padding: 0 1rem;">
    <li class="nav-item"><a href="./NewAccount.jsp" class="btn custom-btn" role="button"> 계좌 생성</a></li>
    <li class="nav-item"><a href="./Withdraw.jsp" class="btn custom-btn" role="button"> 출금</a></li>
    <li class="nav-item"><a href="./Transfer.jsp" class="btn custom-btn" role="button"> 입금</a></li>
    <li class="nav-item"><a href="./Send.jsp" class="btn custom-btn" role="button"> 이체</a></li>
    <li class="nav-item"><a href="./Transaction.jsp" class="btn custom-btn" role="button"> 입출금,이체 내역</a></li>
</ul>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
