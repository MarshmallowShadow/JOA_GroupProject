<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 기록들</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/my-page.js"></script>



</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<div id="header">
			<img id="logo" src="${pageContext.request.contextPath}/assets/image/main/logo.jpg">
			
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
			<a href="${pageContext.request.contextPath}/my-page/menu"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></a>
			<p id="title">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></p>
		</div>
		
		
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">나의 기록 보기</p>
				<div class="myReport">
					<div id="calendar">
						<div id="dateForm">
							<p id="calDate">2022년 3월</p>
							<input id="dateSearch" type="date">
						</div>
						<div id="calAPI">달력API</div>
					</div>
				
					
					<div id="reportList">
						<div class="listTitle">
							<p class="monthReport">이달의 기록</p>
							<p class="todayReport">오늘의 기록</p>
						</div>
						<ul class="reportBox">	
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">내가 여기 왔다감ㅋ</p>
									<p class="content">링거 맞고 뛰었다^^</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">우앙우앙우앙</p>
									<p class="content">우앙우앙우앙^^</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">산책 재밌다</p>
									<p class="content">산책 다녀왔는데 좋았네</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">무더위</p>
									<p class="content">요즘 날씨 미친거 같다</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">살려줘ㅠㅠ</p>
									<p class="content">html/css너무 귀찮다ㅠㅠ</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		<!-- 메인 푸터  자리-->
		
	
	</div>
	<!-- //center-content -->



</body>
</html>