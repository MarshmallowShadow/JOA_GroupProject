<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best</title>

<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/best.css" rel="stylesheet" type="text/css">

</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!------------------- header --------------------->

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
			<div class="img-total">

				<!-- Top 1~3 게시물(15개 반복) -->
				<c:forEach items="${bList}" var="map" varStatus="status">

					<!-- 왕관 이미지 -->
					<c:choose>
						<c:when test="${status.index == 0}">
							<div class="img-1">
								<p>Top 1 <img src="${pageContext.request.contextPath }/assets/image/best/cgold.jpg" />
								</p>
								<p>Top 2 <img src="${pageContext.request.contextPath }/assets/image/best/csilver.jpg" />
								</p>
								<p>Top 3 <img src="${pageContext.request.contextPath }/assets/image/best/cbronze.jpg" />
								</p>
							</div>
							<br> <br> <br>
						</c:when>

						<c:when test="${status.index == 3}">
						<hr id="hr">
							<div class="img-line">
								<p id="img-line-p"><span id="img-line-span">ε♡з</span> Top 4 ~ 6</p>
							</div>
							<br> <br> <br>
						</c:when>

						<c:when test="${status.index == 6}">
						<hr id="hr">
							<div class="img-line">
								<p id="img-line-p"><span id="img-line-span">ε♡з</span> Top 7 ~ 9</p>
							</div>
							<br> <br> <br>
						</c:when>

						<c:when test="${status.index == 9}">
						<hr id="hr">
							<div class="img-line">
								<p id="img-line-p"><span id="img-line-span">ε♡з</span> Top 10 ~ 12</p>
							</div>
							<br> <br> <br>
						</c:when>

						<c:when test="${status.index == 12}">
						<hr id="hr">
							<div class="img-line">
								<p id="img-line-p"><span id="img-line-span">ε♡з</span> Top 13 ~ 15</p>
							</div>
							<br> <br> <br>
						</c:when>
					</c:choose>


					<div class="img-line">
						<div class="img-list">
							<a href="">
							<c:choose>
								<c:when test="${map.FILE_PATH == null}">
									<img src="${pageContext.request.contextPath}/assets/image/best/sw1.jpg" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/${map.FILE_PATH}"/>
								</c:otherwise>
							</c:choose>
							</a>
								<span id="best-text"> 지역 : <span>${map.LOCATION}</span> | 거리 : <span>${map.DISTANCE}</span> km</span>
							
							<!-- 기록/좋아요/즐찾 -->
								<div class="button-ttl">
									<span class="bi bi-calendar4-week"></span>
									<span class="imgbutton-text">${map.R_COUNT}</span>
									<div class="imgbutton">
										<img src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<span>좋아요 : ${map.L_COUNT}</span> 
										<img src="${pageContext.request.contextPath}/assets/image/main/star.png">
										<span>즐겨찾기 : ${map.F_COUNT}</span>
									</div>
								</div>
								
							<!-- 기록 3개 반복문 -->
							<div class="comment-text">
								<c:forEach items="${map.RECORDLIST}" var="review">
									<div class="comment-text1">${review}</div>
								</c:forEach>

							</div>
							<!-- 기록 3개 반복문 끝/ class="comment-text" -->
						</div>
					</div>
				</c:forEach>
			</div>
			<hr id="hr">
		</div>
	</div>

	<!------------------------ footer ------------------------>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</html>