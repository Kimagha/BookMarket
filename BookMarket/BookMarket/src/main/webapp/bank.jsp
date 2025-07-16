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
    
    .custom-bg-half {
            background: linear-gradient(to right, #C8E6FF 50%, #DAF0FF 50%);
            padding: 5rem;
            border-radius: .3rem;
            margin-bottom: 1rem;
        }

</style>

<title>도서 목록</title>
</head>
<body>

<div class="container py-4">
	<%@ include file="bankMenu.jsp" %>
	
	<div class="custom-bg-half">
        <div class="container-fluid py-5">
            <img src="https://210.119.103.168:8080/uploads/kjj123000/농협1.png" style="width : 500px; height :300px;  margin-bottom: 20px;"/>
            <img src="https://210.119.103.168:8080/uploads/kjj123000/농협2.png" style="width : 500px; height :300px; margin-bottom: 20px;"/>
        <ul class="nav nav-pills" style="padding: 0 1rem;">
     	<li class="nav-item"><a href="./index.jsp" class="btn custom-btn" role="button">도서마켓</a></li>
     	</ul>
        </div>
    </div>
    
 <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">
	<img src="https://210.119.103.168:8080/uploads/kjj123000/농협하단1.png" style="width : 1000px; height :100px;"/>
 </div>
 </div>
 </div>
 
  <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">
	<img src="https://210.119.103.168:8080/uploads/kjj123000/농협하단2.png" style="width : 1000px; height :1100px;"/>
 </div>
 </div>
 </div>
 
   <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">
	<img src="https://210.119.103.168:8080/uploads/kjj123000/농협하단3.png" style="width : 1000px; height :1100px;"/>
 </div>
 </div>
 </div>
	
	



</div>

</body>
</html>