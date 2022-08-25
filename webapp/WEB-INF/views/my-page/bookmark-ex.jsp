<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기1</title>

<!-- favicon.ico 404에러 해결 -->
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">


<!-- jquery -->
<script type="text/javascript">
	window.cateNo = '${param.cateNo}';
	window.userNo = '${authUser.userNo}';
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/mypage.js"></script>



</head>
<body>

<!-- 헤더자리 -->
<div id="header">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
</div>
<!-- 헤더자리 -->	

<!-- 마이페이지 메뉴바 자리 -->
<div id="menuBar" class="w3-container w3-center w3-animate-left">
	<c:import url="/WEB-INF/views/my-page/menu.jsp"></c:import>
</div>


<div id="wrap">
	
	<!-- content -->
	<div id="content">
		
		
		<div class="subHeader">
			<img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
			<p id="title">즐겨찾기 
				<img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/star.png">
			</p>
		</div>
		
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle" class="my-fav-cate-list-title"><%-- ${fcMap.CATENAME} --%></p>
				
				<ol class="my-fav-cate-list-box">
					<%-- 
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">화이티이잉</p>
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
		</div>
	</div>
	<!-- //center-content -->
</div>
<!-- wrap -->
	<!-- 메인 푸터  자리-->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->




</body>
</html>