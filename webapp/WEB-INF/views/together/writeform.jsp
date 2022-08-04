<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하기 글쓰기폼</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/together-write.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/course/view-course.js"></script>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- header -->


	<div id="wrap">
			
		<div id="content">
			<!-- 타이틀 -->
			<div>
				<h1 id="title">함께하기</h1>
			</div>
		
			
			<!-- 본문 -->
			
			<!-- 코스지정 -->
			<div class="together-form">
				<div class="map">
					<table>
						<colgroup>
							<col width="150px">
							<col width="100%">
						</colgroup>
					
						<tr>
							<th rowspan="4">코스 지정</th>
						</tr>
						
						<!-- 코스 불러오기 버튼 -->
						<tr>
							<td>
								<button type="button" id="course-load">
									<span class="glyphicon glyphicon-folder-open"></span>
									코스 불러오기
								</button>
							</td>
						</tr>
						
						<!-- 주소 검색 -->
						<tr>
							<td>
								
								<p class="guide">
									<span class="glyphicon glyphicon-info-sign"></span>
									주소를 검색하면 아래에 지도가 표시됩니다.
								</p>
								<form class="address-form">
									<input type="text" name="address">
									<button type="button" id="address-btn">주소검색</button>
								</form>
							</td>
						</tr>
						
						<!-- 지도 -->
						<tr>
							<td>
								<!-- 지도 -->
								<img src="${pageContext.request.contextPath}/assets/image/course/map.jpg" height="615px">
							</td>
						</tr>
					
					</table>
				</div>
				<!-- 코스지정 -->
				
				
				
				<!-- 코스 정보 -->
				<div class="together-content">
					<h2>코스 정보</h2>
					
					<table>
					
						<colgroup>
							<col width="150px">
							<col width="100%">
						</colgroup>
						
						<tbody>
						
							<!-- 코스 이름 -->
							<tr>
								<th>코스 이름</th>
								<td><input type="text" class="txt-long"  name="courseName"></td>
							</tr>
							
							<!-- 종목 -->
							<tr>
								<th>종목</th>
								<td>
									<input type="radio" name="events" id="walk" checked>
									<label for="walk">산책</label>
									
									<input type="radio" name="events" id="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="events" id="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="events" id="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="events" id="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="events" id="draw">
									<label for="draw">그림</label>
									
								</td>
							</tr>
							
							
							<!-- 코스 거리 -->
							<tr>
								<th>거리</th>
								<td>
									<div>
										<input type="text" class="txt-short">
		
										<input type="radio" name="distance" id="km" checked>
										<label for="km">km</label>
										
										<input type="radio" name="distance" id="m">
										<label for="m">m</label>
											
									</div>
								</td>
							</tr>
							
							
							<!-- 예상 시간 -->
							<tr>
								<th>예상 시간</th>
								<td>
									<input type="text" class="txt-short">
									<p>시간</p>
									<input type="text" class="txt-short">
									<p>분</p>
								</td>
							</tr>
							
							<!-- 예상 난이도 -->
							<tr>
								<th>예상 난이도</th>
								<td>
									<input type="radio" name="level" id="easy" checked>
									<label for="easy">쉬움</label>
									
									<input type="radio" name="level" id="nomal">
									<label for="nomal">보통</label>
									
									<input type="radio" name="level" id="hard">
									<label for="hard">어려움</label>
								</td>
							</tr>
							
							<!-- 코스 공개여부 -->
							<tr>
								<th>코스 공개여부</th>
								<td>
									<input type="radio" name="open-status" id="open" checked>
									<label for="open">공개</label>
									
									<input type="radio" name="open-status" id="close">
									<label for="close">비공개</label>
								</td>
							</tr>
							
							<!-- 모임 장소 -->
							<tr>
								<th>모임장소</th>
								<td>
									<input type="text" class="txt-long">
								</td>
							</tr>
							
							<!-- 인원 -->
							<tr>
								<th>인원</th>
								<td>
									<input type="number" name="personNum" value="1" min="1">
									<!-- 초기값:value="1", 최소:min="1", 최대: max="10" -->
								</td>
							</tr>
							
							<!-- 함께 하는 날 -->
							<tr>
								<th>함께 하는 날</th>
								<td>
									<input class="txt-short" type="date">
								</td>
							</tr>
							
							<!-- 상세내용 -->
							<tr>
								<th>상세내용</th>
								<td>
									<textarea placeholder="내용을 입력해주세요."></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 코스 정보 -->
			</div>
			
			<!-- 하단 버튼 -->
			<div id="btn-wrap">
				<button class="cancel">취소</button>
				<button class="add">코스 등록</button>
			</div>
			
		</div>
	
		
	</div><!-- wrap -->


	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- footer -->

</body>
</html>