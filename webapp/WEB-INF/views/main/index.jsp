<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA Main</title>

<!-- CSS -->
<link href="../../../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../../../assets/css/main.css" rel="stylesheet"  type="text/css">

<!-- jquery -->


</head>
<body>

	<div id="header">
		<a href="../main/index.html"> 
		<img id="logo" src="../../../assets/image/main/logo.jpg"></a>

		<div id="login">
			<ul>
				<li><a href="">회원가입</a></li>
				<li><a href="">로그인</a></li>
			</ul>
		</div>
		<!-- login -->

		<div id="nav">
			<ul>
				<li><a href="../together/together.html">함께하기</a></li>
				<li><a href="../board/board.html">게시판</a></li>
				<li><a href="../best/best.html">베스트</a></li>
				<li><a href="../map/map.html">지도</a></li>
			</ul>
		</div>
		<!-- nav -->
	</div>
	<!-- header -->

<!------------------------- photo slider ------------------------>
	
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> <input
				type="radio" name="slide" id="slide2"> <input type="radio"
				name="slide" id="slide3"> <input type="radio" name="slide"
				id="slide4">

			<ul class="imgs" id="imgholder">
				<li><img src="../../../assets/image/main/swiss.jpg"></li>
				<li><img src="../../../assets/image/main/paris.jpg"></li>
				<li><img src="../../../assets/image/main/parispark.jpg"></li>
				<li><img src="../../../assets/image/main/busan.jpg"></li>
			</ul>

			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>

		<!------------------------- 글귀 ------------------------>
<div id="wrap">
		<div class="main-text">
			<p>살아 숨쉬는 자연에서 <br><br><br> 운동을 시작하다.
			</p>
			<br> <br> <br>
			<p>
				<span>J<marquee width="35px" height="15px" scrolldelay="400" direction="up">oyful</marquee> O<marquee width="45px" height="15px" scrolldelay="400" direction="up">utdoor</marquee> A<marquee width="40px" height="15px" scrolldelay="400" direction="up">ctivity</marquee></span>
			</p>
		</div>
</div>

	<!------------------------ footer ------------------------>
	<br>
	<div class="footer">
		<div class="footer-text">
			<p>주식회사 조아</p>
			<p>대표 : 최보승</p>
			<p>사업자 번호 : 123-456-789</p>
			<p>서울특별시 관악구 봉천동 862 - 1</p>
			<br>
			<p>고객센터 | 평일 9 : 30 ~ 18 : 30, 점심시간 : 12 : 00 ~ 13 : 00 (토, 일요일, 공휴일 휴무)</p>
			<p>Tel. 02 - 1111 - 1111</p>
			<p>Fax. 02 - 1111 - 1111</p>
			<p>Email. joa@joa.co.kr</p>
		</div>
		<br>
		<div class="footer-btn">
			<button id="footerbtn" type="button">자주묻는 질문</button>
			<button id="footerbtn" type="button">1:1 문의</button>
		</div>
		<br>
		<hr class="my-hr1">
		<p id="footer-Copyright">JOA, Inc. All rights reserved.</p>

	</div>

</body>
</html>