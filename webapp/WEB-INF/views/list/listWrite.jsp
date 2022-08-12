<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의게시판 글쓰기폼</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/listWrite.css" rel="stylesheet"	type="text/css">

</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!---------------------------------------- header --------------------------------------->

<!----------------------------- content ----------------------------->
	<div id="wrap">

		<h1>1:1 문의 게시판</h1>

		<form action="${pageContext.request.contextPath}/write" method="get">

			<div id="writebox">

				<!-- 글쓴이 -->
				<input type="hidden" name="userNo" value="${authUser.userNo}">

				<!-- 글쓰기 옵션 항목 -->
				<div id="option_line">
					<p id="option">항목</p>
					<select id="option_list" name="boardCategory">
						<option value="default"></option>
						<option value="question">개인</option>
						<option value="commute">사업</option>
						<option value="commute">서비스</option>
					</select>
				</div>

				<!-- 제목 -->
				<div id="title_line">
					<p id="title">제목</p>
					<input type="text" id="titlebox" name="title" value="" placeholder="제목을 입력해 주세요.">
				</div>

				<!-- 글내용 -->
				<div id="content_line">
					<textarea id="contentbox" name="content"></textarea>
				</div>
			</div>
			<!-- writebox -->

			<br>
			<br>
			<br>

			<div id="user_btn">
				<a id="cancel" href="${pageContext.request.contextPath}/board">취소</a>
				<button type="submit" id="post">등록</button>
			</div>
		</form>

	</div>
	<!-- wrap -->

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<!------------------------ footer ------------------------>

</body>
</html>