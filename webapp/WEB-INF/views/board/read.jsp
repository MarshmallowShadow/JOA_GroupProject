<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/read.css" rel="stylesheet" type="text/css">

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
		
			<div>
				<table>
					<thead>
						<tr>
							<th colspan="3" id="board_title">[소통]도림천 다녀오는 길</th>
						</tr>
						<tr id="top">
							<th id="id">신림러</th>
							<th id="date">2022.07.24</th>
							<th id="up">조회수: 47</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" id="content">
								오늘 도림천 다녀오면서 저번에 같이 달리기했던 깜이님 만났어요!<br>
								그래서 같이 마트도 다녀왔어요~~~~~<br>
								오늘 날씨 너무 덥고 힘들고 심심했는데 무척 재미있었어요!<br>
								다음에 같이 또 달리는 날이 있으면 좋겠네요!
							</td>
						</tr>
						<tr>
							<td>
								<!-- 
								<div class="course-container" onclick="window.location='../course/c_viewform.html';">
									<div class="course-icon"><img src="${pageContext.request.contextPath}/assets/image/map/map-icon.jpg"></div>
									<div class="course-info">
										<h3 class="course-title">헬 ^^</h3>
										<p class="p-info">
											작성자: 쿵야 <br>
											거리: 5.0km <br>
											시간: 40분
										</p>
										<div class="tag-blue"><p>런닝</p></div>
										<div class="tag-pink"><p>어려움</p></div>
									</div>
								</div>
								 -->
								
								<div class="chart">
									<table id="together_chart">
										<thead>
											<tr class="top">
												<th class="line_top">2022/07/24 - 2022/07/30</th>
												<th class="mark">
													<button class="bookmark">
														<img id="image" src="${pageContext.request.contextPath}/assets/image/together/bookmarks_black.png">
													</button>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th colspan="2" class="content">쭈쭈네 동네 한바퀴</th>
											</tr>
											<tr>
												<th colspan="2" class="content_course"><span class="glyphicon glyphicon-map-marker" class="marking"></span>신림 - 잠실</th>
											</tr>
											<tr>
												<th colspan="2" class="line_bottom">
													산책
													<button type="submit" class="join"><span class="glyphicon glyphicon-user" id="join_icon"></span>11/15</button>
												</th>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<img class="image" src="${pageContext.request.contextPath}/assets/image/board/window.jpg">
								<img class="image" src="${pageContext.request.contextPath}/assets/image/board/flower.jpg">
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- table -->
			
			<br>
			
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
					
					<input type="text" id="replybox"><button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
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