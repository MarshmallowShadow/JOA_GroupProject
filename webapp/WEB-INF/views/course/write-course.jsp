<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 등록</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-write.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-map.css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/course/write-course.js"></script>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a3870909543cc9a79f21eb4b20d2598"></script>
</head>
<body>
<div id="wrap">
	
	<!-- 헤더 -->
	<div id="header">
		<a href="../main/index.html"><img id="logo" src="${pageContext.request.contextPath }/assets/image/main/logo.jpg"></a>
		
		<div id="login">
			<ul>
				<li><a href="">회원가입</a></li>
				<li><a href="">로그인</a></li>
			</ul>
		</div> <!-- login -->
		
		<div id="nav">
			<ul>
				<li><a href="../together/together.html">함깨하기</a></li>
				<li><a href="../board/board.html">게시판</a></li>
				<li><a href="../best/best.html">베스트</a></li>
				<li><a href="../map/map.html">지도</a></li>
			</ul>
		</div> <!-- nav -->
	</div> <!-- header -->
	
	
	
	<!-- content -->
	<div id="content">
		<form id="courseForm" method="get" action="./courseWrite">
			<!-- 타이틀 -->
			<div>
				<h1 id="title">코스 등록하기</h1>
			</div>
			
			<!-- 본문 -->
			
			<!-- 코스 지정 -->
			<div class="course-form">
				<div class="course-select">
					<table>
					
						<colgroup>
							<col width="150px">
							<col width="100%">
						</colgroup>
						
						<tr>
							<th rowspan="3">코스 지정</th>
						</tr>
						
						<!-- 주소검색 -->
						<tr>
							<td>
								<p class="guide">
									<span class="glyphicon glyphicon-info-sign"></span>
									주소를 검색하면 아래에 지도가 표시됩니다.
								</p>
								<div class="address-form">
									<input type="text" name="address">
									<button type="button" id="address-btn">주소검색</button>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<!-- 지도 영역 -->
								<div id="map-wrap">
									<!-- 지도 -->
									<div id="map" style="width:100%; height:500px;"></div>
									
									<!-- 지도 확대, 축소 컨트롤 -->
									<div class="custom_zoomcontrol radius_border"> 
								        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
								        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
								    </div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- course-select -->
				
					<!-- 코스정보 -->
					<div class="course-content">
						<h2>코스 정보</h2>
						
						<table>
						
							<colgroup>
								<col width="150px">
								<col width="100%">
							</colgroup>
							
							<tbody>
							
								<!-- 코스 이름 -->
								<tr>
									<th>코스 이름</th>
									<td><input type="text" class="txt-long"  name="title"></td>
								</tr>
								
								<!-- 종목 -->
								<tr>
									<th>종목</th>
									<td>
										<input type="radio" name="courseCate" id="walk" checked>
										<label for="walk">산책</label>
										
										<input type="radio" name="courseCate" id="jogging">
										<label for="jogging">조깅</label>
										
										<input type="radio" name="courseCate" id="running">
										<label for="running">러닝</label>
										
										<input type="radio" name="courseCate" id="marathon">
										<label for="marathon">마라톤</label>
										
										<input type="radio" name="courseCate" id="bicycle">
										<label for="bicycle">자전거</label>
										
										<input type="radio" name="courseCate" id="draw">
										<label for="draw">그림</label>
										
									</td>
								</tr>
								
								<!-- 거리 -->
								<tr>
									<th>거리</th>
									<td>
										<div>
											<input type="text" class="txt-short" name="distance" value="">
											<p>km</p>
												
										</div>
									</td>
								</tr>
								
								<!-- 예상 시간 -->
								<tr>
									<th>예상 시간</th>
									<td>
										<input type="text" class="txt-short" name="timeH" value="">
										<p>시간</p>
										<input type="text" class="txt-short" name="timeMi" value="">
										<p>분</p>
									</td>
								</tr>
								
								<!-- 예상 난이도 -->
								<tr>
									<th>예상 난이도</th>
									<td>
										<input type="radio" name="difficulty" id="easy" value="easy" checked>
										<label for="easy">쉬움</label>
										
										<input type="radio" name="difficulty" id="normal" value="normal">
										<label for="normal">보통</label>
										
										<input type="radio" name="difficulty" id="hard" value="hard">
										<label for="hard">어려움</label>
									</td>
								</tr>
								
								<!-- 코스 공개여부 -->
								<tr>
									<th>코스 공개여부</th>
									<td>
										<input type="radio" name="openStatus" id="open" value="open" checked>
										<label for="open">공개</label>
										
										<input type="radio" name="openStatus" id="close" value="close">
										<label for="close">비공개</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- course-content -->
					
				</div>
				<!-- course-form -->
			
			
			<!-- 하단 버튼 영역 -->
			<div id="btn-wrap">
				<!-- 사용자 번호 -->
				<input type="hidden" name="userNo" value="1">
				
				<button class="cancel">취소</button>
				<button type="submit" class="add">코스 등록</button>
			</div>
		</form>
	</div>
	<!-- content -->
	
	
	
	<!-- 푸터 -->
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

	</div>
	
</div>
<!-- wrap -->
</body>
</html>