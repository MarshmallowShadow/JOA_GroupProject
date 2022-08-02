<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>

<!-- CSS -->
<link rel="stylesheet" href="../../../assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../../../assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="../../../assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../assets/js/my-page/my-page.js"></script>



</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<div id="header">
			<img id="logo" src="../../../assets/image/main/logo.jpg">
			
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
		
		
		<div class="subHeader">
			<a href="./menubar.html"><img class="menuBar-open" src="../../../assets/image/my-page/menu.png"></a>
			<p id="title">마이페이지 <img class="myHome" src="../../../assets/image/my-page/house.png"></p>
		</div>
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		
		
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">최근 조회한 코스들</p>
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스 &nbsp;<img class="besticon" src="../../../assets/image/best/cgold.jpg"></p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">우히히</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">빙수 먹으러 가는 길 &nbsp;<img class="besticon" src="../../../assets/image/best/csilver.jpg"></p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글4 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가는 길 &nbsp;<img class="besticon" src="../../../assets/image/best/cbronze.jpg"></p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글5 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">이건 아니잖아</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글2 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">영화보러 가</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글3 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">떡볶이 먹고 싶다</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가는 길</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">아무도 없는 거리</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart-off.png">
										<img class="like-bookmark" src="../../../assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					
				</ol>
			</div>
			
			
			<div class="resultList">
				<p id="listTitle">좋아요 한 코스들</p>
				
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">오호</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">가자가자</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글4 &nbsp;<img class="newpost" src="../../../assets/image/main/new.png"></p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="../../../assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가자</p>
									<div class="img-icons">
										<img class="like-bookmark" src="../../../assets/image/main/heart.png">
										<img class="like-bookmark" src="../../../assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					
					
				</ol>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		<!-- 메인 푸터  자리-->
		
	
	</div>
	<!-- //center-content -->



</body>
</html>