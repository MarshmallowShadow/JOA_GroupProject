<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA Main</title>

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet"  type="text/css">

</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!--메인 해더 자리 -->

<!------------------------- photo slider ------------------------>
	<div class="slide slide_wrap">
			<div class="slide_item item1"><img src="${pageContext.request.contextPath }/assets/image/main/swiss.jpg">
			</div>
			<div class="slide_item item2"><img src="${pageContext.request.contextPath }/assets/image/main/paris.jpg">
			</div>
			<div class="slide_item item3"><img src="${pageContext.request.contextPath }/assets/image/main/parispark.jpg">
			</div>
			<div class="slide_item item4"><img src="${pageContext.request.contextPath }/assets/image/main/busan.jpg">
			</div>

		<div class="slide_prev_button slide_button">◀</div>
		<div class="slide_next_button slide_button">▶</div>
		<ul class="slide_pagination"></ul>
	</div>
	
		<!------------------------- 글귀 ------------------------>
<div id="wrap">
		<div class="main-text">
			<p>살아 숨쉬는 자연에서 <br><br><br> 운동을 시작하다.
			</p>
			<br> <br> <br>
			<p>
				<span>J<marquee width="35px" height="15px" scrolldelay="400" direction="up">oyful</marquee> O<marquee width="45px" height="15px" scrolldelay="400" direction="up">utdoor</marquee> A<marquee width="40px" height="15px" scrolldelay="400" direction="up">ctivity</marquee></span>
			</p>
		</div>
</div>

<!------------------------ footer ------------------------>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main/main.js"></script>

</html>