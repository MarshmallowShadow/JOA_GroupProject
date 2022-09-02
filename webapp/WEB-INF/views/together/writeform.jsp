<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하기 글쓰기폼</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/together-write.css" rel="stylesheet" type="text/css">

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
								<input type="hidden" id="courseFinal" name="courseNo" value="">
							</td>
						</tr>
						
						<!-- 주소 검색 -->
						<tr>
							<td>
								<p class="guide">
									<span class="glyphicon glyphicon-info-sign"></span>
									주소를 검색하면 아래에 지도가 표시됩니다.
								</p>
								<div class="address-form">
									<input type="text" name="address">
									<button type="button" id="address-btn">주소검색</button>
								</div>
							</td>
						</tr>
						
						<!-- 지도 -->
						<tr>
							<td>
								<p class="map-guide">지도를 마우스로 클릭하면 선 그리기가 시작되고, 오른쪽 마우스를 클릭하면 선 그리기가 종료됩니다</p>
								<!-- 지도 -->
								<div id="map"></div>
							</td>
						</tr>
					
					</table>
				</div><!-- 코스지정 -->
				
				
				
				<!-- 코스 정보 -->
				<form id="t-form" action="${pageContext.request.contextPath}/together/write" method="get">
				<div id="point"></div>
				<input type="hidden" name="userNo" value="${authUser.userNo}">
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
								
								
								<!-- 코스 거리 -->
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
									<th>코스 공개 여부</th>
									<td>
										<input type="radio" name="openStatus" id="open" value="open" checked>
										<label for="open">공개</label>
										<p class="gray">함께하기 등록을 위해서는 코스 공개가 필수입니다.</p>
										
									</td>
								</tr>
								
								
								<!-- 이벤트 이름 -->
								<tr>
									<th>이벤트 이름</th>
									<td><input type="text" class="txt-long" id="together-title" name="eventTitle" maxlength="100"></td>
								</tr>
								
								
								<!-- 모집 기간 -->
								<tr>
									<th>모집 기간</th>
									<td>
										<input class="txt-short" type="text" id="reg-start" name="regStart">
										-
										<input class="txt-short" type="text" id="reg-end" name="regEnd">
									</td>
								</tr>
								
								
								<!-- 모임 장소 -->
								<tr>
									<th>모임장소</th>
									<td>
										<input type="text" class="txt-long" name="place">
									</td>
								</tr>
								
								
								<!-- 인원 -->
								<tr>
									<th>인원</th>
									<td>
										<input type="number" name="joinMax" id="joinMax" value="1" min="1"  max="30">
										<p class="gray">최대 인원은 30명입니다.</p>
										<!-- 초기값:value="1", 최소:min="1", 최대: max="15" -->
									</td>
								</tr>
								
								
								<!-- 함께하는 날 -->
								<tr>
									<th>함께하는 날</th>
									<td>
										<input class="txt-short" type="text" id="event-start" name="eventStart">
										<p><input type="time" name="eventStart"></p>
									</td>
								</tr>
								
								
								<!-- 상세내용 -->
								<tr>
									<th>상세내용</th>
									<td>
										<textarea name="content" placeholder="내용을 입력해주세요."></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- 코스 정보 -->
					
					<!-- 하단 버튼 -->
					<div id="btn-wrap">
						<button class="cancel" onclick="location.href='${pageContext.request.contextPath}/together/together';">취소</button>
						<button type="submit" class="add" id="add">함께 등록</button>
					</div>
					
				</form>
				
			</div><!-- together-form -->
			
		</div><!-- content -->
	
		
	</div><!-- wrap -->


	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->
	
	<!-- ////////////////////////////////////////////////////////////////// -->
	<div id="courseModal" class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">코스 등록하기</h4>
	      </div>
	      <div class="modal-body">
	        
	        <div class="courseCate">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    즐겨찾기
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" id="fav-menu" role="menu" aria-labelledby="dropdownMenu1">
			  	<c:forEach items="${fList}" var="favCateVo">
			  		<li class="fav" data-cate-no="${favCateVo.cateNo}" role="presentation"><a role="menuitem" tabindex="-1">${favCateVo.cateName}</a></li>
			  	</c:forEach>
			  </ul>
			</div>
			
			<div class="courseChoose">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
			    코스
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" id="fav-course" role="menu" aria-labelledby="dropdownMenu2">
			    <c:forEach items="${cList}" var="CourseVo">
			  		<li class="co" data-title="${CourseVo.title}" data-course-no="${CourseVo.courseNo}" role="presentation"><a role="menuitem" tabindex="-1">${CourseVo.title}</a></li>
			  	</c:forEach>
			  </ul>
			</div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="c-save">Save</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- ////////////////////////////////////////////////////////////////// -->

</body>

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/together/writeform.js"></script>

<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=acae275ea0809d93a5e7a1622fddb4f9&libraries=services"></script>

</html>