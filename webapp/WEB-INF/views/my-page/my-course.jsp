<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 코스들</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>




</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
		
		
		
		
		
		
		
		
		<div class="subHeader">
			<a href="${pageContext.request.contextPath}/my-page/menu"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></a>
			<p id="title">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></p>
		</div>
		
		
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">나의 코스 보기</p>
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
						  		<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">이건 아닌데...</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따비야 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글4 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">아무개</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글5 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">학원 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
		
	
	</div>
	<!-- //center-content -->



</body>
</html>