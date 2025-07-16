<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="dbconn.jsp" %>

<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("books.jsp");
        return;
    }

    // Get the cart from session
    ArrayList<String[]> cartList = (ArrayList<String[]>) session.getAttribute("cartlist");
    if (cartList != null) {
        for (int i = 0; i < cartList.size(); i++) {
            String[] book = cartList.get(i);
            if (book[0].equals(id)) {
                cartList.remove(i);
                break;
            }
        }
    }

    response.sendRedirect("cart.jsp");
%>
