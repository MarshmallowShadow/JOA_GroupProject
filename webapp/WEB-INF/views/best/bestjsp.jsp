<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best</title>

<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="../../../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../../../assets/css/bestplus.css" rel="stylesheet"  type="text/css">

<!-- jquery -->


</head>
<body>

	<div id="header">
		<a href="../main/index.html"><img id="logo" src="../../../assets/image/main/logo.jpg"></a>

		<div id="login">
			<ul>
				<li><a href="">회원가입</a></li>
				<li><a href="">로그인</a></li>
			</ul>
		</div>
		<!-- login -->

		<div id="nav">
			<ul>
				<li><a href="../together/together.html">함께하기</a></li>
				<li><a href="../board/board.html">게시판</a></li>
				<li><a href="../best/best.html">베스트</a></li>
				<li><a href="../map/map.html">지도</a></li>
			</ul>
		</div>
		<!-- nav -->
	</div>
<!---------------------------------------- header --------------------------------------->

<div id="wrap">
	<div class="content"> 	
		<h1>Best</h1>

		<!-- main list -->
		<table border="1">
			<tr>
				<td onclick="window.location='';">좋아요</td>
				<td onclick="window.location='';">즐겨찾기</td>
				<td onclick="window.location='';">기록별</td>
			</tr>
		</table>

		<!-- 종목테그 -->
		<div class="best-mini-list">
			<p>총(개) : 15</p>

			<ul>
				<li><a href=""><span>산책</span> | </a></li>
				<li><a href=""><span>조깅</span> | </a></li>
				<li><a href=""><span>런닝</span> | </a></li>
				<li><a href=""><span>마라톤</span> | </a></li>
				<li><a href=""><span>자전거</span> | </a></li>
				<li><a href=""><span>뛰기</span> | </a></li>
				<li><a href=""><span>그림그리기</span> </a></li>
			</ul>
		</div>

		<hr id="hr">


		<!-- Top1~3 -->
		<div class="img-total">

			<!-- 왕관 이미지 -->
			<div class="img-1">		
				<p>Top 1 <img src="../../../assets/image/best/cgold.jpg" /></p>
				<p>Top 2 <img src="../../../assets/image/best/csilver.jpg" /></p>
				<p>Top 3 <img src="../../../assets/image/best/cbronze.jpg" /></p>
			</div>

			<br> <br> <br>
			
			<!-- Top 1~3 게시물 -->
			<div class="img-line">
				<div class="img-list">
					<a href=""> <img src="../../../assets/image/best/sw1.jpg" />
						<span id="best-text"> 지역 : <span>서울</span> | 거리 : <span>1km</span> <span id="new">🅽</span></span></a>

						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<span class="bi bi-calendar4-week"></span> <span class="imgbutton-text"> 3개</span>
								
								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>103개</span> 
									<img src="../../../assets/image/main/star.png"><span>10개</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>103개</span> 
									<img src="../../../assets/image/main/star.png"><span>10개</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>103개</span> 
									<img src="../../../assets/image/main/star.png"><span>10개</span>
								</div>
							</div>
						</div>
					</div>
			
			</div>
		</div>
		<!-- //Top 1~3 게시물// -->
		<br> <br> <br>

		<hr id="hr">

		<!-- Top 4~6 -->
			<div class="img-total2">
				<div class="img-line">
					<p><span>ε♡з</span> Top 4 ~ 6</p>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>서울</span> | 거리 : <span>1km</span></span></a>

						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
						
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/poo613.jpg" />
							<span id="best-text"> 지역 : <span>인천</span> | 거리 : <span>1km</span></span></a>
						
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr id="hr">
		
		<!-- Top 7~9 -->
		<div class="img-total2">
			<div class="img-line">
				<p> <span>ε♡з</span> Top 7 ~ 9</p>
			
					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>			
			</div>
		</div>
		<hr id="hr">
				
		<!-- Top 10~12 -->		
		<div class="img-total2">
			<div class="img-line">
				<p> <span>ε♡з</span> Top 10 ~ 12</p>
			
					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>	
		<hr id="hr">
		
		<!-- Top 13~15 -->		
		<div class="img-total2">
			<div class="img-line">
				<p> <span>ε♡з</span> Top 13 ~ 15</p>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/map.jpg" />
							<span id="best-text"> 지역 : <span>부산</span> | 거리 : <span>1km</span></span></a>
					
						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>

					<div class="img-list">
						<a href=""> <img src="../../../assets/image/best/poo613.jpg" />
							<span id="best-text"> 지역 : <span>인천</span> | 거리 : <span>1km</span></span></a>

						<div class="comment-text">
							<div class="comment-text1">私の名前はウヨンウです</div>
							<div class="comment-text1">댓글이오</div>
							<div class="comment-text1">와타시노 나마에와 우투더여응투더우!</div>
							<br>

							<div class="button-ttl">
								<input type="button" id="cbutton" name="button" value="후기 : 3개">

								<div class="imgbutton">
									<img src="../../../assets/image/main/heart.png"><span>좋아요 : 103개</span> 
									<img src="../../../assets/image/main/star.png"><span>즐겨찾기 : 10개</span>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>		
	</div>			
				
</div>				
		<!------------------ footer -------------------->
		<div class="footer">
			<div class="footer-text">
				<p>주식회사 조아</p>
				<p>대표 : 최보승</p>
				<p>사업자 번호 : 123-456-789</p>
				<p>서울특별시 관악구 봉천동 862 - 1</p>
				<br>
				<p>고객센터 | 평일 9 : 30 ~ 18 : 30, 점심시간 : 12 : 00 ~ 13 : 00 (토, 일요일, 공휴일 휴무)</p>
				<p>Tel. 02 - 1111 - 1111</p>
				<p>Fax. 02 - 1111 - 1111</p>
				<p>Email. joa@joa.co.kr</p>
			</div>
			<br>
			<div class="footer-btn">
				<button id="footerbtn" type="button">자주묻는 질문</button>
				<button id="footerbtn" type="button">1:1 문의</button>
			</div>
			<br>
			<hr class="my-hr1">
			<p id="footer-Copyright">JOA, Inc. All rights reserved.</p>

		</div>
		<!-- /footer -->			
			
			
	

</body>
</html>