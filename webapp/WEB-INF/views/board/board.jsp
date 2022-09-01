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
		
		<h1>소통하기</h1>
		
		<!-- 필터링 옵션 항목 -->
		<div id="top_aside">
			<form action="${pageContext.request.contextPath}/board/board" method="get">
				<select id="option" name="boardCategory">
					<option value=""></option>
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
						<th class="bold">*</th>
						<td class="center bold">공지</td>
						<td><a class="notice_margin bold" href="">{ 욕.비방글은 삼가시고 많은 소통으로 활성화 부탁드립니다. }</a></td>
						<td class="center bold">관리자</td>
						<td class="center bold">*</td>
						<td class="center bold">2022.02.15</td>
					</tr>

					<c:forEach items="${boardList}" var="bMap">
							<tr>
								<td class="center">${bMap.BOARDNO}</td>
								<td class="center">${categoryMap[bMap.BOARDCATEGORY]}</td>
								<td><a class="title_margin" href="${pageContext.request.contextPath}/board/read/${bMap.BOARDNO}">${bMap.TITLE} 
									<c:if test="${bMap.COUNT != null}">
										[${bMap.COUNT}]
									</c:if>
									
									<c:if test="${bMap.IMG != null}">
										<span class="glyphicon glyphicon-picture"></span>
									</c:if>
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
				<button type="submit" id="write" onclick="location.href='${pageContext.request.contextPath}/JOA/board/writeform';">글쓰기</button>
			</c:if>
		</div>
		
		<!-- 페이지 -->
		<div id="page">
			<ul class="ul">
			<c:if test="${prev}">
				<li class="li"><a href="#">◀</a></li>
			</c:if>
			<c:forEach begin="${startPageBtnNo}" end="${endPageBtnNo}" step="1" var="i">
				<li class="active li"><a href="${pageContext.request.contextPath}/board/board?crtPage=${i}">${i}</a></li>
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