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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/course/view-course.js"></script>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<a href="../main/index.html"><img id="logo" src="${pageContext.request.contextPath}/assets/image/main/logo.jpg"></a>
			
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
		
		<!-- 필터링 옵션 항목 -->
		<div id="top_aside">
			<select id="option">
				<option value="default"></option>
				<option value="question">질문</option>
				<option value="commute">소통</option>
				<option value="post">후기</option>
				<option value="together">함께</option>
				<option value="map">코스</option>
			</select>
			
			<!-- 검색창과 버튼 -->
			<input type="text" id="textbox">
			<button type="submit" id="search"><span class="glyphicon glyphicon-search"></span></button>
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
					
					<tr>
						<th>1</th>
						<td class="center">[소통]</td>
						<td><a href="">도림천 다녀오는 길![21] <span class="glyphicon glyphicon-picture"></span></a></td>
						<td class="center">신림러</td>
						<td class="center">47</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>2</th>
						<td class="center">[함께]</td>
						<td><a href="">한강 사진 공유~[14] <span class="glyphicon glyphicon-picture"></span></a></td>
						<td class="center">프리러너</td>
						<td class="center">21</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>3</th>
						<td class="center">[소통]</td>
						<td><a href="">러닝화 구매 후기[4] <span class="glyphicon glyphicon-picture"></span></a></td>
						<td class="center">하이슈즈</td>
						<td class="center">17</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>4</th>
						<td class="center">[소통]</td>
						<td><a href="">관악산 정상뷰[16] <span class="glyphicon glyphicon-picture"></span></a></td>
						<td class="center">올하이킹</td>
						<td class="center">54</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>5</th>
						<td class="center">[후기]</td>
						<td><a href="">한강 코스에서 공사 진행중이네요;[96]</a></td>
						<td class="center">알림러</td>
						<td class="center">168</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>6</th>
						<td class="center">[소통]</td>
						<td><a href="">집 겨우 도착[0]</a></td>
						<td class="center">히유</td>
						<td class="center">2</td>
						<td class="center">2022.07.25</td>
					</tr>
					
					<tr>
						<th>7</th>
						<td class="center">[소통]</td>
						<td><a href="">강남 산책 코스 등록했어요! 많이 이용해 주세요![5]</a></td>
						<td class="center">직장노예</td>
						<td class="center">33</td>
						<td class="center">2022.07.24</td>
					</tr>
					
					<tr>
						<th>8</th>
						<td class="center">[질문]</td>
						<td><a href="">등산 배낭 공구하실 분??[186]</a></td>
						<td class="center">장비빨</td>
						<td class="center">78</td>
						<td class="center">2022.07.24</td>
					</tr>
					
					<tr>
						<th>9</th>
						<td class="center">[질문]</td>
						<td><a href="">ㅇㅇ빌딩 옆 top1 산책 코스에서 차키 보신 분ㅜㅠ[19]</a></td>
						<td class="center">매직핸드</td>
						<td class="center">34</td>
						<td class="center">2022.07.24</td>
					</tr>
					
					<tr>
						<th>10</th>
						<td class="center">[후기]</td>
						<td><a href="">내일 폭염이라네요ㅜ[2]</a></td>
						<td class="center">날씨예민러</td>
						<td class="center">18</td>
						<td class="center">2022.07.23</td>
					</tr>
				</tbody>
			</table>
		</div><!-- table -->
		
		<!-- 글쓰기 버튼 -->
		<div>
			<button type="submit" id="write">글쓰기</button>
		</div>
		
		<!-- 페이지 -->
		<div id="page">
			<ul class="ul">
				<li class="li"><a href="">◀</a></li>
				<li class="li"><a href="">1</a></li>
				<li class="li"><a href="">2</a></li>
				<li class="li"><a href="">3</a></li>
				<li class="li"><a href="">4</a></li>
				<li class="active li"><a href="">5</a></li>
				<li class="li"><a href="">6</a></li>
				<li class="li"><a href="">7</a></li>
				<li class="li"><a href="">8</a></li>
				<li class="li"><a href="">9</a></li>
				<li class="li"><a href="">10</a></li>
				<li class="li"><a href="">▶</a></li>
			</ul>
		</div><!-- board button -->
		
	</div><!-- wrap -->
	
	<br><br><br><br><br>
	
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