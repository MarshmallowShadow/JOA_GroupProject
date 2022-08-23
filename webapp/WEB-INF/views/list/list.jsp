<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의게시판</title>

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/list.css" rel="stylesheet" type="text/css">

</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!---------------------------------------- header --------------------------------------->

<div id="wrap">
	<div class="content">
		<h1>문의 게시판</h1>

		<div class="content-text">
			<p>
				<span id="a">♧</span> 답변은 글 작성해주신 이후 영업시간 기준 <span id="b">최대
					24시간</span>이 소요되며,
			</p>
			<p>
				&nbsp;&nbsp;&nbsp; 영업시간 외, <span id="b">주말 및 공휴일, 지정 휴일</span>엔 답변이
				불가할 수 있습니다.
			</p>
		</div>
		
	<!-- 필터링 옵션 항목 -->
	<div id="top_aside">
		<form action="${pageContext.request.contextPath}/list/list" method="get">
			<select id="option" name="boardCategory">
				<option value=""></option>
				<option value="question">개인</option>
				<option value="commute">사업</option>
				<option value="service">서비스</option>
			</select>
	
			<!-- 검색창과 버튼 -->
			<input type="text" id="textbox" name="keyword">
			<button type="submit" id="search"><span class="glyphicon glyphicon-search"></span>
			</button>
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
				
				<c:forEach items="${lList}" var="listVo">
					<tr>
						<th>${listVo.Q_LIST_NO}</th>
						<td class="center">${cateMap[listVo.BOARD_CATEGORY]}</td>	<!-- 항목 -->
						<td><a href="${pageContext.request.contextPath}/list/read/${listVo.Q_LIST_NO}">${listVo.TITLE}</a></td><!-- 제목 -->
						<td class="center">${listVo.ID}</td>			<!-- 작성자 -->
						<td class="center">${listVo.VIEW_COUNT}</td>		<!-- 조회수 -->
						<td class="center">${listVo.REG_DATE}</td>		<!-- 날짜 -->
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
		</div>
		<!-- table -->

		<!-- 문의하기 버튼 -->
		<div>
			<button type="button" id="write" onclick="window.location='${pageContext.request.contextPath}/list/listWrite';">문의하기</button>
		</div>

		<!-- 페이지 -->
		<div id="page">
			<ul>
				<c:if test="${pMap.prev}">
					<li><a href="${pageContext.request.contextPath}/list/list?crtPage=${pMap.startPageBtnNo-1}">◀</a></li>
				</c:if>
				
				<c:forEach begin="${startPageBtnNo}" end="${endPageBtnNo}" step="1" var="i">
					<c:choose>
						<c:when test="${param.crtPage==i}">
							<li class="active"><a href="${pageContext.request.contextPath}/list/list?crtPage=${i}&title=${param.keyword}">${i}</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/list/list?crtPage=${i}&title=${param.keyword}&boardCategory=${param.boardCategory}">${i}</a></li>
						</c:otherwise>						
											
					</c:choose>				
				</c:forEach>
				
				<c:if test="${pMap.next}">
					<li><a href="${pageContext.request.contextPath}/list/list?crtPage=${pMap.endPageBtnNo+1}">▶</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<!------------------------ footer ------------------------>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>
</html>