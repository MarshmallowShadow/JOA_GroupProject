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