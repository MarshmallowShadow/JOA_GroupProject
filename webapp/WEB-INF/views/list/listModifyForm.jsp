<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list modifyForm</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/listModifyForm.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- header -->
	
	<div id="wrap">
		<h1>게시판</h1>
		
		<div id="writebox">
		
			<div id="option_line">
				<p id="option">항목</p>
				<select id="option_list">
					<option value="question">질문</option>
					<option value="commute">소통</option>
					<option value="post">후기</option>
					<option value="together">함께</option>
				</select>
			</div>
			
			<div id="title_line">
				<p id="title">제목</p>
				<input type="text" id="titlebox" value="도림천 다녀오는 길">
			</div>
			
			<div id="content_line"><input type="text" id="contentbox" value="오늘 도림천 다녀오면서 저번에 같이 달리기했던 깜이님 만났어요!"></div>
						
		</div><!-- writebox -->	
		
	</div><!-- wrap -->
	
	<br><br><br>
	
	<div id="user_btn">
		<button type="submit" id="cencle">취소</button>
		<button type="submit" id="post">수정</button>
	</div>

	<br><br><br><br><br><br><br>
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->

</body>
</html>