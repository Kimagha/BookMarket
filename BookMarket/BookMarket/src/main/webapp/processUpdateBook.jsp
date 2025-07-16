<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String uploadpath;
    if(System.getProperty("os.name").toLowerCase().startsWith("windows")) uploadpath = "C://uploads";
    else uploadpath = System.getProperty("catalina.base") + "/webapps/uploads/kjj123000";
    MultipartRequest multi = new MultipartRequest(request, uploadpath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String author = multi.getParameter("author");
    String publisher = multi.getParameter("publisher");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    int price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
    long stock = unitsInStock.isEmpty() ? 0 : Long.parseLong(unitsInStock);

    // 디버그 출력
    System.out.println("bookId: " + bookId);
    System.out.println("name: " + name);
    System.out.println("unitPrice: " + unitPrice);
    System.out.println("author: " + author);
    System.out.println("publisher: " + publisher);
    System.out.println("releaseDate: " + releaseDate);
    System.out.println("description: " + description);
    System.out.println("category: " + category);
    System.out.println("unitsInStock: " + unitsInStock);
    System.out.println("condition: " + condition);
    System.out.println("fileName: " + fileName);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM bookmarket WHERE b_bookId=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bookId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            if (fileName != null) {
                sql = "UPDATE bookmarket SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=?, b_filename=? WHERE b_bookId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setInt(2, price);
                pstmt.setString(3, author);
                pstmt.setString(4, description);
                pstmt.setString(5, publisher);
                pstmt.setString(6, category);
                pstmt.setLong(7, stock);
                pstmt.setString(8, releaseDate);
                pstmt.setString(9, condition);
                pstmt.setString(10, fileName);
                pstmt.setString(11, bookId);
            } else {
                sql = "UPDATE bookmarket SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? WHERE b_bookId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setInt(2, price);
                pstmt.setString(3, author);
                pstmt.setString(4, description);
                pstmt.setString(5, publisher);
                pstmt.setString(6, category);
                pstmt.setLong(7, stock);
                pstmt.setString(8, releaseDate);
                pstmt.setString(9, condition);
                pstmt.setString(10, bookId);
            }
            int rowsUpdated = pstmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);
        } else {
            System.out.println("No book found with bookId: " + bookId);
        }
    } catch (SQLException e) {
        e.printStackTrace(System.out);
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    response.sendRedirect("editBook.jsp?edit=update");
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
