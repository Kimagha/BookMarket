<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link 04 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Welcome</title>
<meta charset="UTF-8">

<style> 
   	#container {
  		width: 1200px;
  		height: 450px;
  		overflow: hidden;
  		margin: 0 auto;
	}

	.img {
  		display: none;
  		width: 1200px;
  		height: 450px;
	}

	.img.on {
  		display: block;
	}
	
	
	/* 스타일링 추가 */
    .bestseller-section {
        text-align: center;
        margin-top: 30px;
    }

    .bestseller-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .bestseller-images {
        display: flex;
        justify-content: center;
    }

    .bestseller-images a {
        margin: 0 30px; /* 이미지를 가로 간격으로 배치 */
        text-decoration: none;
    }

    .bestseller-images img {
        width: 250px; /* 이미지 너비 조정 */
        height: 350px; /* 이미지 높이 조정 */
        border-radius: 10px; /* 이미지에 둥근 모서리 추가 */
        transition: transform 0.3s ease;
    }

    .bestseller-images img:hover {
        transform: scale(1.05); /* 마우스 오버 시 이미지 확대 */
    }
	
    
</style>



</head>
<body>

<div class="container py-4">
 <%@ include file="menu.jsp" %>
<div id="container">
	<div class="d-flex justify-content-center align-items-center" style="height: 50vh;">
         <a href="./book.jsp?id=ISBN0045">
            <img class="img" src="https://210.119.103.168:8080/uploads/kjj123000/포스터.png"  alt="포스터 이미지1">
        </a>
        <a href="./book.jsp?id=ISBN0046">	
        	<img class="img" src="https://210.119.103.168:8080/uploads/kjj123000/수능특강.png" alt="포스터 이미지2">
        </a>
        
    </div>
</div> 



	<div class="bestseller-section">
        <div class="bestseller-title">베스트셀러 Top3</div>
        <div class="bestseller-images">
            <a href="./book.jsp?id=ISBN0004">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/베스트1.jpg" alt="베스트셀러 1">
            </a>
            <a href="./book.jsp?id=ISBN0005">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/베스트2.jpg" alt="베스트셀러 2">
            </a>
            <a href="./book.jsp?id=ISBN0006">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/베스트3.jpg" alt="베스트셀러 3">
            </a>
        </div>
    </div>
    
    
    <div class="bestseller-section">
        <div class="bestseller-title">요즘 뜨는 드라마 대본집 Top3</div>
        <div class="bestseller-images">
            <a href="./book.jsp?id=ISBN0001">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/대본집.jpg" alt="대본집 1">
            </a>
            <a href="./book.jsp?id=ISBN0002">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/대본집2.jpg" alt="대본집 2">
            </a>
            <a href="./book.jsp?id=ISBN0003">
                <img src="https://210.119.103.168:8080/uploads/kjj123000/대본집3.jpg" alt="대본집 3">
            </a>
        </div>
    </div>
    


 <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">

 </div>
 </div>
 </div>
 
 <%@ include file="footer.jsp" %>
</div>

<script>
	const images = document.querySelectorAll('.img');
	let current = 0;

	function showSlide() {
	  for(let i=0; i<images.length; i++) {
	    images[i].classList.remove('on');
	  }
	  current++;
	  if(current > images.length) {
	    current = 1;
	  }
	  images[current - 1].classList.add('on');
	  setTimeout(showSlide, 2000);
	}

	showSlide();
	</script>


</body>
</html>