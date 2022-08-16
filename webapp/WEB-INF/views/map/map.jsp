<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>코스 탐색</title>
	
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/map.css">
</head>
<body>
<div id="wrap">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	
	<div id="sub-header">
		<div id="searchbar">
			<span class="glyphicon glyphicon-search"></span>
			<input id="search-input" type="text">
			<button id="btn-loc" class="btn-blue">지역</button>
			<button id="btn-title" class="btn-grey">제목</button>
		</div> <!-- searchbar -->
		<div id="filter-menu">
			<div id="filter-cate">
				<button type="button" id="btn-cate" class="fmenu-btn">
					종목
					<span id="icon-cate" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
				<div id="menu-cate" class="filter-menu">
					<h3>종목</h3>
					<p>중복선택이 가능합니다<p>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">산책</div>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">조깅</div>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">런닝</div>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">마라톤</div>
					<hr>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">자전거</div>
					<hr>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">그림그리기</div>
				</div>
			</div>
			
			<div id="filter-dist">
				<button type="button" id="btn-dist" class="fmenu-btn">
					코스길이
					<span id="icon-dist" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
			</div>
			
			<div id="filter-diff">
				<button type="button" id="btn-diff" class="fmenu-btn">
					난이도
					<span id="icon-diff" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
				<div id="menu-diff" class="filter-menu">
					<h3>난이도</h3>
					<p>중복선택이 가능합니다<p>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">쉬움</div>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">보통</div>
					<div class="menu-option"><img src="${pageContext.request.contextPath }/assets/image/map/check_off.png">어려움</div>
				</div>
			</div>
		</div> <!-- filter-menu -->
		<div id="filter-buttons">
			
		</div> <!-- filter-buttons -->
	</div> <!-- sub-header -->
	
	<div id="content">
		<div id="result-list">
			<ul>
				<li>
					<c:import url="/WEB-INF/views/includes/course-container.jsp"></c:import>
				</li>
				<li>
					<c:import url="/WEB-INF/views/includes/course-container.jsp"></c:import>
				</li>
				<li>
					<c:import url="/WEB-INF/views/includes/course-container.jsp"></c:import>
				</li>
				<li>
					<c:import url="/WEB-INF/views/includes/course-container.jsp"></c:import>
				</li>
			</ul>
		</div> <!-- result-mask -->
		<div id="map-info">
		</div> <!-- map-info -->
	</div><!-- content -->
</div> <!-- wrap -->
</body>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/map/map.js"></script>

</html>