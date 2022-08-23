<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>

<!-- favicon.ico 404에러 해결 -->
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">


<!-- jquery -->
<script type="text/javascript">
	window.userNo = '${authUser.userNo}';
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/mypage.js"></script>



</head>
<body>

<div id="wrap">
	<!-- 헤더자리 -->
	<div id="header">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	</div>
	<!-- 헤더자리 -->	
	
	<!-- content -->
	<div id="content">
		
		<!-- 마이페이지 메뉴바 자리 -->
			<div id="menuBar">
				<c:import url="/WEB-INF/views/my-page/menu.jsp"></c:import>
			</div>
		
		
		<div class="subHeader">
			<img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
			<p id="title">마이페이지 
				<img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png">
			</p>
		</div>
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">최근 조회한 코스들</p>
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스 &nbsp;<img class="besticon" src="${pageContext.request.contextPath}/assets/image/best/cgold.jpg"></p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<%-- <li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">우히히</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
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
									<p id="courseName">빙수 먹으러 가는 길 &nbsp;<img class="besticon" src="${pageContext.request.contextPath}/assets/image/best/csilver.jpg"></p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
									<p id="courseName">집에 가는 길 &nbsp;<img class="besticon" src="${pageContext.request.contextPath}/assets/image/best/cbronze.jpg"></p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
									<p id="courseName">이건 아니잖아</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글2 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">영화보러 가</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글3 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">떡볶이 먹고 싶다</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가는 길</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">아무도 없는 거리</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
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
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li> --%>
					
				</ol>
			</div>
			
			
			<div class="resultList">
				<p id="listTitle">좋아요 한 코스들</p>
				
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<%-- <li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">오호</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
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
									<p id="courseName">가자가자</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
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
									<p id="courseName">집에 가자</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star-off.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li> --%>
				</ol>
			</div>
		</div>
	</div>
	<!-- //center-content -->
</div>
<!-- wrap -->
	
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	






</body>
</html>