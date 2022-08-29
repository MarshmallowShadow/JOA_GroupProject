<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:parseNumber var="hour" value="${coMap.coVo.courseTime/60 }" integerOnly="true" /> <!-- 시간 정수로 표시 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 작성</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-write.css">

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/course/write-record.js"></script>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8"></script>
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
			<h1 id="title">기록 작성하기</h1>
		</div>
		
		<!-- 코스정보 -->
		<div class="course-form">
		
			<h2>코스 정보</h2>
			
			<table class="courseInfo">
				<colgroup>
					<col width="150px">
					<col width="70%">
					<col width="30%">
				</colgroup>
				
				<tr>
					<th>코스</th>
					
					<td>
						<div class="course-info">
							<div>
								<p>코스 제목</p>
								<span>${coMap.coVo.title }</span>
							</div>
							
							<div>
								<p>종목</p>
								
								<c:choose>
									<c:when test="${coMap.coVo.courseCate eq 'walk' }">
										<span>산책</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'jogging' }">
										<span>조깅</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'running' }">
										<span>러닝</span>
									</c:when>
									
									<c:when test="${coMap.coVo.courseCate eq 'marathon' }">
										<span>마라톤</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'bicycle' }">
										<span>자전거</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'draw' }">
										<span>그림</span>
									</c:when>
								</c:choose>
							</div>
							
							<div>
								<p>거리</p>
								<span>${coMap.coVo.distance }</span>
								<span>km</span>
								<!-- <p>m</p> -->
							</div>
							
							<div>
								<p>예상 시간</p>
								<span>${hour }</span>
								<span>시간</span>
								<span>${coMap.coVo.courseTime%60 }</span>
								<span>분</span>
							</div>
							
							<div>
								<p>예상 난이도</p>
								
								<c:choose>
									<c:when test="${coMap.coVo.difficulty eq 'easy' }">
										<span>쉬움</span>
									</c:when>
									<c:when test="${coMap.coVo.difficulty eq 'normal' }">
										<span>보통</span>
									</c:when>
									<c:when test="${coMap.coVo.difficulty eq 'hard' }">
										<span>어려움</span>
									</c:when>
								</c:choose>
							</div>
						</div>
						
					</td>
					
					
					<td>
					
						<!-- 지도 -->
						<div id="map-info"  style="width:500px;height:300px;"></div>
					</td>
				</tr>

			</table>
			
		</div>
		
		<!-- <form id="courseForm" method="get" action="./recordWrite" onsubmit="return sendImage()"> -->
			<!-- 기록 정보 -->
			<div class="course-form">
				<h2>기록 정보</h2>
				
				<table>
				
					<colgroup>
						<col width="150px">
						<col width="80%">
						<col width="150px">
						<col width="100%">
					</colgroup>
					
					<!-- 날짜 -->
					<tr>
						<th>날짜</th>
						<td colspan="3">
							<!-- <input class="datetime" id="date" type="date" name="regDate">
							<input class="datetime" id="time" type="time" name="regTime"> -->
							<input class="txt-short" type="number" id="year" value="" min="2000" max="2050"><p>년</p>
							<input class="txt-short" type="number" id="month" value="" min="1" max="12"><p>월</p>
							<input class="txt-short" type="number" id="day" value="" min="1" max="31"><p>일</p>
							
							<input type="radio" name="ampm" id="am" value="am">
							<label for="am" class="margin-left">오전</label>
							<input type="radio" name="ampm" id="pm" value="pm">
							<label for="pm">오후</label>
							<input class="txt-short" type="number" id="date-hour" value="" min="0" max="12"><p>시</p>
							<input class="txt-short" type="number" id="date-minute" value="" min="0" max="59"><p>분</p>
						</td>
					</tr>
					
					<!-- 날씨, 기온 -->
					<tr>
						<th>날씨</th>
						<td>
							<div class="course-radio">
								<input type="radio" name="weather" id="sun" value="sun">
								<label for="sun"><img src="${pageContext.request.contextPath }/assets/image/course/sun.png"></label>
								
								<input type="radio" name="weather" id="moon" value="moon">
								<label for="moon"><img src="${pageContext.request.contextPath }/assets/image/course/moon.png"></label>
								
								<input type="radio" name="weather" id="cloud" value="cloud">
								<label for="cloud"><img src="${pageContext.request.contextPath }/assets/image/course/cloud.png"></label>
								
								<input type="radio" name="weather" id="rain" value="rain">
								<label for="rain"><img src="${pageContext.request.contextPath }/assets/image/course/rain.png"></label>
								
								<input type="radio" name="weather" id="snow" value="snow">
								<label for="snow"><img src="${pageContext.request.contextPath }/assets/image/course/snow.png"></label>
							</div>
						</td>
						
						<th>기온</th>
						<td>
							<input class="txt-short" type="number" name="temperature" id="tem" min="-45" max="45">
							<p class="bold">℃</p>
						</td>
					</tr>
					
					
					<!-- 종목 -->
					<tr>
						<th>종목</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${coMap.coVo.courseCate eq 'walk' }">
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
								</c:when>
								
								<c:when test="${coMap.coVo.courseCate eq 'jogging' }">
									<input type="radio" name="courseCate" id="walk" value="walk">
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging" checked>
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw">
									<label for="draw">그림</label>
								</c:when>
								
								<c:when test="${coMap.coVo.courseCate eq 'running' }">
									<input type="radio" name="courseCate" id="walk" value="walk">
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running" checked>
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw">
									<label for="draw">그림</label>
								</c:when>
								
								<c:when test="${coMap.coVo.courseCate eq 'marathon' }">
									<input type="radio" name="courseCate" id="walk" value="walk">
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon" checked>
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw">
									<label for="draw">그림</label>
								</c:when>
								
								<c:when test="${coMap.coVo.courseCate eq 'bicycle' }">
									<input type="radio" name="courseCate" id="walk" value="walk">
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle" checked>
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw">
									<label for="draw">그림</label>
								</c:when>
								
								<c:when test="${coMap.coVo.courseCate eq 'draw' }">
									<input type="radio" name="courseCate" id="walk" value="walk">
									<label for="walk">산책</label>
									
									<input type="radio" name="courseCate" id="jogging" value="jogging">
									<label for="jogging">조깅</label>
									
									<input type="radio" name="courseCate" id="running" value="running">
									<label for="running">러닝</label>
									
									<input type="radio" name="courseCate" id="marathon" value="marathon">
									<label for="marathon">마라톤</label>
									
									<input type="radio" name="courseCate" id="bicycle" value="bicycle">
									<label for="bicycle">자전거</label>
									
									<input type="radio" name="courseCate" id="draw" value="draw" checked>
									<label for="draw">그림</label>
								</c:when>
							</c:choose>
						</td>
					</tr>
					
					<!-- 시간 -->
					<tr>
						<th>시간</th>
						<td colspan="3">
							<input type="number" class="txt-short" name="hour" id="hour" value="0" min="0" max="24">
							<p>시간</p>
							<input type="number" class="txt-short" name="minute" id="minute" value="0" min="0" max="59">
							<p>분</p>
						</td>
					</tr>
					
					<!-- 난이도 -->
					<tr>
						<th>난이도</th>
						<td colspan="3">
							<input type="radio" name="difficulty" id="easy" value="easy" checked>
							<label for="easy">쉬움</label>
							
							<input type="radio" name="difficulty" id="normal" value="normal">
							<label for="normal">보통</label>
							
							<input type="radio" name="difficulty" id="hard" value="hard">
							<label for="hard">어려움</label>
						</td>
					</tr>
					
					<!-- 한줄평 -->
					<tr>
						<th>한줄평</th>
						<td colspan="3">
							<input class="txt-long" type="text" id="review" name="review" value=""  maxlength="200">
						</td>
					</tr>
					
				</table>
			</div>
			
			<!-- 사진 등록 (드래그앤 드롭) -->
			<div class="course-form">
				
				<h2>
					<input type="file" id="input-file" multiple="multiple">
					<label for="input-file">파일선택</label>
					사진을 드래그하거나 선택해주세요.
				</h2>
				
				<div id="drop">
					
					<div id="fileDragDesc">
						<img id="photo-icon" src="${pageContext.request.contextPath }/assets/image/course/photo.png">
					</div>
					
					<div id="filesList">
					</div>
				</div>
			</div>
			<!-- course-form -->
			
			
			<div id="btn-wrap">
				<input type="hidden" id="courseNo" value="${param.courseNo }">
				<input type="hidden" id="userNo" value="${authUser.userNo }">
				<a class="cancel" href="./view?courseNo=${param.courseNo }">취소</a>
				<button class="add">기록 등록</button>
			</div>
		<!-- </form>	 -->
	</div>
	
	
	
	
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- 푸터 -->

</div>
<!-- wrap -->
</body>
</html>