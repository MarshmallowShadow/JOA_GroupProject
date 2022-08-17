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
		<select id="option">
			<option value="default"></option>
			<option value="question">개인</option>
			<option value="commute">사업</option>
			<option value="commute">서비스</option>
		</select>

		<!-- 검색창과 버튼 -->
		<input type="text" id="textbox">
		<button type="submit" id="search"><span class="glyphicon glyphicon-search"></span>
		</button>
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
						<th>1</th>
						<td class="center">[개인]</td>
						<td>내가 그렇게 만만하니 <span class="glyphicon glyphicon-picture"></span></td>
						<td class="center">유키스</td>
						<td class="center">47</td>
						<td class="center">2022.07.25</td>
					</tr>

				</tbody>
			</table>
		</div>
		<!-- table -->

		<!-- 문의하기 버튼 -->
		<div>
			<button type="submit" id="write" onclick="window.location='${pageContext.request.contextPath}/listWrite';">문의하기</button>
		</div>

		<!-- 페이지 -->
		<div id="page">
			<ul>
				<li>◀</li>
				<li>1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li class="active">5</li>
				<li>6</li>
				<li>7</li>
				<li>8</li>
				<li>9</li>
				<li>10</li>
				<li>▶</li>
			</ul>
		</div>
		<!-- board button -->

	</div>
</div>

<!------------------------ footer ------------------------>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>
</html>