<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
		
		<h1>게시판</h1>
		
		<!-- 필터링 옵션 항목 -->
		<div id="top_aside">
			<form action="${pageContext.request.contextPath}/board" method="get">
				<select id="option" name="boardCategory">
					<option value="default"></option>
					<option value="question">질문</option>
					<option value="commute">소통</option>
					<option value="post">후기</option>
					<option value="together">함께</option>
					<option value="map">코스</option>
				</select>
				
				<!-- 검색창과 버튼 -->
				<input type="text" id="textbox" name="keyword">
				<button type="submit" id="search"><span class="glyphicon glyphicon-search"></span></button>
			</form>
		</div>
	
		<br>
	
		<!-- 게시판 리스트 -->
		<div id="board">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>항목</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>공지</th>
						<td class="center">공지</td>
						<td><a href="">(필독)글쓰기 전 확인해 주세요.[1985]</a></td>
						<td class="center">관리자</td>
						<td class="center">35482</td>
						<td class="center">2022.02.15</td>
					</tr>

					<c:forEach items="${boardList}" var="bMap">
							<tr>
								<td class="center">${bMap.BOARDNO}</td>
								<td class="center">${bMap.BOARDCATEGORY}</td>
								<td><a href="${pageContext.request.contextPath}/read/${bMap.BOARDNO}">${bMap.TITLE} 
									<!--<c:if test="${Map.board_img_no eq true}">
										<span class="glyphicon glyphicon-picture"></span>
									</c:if>-->
								</a></td>
								<td class="center">${bMap.ID}</td>
								<td class="center">${bMap.VIEWCOUNT}</td>
								<td class="center">${bMap.REGDATE}</td>
							</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div><!-- table -->
		
		<!-- 글쓰기 버튼 -->
		<div>
			<c:if test="${authUser != null}">
				<button type="submit" id="write" onclick="location.href='http://localhost:8088/JOA_GroupProject/writeform';">글쓰기</button>
			</c:if>
		</div>
		
		<!-- 페이지 -->
		<div id="page">
			<ul class="ul">
			<c:if test="${prev}">
				<li class="li"><a href="#">◀</a></li>
			</c:if>
			<c:forEach begin="${startPageBtnNo}" end="${endPageBtnNo}" step="1" var="i">
				<li class="active li"><a href="${pageContext.request.contextPath}/board?crtPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${next}">
				<li class="li"><a href="#">▶</a></li>
			</c:if>
			</ul>
		</div><!-- board button -->
		
	</div><!-- wrap -->
	
	<br><br><br><br><br>
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->

</body>
</html>