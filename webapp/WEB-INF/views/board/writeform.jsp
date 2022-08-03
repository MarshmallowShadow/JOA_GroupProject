<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기폼</title>
<!-- css -->
<link href="../../../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../../../assets/css/writeForm.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="../../../assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../assets/js/course/view-course.js"></script>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<a href="../main/index.html"><img id="logo" src="../../../assets/image/main/logo.jpg"></a>
			
			<div id="login">
				<ul>
					<li><a href="">회원가입</a></li>
					<li><a href="">로그인</a></li>
				</ul>
			</div> <!-- login -->
			
			<div id="nav">
				<ul>
					<li><a href="../together/together.html">함께하기</a></li>
					<li><a href="../board/board.html">게시판</a></li>
					<li><a href="../best/best.html">베스트</a></li>
					<li><a href="../map/map.html">지도</a></li>
				</ul>
			</div> <!-- nav -->
		</div> <!-- header -->
	
		<h1>게시판</h1>
		
		<div id="writebox">
		
			<!-- 글쓰기 옵션 항목 -->
			<div id="option_line">
				<p id="option">항목</p>
				<select id="option_list">
					<option value="question">질문</option>
					<option value="commute">소통</option>
					<option value="post">후기</option>
					<option value="together">함께</option>
				</select>
			</div>
			
			<!-- 제목 -->
			<div id="title_line">
				<p id="title">제목</p>
				<input type="text" id="titlebox">
			</div>
			
			<!-- 글내용 -->
			<div id="content_line"><input type="text" id="contentbox"></div>
			
			<!-- 사진 첨부 -->
			<div id="file_line">
				<p id="file">사진첨부</p>
				<input type="file" id="filebox" multiple="multiple">
			</div>
			
			<!-- 코스 선택 -->
			<div id="course_line">
				<p id="course">코스선택</p>
				<button type="submit" id="course_choice"><span class="glyphicon glyphicon-folder-open gray" id="folder"></span>코스 불러오기</button>
			</div>
			
			<!-- 함께하기 선택 -->
			<div id="together_line">
				<p id="together">함께하기</p>
				<button type="submit" id="together_choice"><span class="glyphicon glyphicon-user gray" id="man"></span>함께하기 불러오기</button>
			</div>
			
		</div><!-- writebox -->	
		
	</div><!-- wrap -->
	
	<br><br><br>
	
	<div id="user_btn">
		<button type="submit" id="cencle">취소</button>
		<button type="submit" id="post">등록</button>
	</div>

	<br><br><br><br><br><br><br>
	
	<div class="footer">
		<div class="footer-text">
			<p>주식회사 조아</p>
			<p>대표 : 최보승</p>
			<p>사업자 번호 : 123-456-789</p>
			<p>서울특별시 관악구 봉천동 862 - 1</p>
			<br>
			<p>고객센터 | 평일 9 : 30 ~ 18 : 30, 점심시간 : 12 : 00 ~ 13 : 00 (토, 일요일, 공휴일 휴무)</p>
			<p>tel. 02 - 1111 - 1111</p>
			<p>fax. 02 - 1111 - 1111</p>
			<p>email. joa@joa.co.kr</p>
		</div>
		<br>
		<div class="footer-btn">
			<button id="footerbtn" type="button" name="" value="">자주묻는 질문</button>
			<button id="footerbtn" type="button" name="" value="">1:1 문의</button>
		</div>
		<br>
		<hr class="my-hr1">
		<p id="footer-Copyright">JOA, Inc. All rights reserved.</p>

	</div> <!-- footer -->

</body>
</html>