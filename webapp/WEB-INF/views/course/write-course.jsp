<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 등록</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-write.css">

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/course/write-course.js"></script>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8&libraries=services"></script>
</head>
<body>
<div id="wrap">
	
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- 헤더 -->
	
	
	
	<!-- content -->
	<div id="content">
		
		<!-- 타이틀 -->
		<div>
			<h1 id="title">코스 등록하기</h1>
		</div>
		
		<!-- 본문 -->
		
		<!-- 코스 지정 -->
		<div class="course-form">
			<div class="course-select">
				<table>
				
					<colgroup>
						<col width="150px">
						<col width="100%">
					</colgroup>
					
					<tr>
						<th rowspan="3">코스 지정</th>
					</tr>
					
					<!-- 주소검색 -->
					<tr>
						<td>
							<p class="guide">
								<span class="glyphicon glyphicon-info-sign"></span>
								위치 키워드를 입력하면 아래에 지도가 표시됩니다.
							</p>
							<div class="address-form">
								<input type="text" name="address" value="">
								<button type="button" id="address-btn">위치검색</button>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<p class="map-guide">지도를 마우스로 클릭하면 선 그리기가 시작되고, 오른쪽 마우스를 클릭하면 선 그리기가 종료됩니다</p>
							<!-- 지도 영역 -->
							<div id="map"></div>
								
							<%-- <img src="${pageContext.request.contextPath }/assets/image/course/map.jpg"> --%>
						</td>
					</tr>
				</table>
			</div>
			<!-- course-select -->
			
			<form id="courseForm" method="get" action="./courseWrite">
				<!-- 코스정보 -->
				<div class="course-content">
					<h2>코스 정보</h2>
					
					<div id="point">
					</div>
					
					<table>
					
						<colgroup>
							<col width="150px">
							<col width="100%">
						</colgroup>
						
						<tbody>
						
							<!-- 코스 이름 -->
							<tr>
								<th>코스 이름</th>
								<td><input type="text" class="txt-long" id="course-title" name="title" maxlength="11"></td>
							</tr>
							
							<!-- 종목 -->
							<tr>
								<th>종목</th>
								<td>
									<input type="radio" name="courseCate" id="walk" value="walk" checked>
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw">
									<label for="draw">그림</label>
									
								</td>
							</tr>
							
							<!-- 거리 -->
							<tr>
								<th>거리</th>
								<td>
									<div>
										<input type="number" class="txt-short" id="distance" name="distance" value="" readonly>
										<p>km</p>
											
									</div>
								</td>
							</tr>
							
							<!-- 예상 시간 -->
							<tr>
								<th>예상 시간</th>
								<td>
									<div class="time-guide">
										<span class="glyphicon glyphicon-info-sign"></span>
										마라톤, 그림 종목은 직접 입력해주세요.
									</div>
									
									<input type="number" class="txt-short" name="hour" id="hour" value="0" min="0" max="24">
									<p>시간</p>
									<input type="number" class="txt-short" name="minute" id="minute" value="0" min="0" max="59">
									<p>분</p>
									
								</td>
							</tr>
							
							<!-- 예상 난이도 -->
							<tr>
								<th>예상 난이도</th>
								<td>
									<input type="radio" name="difficulty" id="easy" value="easy" checked>
									<label for="easy">쉬움</label>
									
									<input type="radio" name="difficulty" id="normal" value="normal">
									<label for="normal">보통</label>
									
									<input type="radio" name="difficulty" id="hard" value="hard">
									<label for="hard">어려움</label>
								</td>
							</tr>
							
							<!-- 코스 공개여부 -->
							<tr>
								<th>코스 공개여부</th>
								<td>
									<input type="radio" name="openStatus" id="open" value="open" checked>
									<label for="open">공개</label>
									
									<input type="radio" name="openStatus" id="close" value="close">
									<label for="close">비공개</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 하단 버튼 영역 -->
				<div id="btn-wrap">
					<!-- 사용자 번호 -->
					<input type="hidden" id="userNo" name="userNo" value="${authUser.userNo }">
					
					<button class="cancel">취소</button>
					<button type="submit" class="add">코스 등록</button>
				</div>
		
		
			<!-- course-content -->
			</form>
		</div>
		<!-- course-form -->
	</div>
	<!-- content -->
	
	
	
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- 푸터 -->
	
</div>
<!-- wrap -->
</body>
</html>