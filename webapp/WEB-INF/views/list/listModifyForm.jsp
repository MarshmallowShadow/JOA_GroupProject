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
	<h1>1:1 문의 게시판</h1>
	
	<div id="writebox">
	
		<div id="option_line">
			<p id="option">항목</p>
			<select id="option_list">
				<option value="default"></option>
				<option value="question">개인</option>
				<option value="commute">사업</option>
				<option value="service">서비스</option>
			</select>
		</div>
		
		<div id="title_line">
			<p id="title">제목</p>
			<input type="text" id="titlebox" value="${lVo.title}">
		</div>
		
		<div id="content_line"><textarea id="contentbox">${lVo.content}</textarea></div>
					
	</div><!-- writebox -->	
	
</div><!-- wrap -->

<br><br><br>

<div id="user_btn">
	<button id="cancel" onclick="window.location='${pageContext.request.contextPath}/list/list';">취소</button>
	<button type="submit" id="post">수정</button>
</div>

<br><br><br><br><br><br><br>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<!-- footer -->

</body>
</html>