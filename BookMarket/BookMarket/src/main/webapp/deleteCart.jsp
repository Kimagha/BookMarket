<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
    // 세션 무효화
    session.invalidate();
    // 장바구니 페이지로 리다이렉트
    response.sendRedirect("cart.jsp");
%>