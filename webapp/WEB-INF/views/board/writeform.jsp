<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기폼</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/writeForm.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/course/view-course.js"></script>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
	
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

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->

</body>
</html>