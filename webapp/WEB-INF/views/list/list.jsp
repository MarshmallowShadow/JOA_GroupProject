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
						<td>내가 그렇게 만만하니 <span
							class="glyphicon glyphicon-picture"></span></td>
						<td class="center">유키스</td>
						<td class="center">47</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>2</th>
						<td class="center">[사업]</td>
						<td>한강 사진 공유~[14] <span class="glyphicon glyphicon-picture"></span></td>
						<td class="center">아이유</td>
						<td class="center">10000</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>3</th>
						<td class="center">[사업]</td>
						<td>너랑 나[4] <span class="glyphicon glyphicon-picture"></span></td>
						<td class="center">나이키</td>
						<td class="center">17</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>4</th>
						<td class="center">[개인]</td>
						<td>이의 있습니다.[16] <span class="glyphicon glyphicon-picture"></span></td>
						<td class="center">권모술수</td>
						<td class="center">54</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>5</th>
						<td class="center">[개인]</td>
						<td>음.. 고래 얘기가 꼭 필요한 상황이라면?[96]</td>
						<td class="center">우영우</td>
						<td class="center">168</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>6</th>
						<td class="center">[개인]</td>
						<td>그렇다는 증거 있습니까?[0]</td>
						<td class="center">우영우<td>
						<td class="center">2</td>
						<td class="center">2022.07.25</td>
					</tr>

					<tr>
						<th>7</th>
						<td class="center">[소통]</td>
						<td>거 우영우 변호사 글 그만쓰세요.[5]</td>
						<td class="center">정뿡뿡</td>
						<td class="center">33</td>
						<td class="center">2022.07.24</td>
					</tr>

					<tr>
						<th>8</th>
						<td class="center">[질문]</td>
						<td>등산 배낭 공구하실 분??[186]</td>
						<td class="center">장비빨</td>
						<td class="center">78</td>
						<td class="center">2022.07.24</td>
					</tr>

					<tr>
						<th>9</th>
						<td class="center">[질문]</td>
						<td>ㅇㅇ빌딩 옆 top1 산책 코스에서 차키 보신 분ㅜㅠ[19]</td>
						<td class="center">매직핸드</td>
						<td class="center">34</td>
						<td class="center">2022.07.24</td>
					</tr>

					<tr>
						<th>10</th>
						<td class="center">[후기]</td>
						<td>내일 폭염이라네요ㅜ][2]</td>
						<td class="center">날씨예민러</td>
						<td class="center">18</td>
						<td class="center">2022.07.23</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- table -->

		<!-- 글쓰기 버튼 -->
		<div>
			<button type="submit" id="write">문의하기</button>
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