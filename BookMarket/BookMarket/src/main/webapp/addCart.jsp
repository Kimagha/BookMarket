<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.util.ArrayList" %>

<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("books.jsp");
        return;
    }

    try {
        // Check if the book exists in the bookmarket table
        PreparedStatement pstmtCheckBook = conn.prepareStatement("SELECT * FROM bookmarket WHERE b_bookId = ?");
        pstmtCheckBook.setString(1, id);
        ResultSet rsCheckBook = pstmtCheckBook.executeQuery();
        if (!rsCheckBook.next()) {
            response.sendRedirect("exceptionNoBookId.jsp");
            return;
        }

        // If the book exists, add it to the cart
        String[] newBook = {
            rsCheckBook.getString("b_bookId"),
            rsCheckBook.getString("b_name"),
            "1", // Default quantity is 1
            String.valueOf(rsCheckBook.getInt("b_unitPrice")),
            String.valueOf(rsCheckBook.getInt("b_unitsInStock"))
        };

        // Get the cart from session
        ArrayList<String[]> cartList = (ArrayList<String[]>) session.getAttribute("cartlist");
        if (cartList == null) {
            cartList = new ArrayList<String[]>();
            session.setAttribute("cartlist", cartList);
        }

        // Add the new book to the cart
        cartList.add(newBook);

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    } catch (SQLException ex) {
        out.println("SQL 오류: " + ex.getMessage());
    } finally {
        try {
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            out.println("데이터베이스 연결 종료 오류: " + ex.getMessage());
        }
    }
%>
