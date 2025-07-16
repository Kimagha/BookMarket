<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
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
        }
        .custom-btn:hover {
        	color: #fff;
            background-color: #4169E1; /* 진한 블루 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .custom-nav {
            display: flex;
            flex-wrap: wrap;
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
    </style>
</head>
<body>
    <header class="pb-3 mb-4 border-bottom">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="./index.jsp" class="text-dark text-decoration-none d-flex align-items-center">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/메인아이콘.png" style="width: 60px; height: 60px;" alt="Main Icon">
                <span class="fs-6 custom-font ms-2">서점 사이트</span>
            </a>

            <ul class="nav custom-nav">
                <c:choose>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item"><a class="nav-link" href="<c:url value='./loginMember.jsp'/>" style="color: black;"> 로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='./addMember.jsp'/>" style="color: black;">회원가입</a></li>
                    </c:when>
                    <c:otherwise>
                        <li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='./logoutMember.jsp'/>" style="color: black;">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='./updateMember.jsp'/>" style="color: black;">회원 수정</a></li>
                    </c:otherwise>
                </c:choose>

                <!-- 도서 관리 드롭다운 -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle custom-btn" id="dropdownBooksMenu" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-book custom-icon"></i>도서 메뉴
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownBooksMenu">
                        <li><a class="dropdown-item" href="./books.jsp">도서목록</a></li>
                        <li><a class="dropdown-item" href="./addBook.jsp">도서등록</a></li>
                        <li><a class="dropdown-item" href="./editBook.jsp?edit=update">도서수정</a></li>
                        <li><a class="dropdown-item" href="./editBook.jsp?edit=delete">도서삭제</a></li>
                        <li><a class="dropdown-item" href="./exceptionNoBookId.jsp">예외처리</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a href="./bank.jsp" class="btn custom-btn" role="button"><i class="bi bi-bank custom-icon"></i>은행</a></li>
                <li class="nav-item"><a href="./webChatClient.jsp" class="btn custom-btn" role="button"><i class="bi bi-chat-dots custom-icon"></i>채팅</a></li>
                <li class="nav-item"><a href="<c:url value='/BoardListAction.do?pageNum=1'/>" class="btn custom-btn" role="button"><i class="bi bi-card-list custom-icon"></i>게시판</a></li>
            </ul>
        </div>
    </header>

    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
