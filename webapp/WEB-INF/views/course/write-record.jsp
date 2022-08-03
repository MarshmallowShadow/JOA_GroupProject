<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 작성</title>
<!-- css -->
<link href="../../../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../../assets/css/course-write.css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="../../../assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../assets/js/course/write-record.js"></script>
</head>
<body>
<div id="wrap">

	<!-- 헤더 -->
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
				<li><a href="../together/together.html">함깨하기</a></li>
				<li><a href="../board/board.html">게시판</a></li>
				<li><a href="../best/best.html">베스트</a></li>
				<li><a href="../map/map.html">지도</a></li>
			</ul>
		</div> <!-- nav -->
	</div> <!-- header -->
	
	
	
	
	
	<!-- content -->
	<div id="content">
		
		<!-- 타이틀 -->
		<div>
			<h1 id="title">기록 작성하기</h1>
		</div>
		
		<!-- 코스정보 -->
		<div class="course-form">
		
			<h2>코스 정보</h2>
			
			<table>
				<colgroup>
					<col width="150px">
					<col width="70%">
					<col width="30%">
				</colgroup>
				
				<tr>
					<th>코스</th>
					
					<td>
						<div class="course-info">
							<div>
								<p>코스 제목</p>
								<span>우리집 지름길</span>
							</div>
							
							<div>
								<p>종목</p>
								<span>산책</span>
								
								<!-- 
								<span>조깅</span>
								<span>러닝</span>
								<span>마라톤</span>
								<span>자전거</span>
								<span>그림</span>
								 -->
							</div>
							
							<div>
								<p>거리</p>
								<span>1</span>
								<span>km</span>
								<!-- <p>m</p> -->
							</div>
							
							<div>
								<p>예상 시간</p>
								<span>0</span>
								<span>시간</span>
								<span>30</span>
								<span>분</span>
							</div>
							
							<div>
								<p>예상 난이도</p>
								
								<span>쉬움</span>
								<!-- <span>보통</span>
								<span>어려움</span> -->
							</div>
						</div>
						
					</td>
					
					
					<td>
					
						<!-- 지도 -->
						<div id="map">
							<img src="../../../assets/image/course/map.jpg">
						</div>
					</td>
				</tr>

			</table>
			
		</div>
		
		
		<!-- 기록 정보 -->
		<div class="course-form">
			<h2>기록 정보</h2>
			
			<table>
			
				<colgroup>
					<col width="150px">
					<col width="80%">
					<col width="150px">
					<col width="100%">
				</colgroup>
				
				<!-- 날짜 -->
				<tr>
					<th>날짜</th>
					<td colspan="3">
						<input class="txt-short" type="date">
					</td>
				</tr>
				
				<!-- 날씨, 기온 -->
				<tr>
					<th>날씨</th>
					<td>
						<div class="course-radio">
							<input type="radio" name="weather" id="sun" checked>
							<label for="sun"><img src="../../../assets/image/course/sun.png"></label>
							
							<input type="radio" name="weather" id="moon">
							<label for="moon"><img src="../../../assets/image/course/moon.png"></label>
							
							<input type="radio" name="weather" id="cloud">
							<label for="cloud"><img src="../../../assets/image/course/cloud.png"></label>
							
							<input type="radio" name="weather" id="rain">
							<label for="rain"><img src="../../../assets/image/course/rain.png"></label>
							
							<input type="radio" name="weather" id="snow">
							<label for="snow"><img src="../../../assets/image/course/snow.png"></label>
						</div>
					</td>
					
					<th>기온</th>
					<td>
						<input class="txt-short" type="text">
						<p class="bold">℃</p>
					</td>
				</tr>
				
				
				<!-- 종목 -->
				<tr>
					<th>종목</th>
					<td colspan="3">
						<input type="radio" name="events" id="walk" checked>
						<label for="walk">산책</label>
						
						<input type="radio" name="events" id="jogging">
						<label for="jogging">조깅</label>
						
						<input type="radio" name="events" id="running">
						<label for="running">러닝</label>
						
						<input type="radio" name="events" id="marathon">
						<label for="marathon">마라톤</label>
						
						<input type="radio" name="events" id="bicycle">
						<label for="bicycle">자전거</label>
						
						<input type="radio" name="events" id="draw">
						<label for="draw">그림</label>
					</td>
				</tr>
				
				<!-- 시간 -->
				<tr>
					<th>시간</th>
					<td colspan="3">
						<input type="text" class="txt-short">
						<p>시간</p>
						<input type="text" class="txt-short">
						<p>분</p>
					</td>
				</tr>
				
				<!-- 난이도 -->
				<tr>
					<th>난이도</th>
					<td colspan="3">
						<input type="radio" name="level" id="easy" checked>
						<label for="easy">쉬움</label>
						
						<input type="radio" name="level" id="nomal">
						<label for="nomal">보통</label>
						
						<input type="radio" name="level" id="hard">
						<label for="hard">어려움</label>
					</td>
				</tr>
				
				<!-- 한줄평 -->
				<tr>
					<th>한줄평</th>
					<td colspan="3">
						<input class="txt-long" type="text">
					</td>
				</tr>
				
			</table>
		</div>
		
		<!-- 사진 등록 (드래그앤 드롭) -->
		<div class="course-form">
			<h2>사진 등록</h2>
			
			<div id="drop">
				<div id="thumbnails">
					<div id="course-pic">
						<div id="pic-main">
							<img id="photo-icon" src="../../../assets/image/course/photo.png">
							<p class="pic-txt red">사진을 여기로 드래그 해주세요.</p>
							<p class="pic-txt">코스와 관련된 사진을 등록해주세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 일반 사진 등록
		<div class="course-form">
			<h2>사진 등록</h2>
			
			<div id="course-pic">
				<div>
					<img id="photo-icon" src="../../../assets/image/course/photo.png">
					<p>코스와 관련된 사진을 등록해주세요.</p>
					<label for="input-file">사진 추가하기</label>
					<input type="file" id="input-file">
				</div>
			</div>
		</div> -->
		
		
		<div id="btn-wrap">
			<a href="./view-record.html" class="cancel">취소</a>
			<a href="../my-page/my-report.html" class="add">기록 등록</a>
		</div>
		
	</div>
	
	
	
	
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