<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하기 상세페이지</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/together_read.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/course/view-course.js"></script>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<a href="../main/index.html"><img id="logo" src="../../../assets/image/main/logo.jpg"></a>
			
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
	
		<h1>함께하기</h1>
		
		<!-- 제목과 작성일 -->
		<div>
			<p id="title">쭈쭈네 동네 한바퀴</p>
			<p id="date">2022/07/24 - 2022/07/29</p>
		</div>
		
		<!-- 상세지도 -->
		<div id="map_sample">
			<img class="map" src="../../../assets/image/map/map-sample.jpg"><!-- a링크 걸어서 상세지도 연결 -->
		</div>
		
		<!-- 상세정보 -->
		<div>
			<table>
				<thead>
					<tr>
						<th>
							<img id="marking" src="../../../assets/image/together/marking.png">
							<div id="route">신림 - 잠실</div>
						</th>
						<th>
							<img id="map_icon" src="../../../assets/image/together/map.png">
							<div id="location">신림역 7번 출구</div>
						</th>
						<th>
							<img id="calendar" src="../../../assets/image/together/calendar.png">
							<div id="d-date">2022.07.31 12:45pm</div>
						</th>
					</tr>
					<tr>
						<th>
							<img id="stopwatch" src="../../../assets/image/together/stopwatch.png">
							<div id="distance">7.8km</div>
						</th>
						<th colspan="2">
							<img id="user" src="../../../assets/image/together/user.png">
							<div id="user_num">10/15명</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="3" id="content">
							다같이 마라톤 같이 뛰었으면 좋겠어요~ 당일 덥다고 일기예보가 떠서 각자 마실 물과 땀수건을 챙겨 오셨으면 해요~!<br>
							점심도 같이 먹고 갔으면 해서 각자 점심값도 같이 준비 부탁드려요!<br><br>
							ps.무조건 러닝화 신고 오세요. 장거리이기 때문에 발이 붓고 다리가 많이 아플 수 있습니다.<br>
							&nbsp &nbsp 러닝화가 없으시면 참가 거부하겠습니다.
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- 테이블 -->
		
		<!-- 수정, 삭제 버튼 -->
		<div id="writer_btnM">
			<button type="submit" id="modify_m">수정</button>
			<button type="submit" id="delete_m">삭제</button>
		</div><!-- writer_btn -->
		
		<!-- 댓글 -->
		<div>
			<p id="top_comment">댓글</p>
			<div id="commentbox">
				<p class="id">히유</p>
				<p class="comment">-저도 오늘 나갔다가 놀랐어요~</p>
				<p class="id">쭌</p>
				<p id="comment_">-</p><p id="bold">@깜이</p><p class="comment">나도 부르지 그랬어~</p>
				<p class="id">깜이</p>
				<p id="comment_btn">-망고 샀어ㅎㅎ</p>
				<!-- 수정, 삭제 버튼 -->
				<div id="writer_btnS">
					<button type="submit" id="modify_s">수정</button>
					<button type="submit" id="delete_s">삭제</button>
				</div><!-- writer_btn -->
				<p class="REcomment">&nbsp &nbsp ㄴ쭌:망고 얼마야?</p>
				<p id="REcomment_btn">&nbsp &nbsp ㄴ깜이:할인해서 만원</p>
				<!-- 수정, 삭제 버튼 -->
				<div id="writer_btnXS">
					<button type="submit" id="modify_xs">수정</button>
					<button type="submit" id="delete_xs">삭제</button>
				</div><!-- writer_btn -->
				<p id="REcomment_bottom">&nbsp &nbsp ㄴ쭈쭈:나는 두개 샀어!</p>
			</div><!-- commentbox -->
		</div><!-- 댓글 -->

		<button type="submit" id="list">목록</button>
		
		<br><br><br><br><br><br><br><br><br><br>
		
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
	
	</div><!-- wrap -->

</body>
</html>