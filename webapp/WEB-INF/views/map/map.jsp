<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>코스 탐색</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/map.css">
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f9735f43a150536e030654b347315fc"></script> -->
</head>
<body>
<div id="wrap">
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	
	<div id="sub-header">
		<div id="searchbar">
			<img class="search-icon" src="${pageContext.request.contextPath }/assets/image/map/search.png">
			<input id="search-input" type="text">
			<button class="btn-blue">지역</button>
			<button class="btn-grey">제목</button>
		</div> <!-- searchbar -->
		<div id="filter-menu">
			<button class="fmenu">종목 <img class="down-icon" src="${pageContext.request.contextPath }/assets/image/map/down.png"></button>
			<button class="fmenu">코스길이 <img class="down-icon" src="${pageContext.request.contextPath }/assets/image/map/down.png"></button>
			<button class="fmenu">난이도<img class="down-icon" src="${pageContext.request.contextPath }/assets/image/map/down.png"></button>
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
		<div id="map">
			<img src="${pageContext.request.contextPath }/assets/image/map/map-sample.jpg">
		</div> <!-- map -->
	</div><!-- content -->
</div> <!-- wrap -->
</body>
</html>