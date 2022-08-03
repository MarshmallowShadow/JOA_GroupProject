<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스기록 상세보기</title>
<!-- css -->
<link href="../../../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../../assets/css/course-view.css">
<link href="../../../assets/css/lightbox.css" rel="stylesheet" />

<!-- 자바스크립트 -->
<script type="text/javascript" src="../../../assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../assets/js/course/view-record.js"></script>
<!-- lightbox -->
<script src="../../../assets/js/course/lightbox.js"></script>
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
	
		<div id="view-content">
			
			<!-- 지도 영역 -->
			<div id="map">
				<!-- 지도 -->
				<img src="../../../assets/image/course/map.jpg" width="100%">
			</div>
			
			
			<!-- 글 영역 -->
			<div class="course-view">
				<!-- 상단 탭 -->
				<div class="course-view-tap">
					<ul>
						<li>
							<a href="./view-course.html" class="tabbtn">코스정보</a>
						</li>
						<li>
							<a href="./view-record.html" class="tabbtn  selected">기록보기</a>
						</li>
					</ul>
				</div>
				
				<!-- 코스 정보 -->
				<div class="course-view-info">
					
					<!-- 리스트 필터 -->
					<div class="record-filter">
						<input type="radio" name="record-filter" id="all" checked>
						<label for="all">전체</label>
						
						<input type="radio" name="record-filter" id="myrecord">
						<label for="myrecord">내가 쓴 기록</label>
					</div>
					
					
					<!-- 기록 리스트 -->
					<div class="record-info-content">
						<ul>
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="bold"><img src="../../../assets/image/course/footprint.png" width="12px">박깜이</span>
												<span>즐겁게 뛰었던 코스~즐겁게 뛰었던 코스~즐겁게 뛰었던 코스~즐겁게 뛰었던 코스~</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/sun.png"></span>
											<span>20℃</span>
											<span class="box blue">산책</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										<!-- lightbox: 이미지 모달, data-lightbox의 이름을 똑같이 하면 이미지 세트로 묶임 -->
										<a href="../../../assets/image/course/img2.jpg" data-lightbox="image-1">
											<img class="recordImg" src="../../../assets/image/course/img2.jpg" width="24px">
										</a>
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="bold">김쭈쭈</span>
												<span>링거 맞고 뛰었어요</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/cloud.png"></span>
											<span>20℃</span>
											<span class="box blue">러닝</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										<a href="../../../assets/image/course/img1.jpg" data-lightbox="image-1">
											<img class="recordImg" src="../../../assets/image/course/img1.jpg" width="24px">
										</a>
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="bold">김쭌이</span>
												<span>랄라라</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/moon.png"></span>
											<span>20℃</span>
											<span class="box blue">마라톤</span>
											<span class="box pink">쉬움</span>
										</div>
									</div>
									
									<div class="record-img">
										<!-- <img class="recordImg" src="../../../assets/image/course/img.jpg" width="24px"> -->
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="name bold"><img src="../../../assets/image/course/footprint.png" width="12px">박깜이</span>
												<span>즐겁게 뛰었던 코스~</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/rain.png"></span>
											<span>20℃</span>
											<span class="box blue">산책</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										<!-- <img class="recordImg" src="../../../assets/image/course/img.jpg" width="24px"> -->
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="name bold">우영우</span>
												<span>이 사건은 재미있습니다. 제가 좋아하는 고래 퀴즈 같아요. 몸무게가 22톤인 암컷 향고래가 500kg에 달하는 대왕오징어를 먹고 6시간 뒤 1.3톤짜리 알을 낳았다면 이 암컷 향고래의 몸무게는 얼마일까요? 정답은 ‘고래는 알을 낳을 수 없다’입니다. 고래는 포유류라 알이 아닌 새끼를 낳으니까요. 무게에만 초점을 맞추면 문제를 풀 수 없습니다. 핵심을 봐야 돼요.</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/snow.png"></span>
											<span>20℃</span>
											<span class="box blue">산책</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										<img class="recordImg" src="../../../assets/image/course/img3.jpg" width="24px">
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="name bold">우영우</span>
												<span>이 사건은 재미있습니다. 제가 좋아하는 고래 퀴즈 같아요. 몸무게가 22톤인 암컷 향고래가 500kg에 달하는 대왕오징어를 먹고 6시간 뒤 1.3톤짜리 알을 낳았다면 이 암컷 향고래의 몸무게는 얼마일까요? 정답은 ‘고래는 알을 낳을 수 없다’입니다. 고래는 포유류라 알이 아닌 새끼를 낳으니까요. 무게에만 초점을 맞추면 문제를 풀 수 없습니다. 핵심을 봐야 돼요.</span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span><img src="../../../assets/image/course/snow.png"></span>
											<span>20℃</span>
											<span class="box blue">산책</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										<img class="recordImg" src="../../../assets/image/course/img3.jpg" width="24px">
									</div>
								</div>
							</li>
							
							<li>
								<div class="record-full-content">
									<div class="record-txt">
										<div class="record-content">
											<span class="record">
												<span class="bold"><img src="../../../assets/image/course/footprint.png" width="12px">박깜이</span>
												<span></span>
											</span>
										</div>
										<div class="record-info">
											<span>22.07.18 10:03</span>
											<span></span>
											<span></span>
											<span class="box blue">산책</span>
											<span class="box pink">어려움</span>
										</div>
									</div>
									
									<div class="record-img">
										
									</div>
								</div>
							</li>
						</ul>
					</div>
					
					
					<!-- 하단 버튼 영역 -->
					<div id="course-info-btn">
						<a href="./write-record.html" class="link-btn">기록 작성하기</a>
						<a class="like-btn">
							<img src="../../../assets/image/main/heart-off.png">
							<span>0</span>
						</a>
					</div>
				</div>
			</div>
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
	

	
	
	
</body>
</html>