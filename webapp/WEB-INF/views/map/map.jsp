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
	<form id="search-form">
		<div id="searchbar">
			<span class="glyphicon glyphicon-search"></span>
			<input id="search-input" type="text" name="keyword">
			<label for="rdo-loc" id="btn-loc" class="btn-blue">지역</label>
			<label for="rdo-title" id="btn-title" class="btn-grey">제목</label>
			<input type="radio" id="rdo-loc" name="searchCate" value="location">
			<input type="radio" id="rdo-title" name="searchCate" value="title">
		</div> <!-- searchbar -->
		<div id="filter-menu">
			<div id="filter-cate">
				<button type="button" id="btn-cate" class="fmenu-btn">
					종목
					<span id="icon-cate" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
				<div id="menu-cate" class="filter-menu" tabindex='-1'>
					<h3>종목</h3>
					<p>중복선택이 가능합니다</p>
					<label for="chk-walk" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">산책
						<input type="checkbox" class="menu-chk" id="chk-walk" name="courseCategory" value="walk">
					</label>
					<label for="chk-jogging" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">조깅
						<input type="checkbox" class="menu-chk" id="chk-jogging" name="courseCategory" value="jogging">
					</label>
					<label for="chk-running" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">런닝
						<input type="checkbox" class="menu-chk" id="chk-running" name="courseCategory" value="running">
					</label>
					<label for="chk-marathon" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">마라톤
						<input type="checkbox" class="menu-chk" id="chk-marathon" name="courseCategory" value="marathon">
					</label>
					<hr>
					<label for="chk-bicycle" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">자전거
						<input type="checkbox" class="menu-chk" id="chk-bicycle" name="courseCategory" value="bicycle">
					</label>
					<hr>
					<label for="chk-draw" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">그림그리기
						<input type="checkbox" class="menu-chk" id="chk-draw" name="courseCategory" value="draw">
					</label>
				</div>
			</div> <!-- filter-cate -->
			
			<div id="filter-dist">
				<button type="button" id="btn-dist" class="fmenu-btn">
					코스길이
					<span id="icon-dist" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
			</div> <!-- filter-dist -->
			
			<div id="filter-diff">
				<button type="button" id="btn-diff" class="fmenu-btn">
					난이도
					<span id="icon-diff" class="glyphicon glyphicon-menu-down"></span>
				</button>
				
				<div id="menu-diff" class="filter-menu" tabindex='-1'>
					<h3>난이도</h3>
					<p>중복선택이 가능합니다</p>
					<label for="chk-easy" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">쉬움
						<input type="checkbox" class="menu-chk" id="chk-easy" name="difficulty" value="easy">
					</label>
					<label for="chk-normal" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">보통
						<input type="checkbox" class="menu-chk" id="chk-normal" name="difficulty" value="normal">
					</label>
					<label for="chk-hard" class="menu-option">
						<img src="${pageContext.request.contextPath }/assets/image/map/check_on.png">어려움
						<input type="checkbox" class="menu-chk" id="chk-hard" name="difficulty" value="hard">
					</label>
				</div>
			</div><!-- filter-diff -->
		</div> <!-- filter-menu -->
		<div id="filter-buttons">
			
		</div> <!-- filter-buttons -->
	</form>
	</div> <!-- sub-header -->
	
	<div id="content">
		<div id="result-list">
			
		</div> <!-- result-list -->
		<div id="map-info"></div> <!-- map-info -->
	</div><!-- content -->
</div> <!-- wrap -->
</body>

<!-- js -->
<script type="text/javascript">
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/map/map.js"></script>

</html>