<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:parseNumber var="hour" value="${coMap.coVo.courseTime/60 }" integerOnly="true" /> <!-- 시간 정수로 표시 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 정보 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-view.css">



<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8"></script>
<!-- 차트 api -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div id="wrap">

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- 헤더 -->
	
	
	
	<!-- content -->
	<div id="content">
		
		<div id="view-content">
			<!-- 지도 영역 -->
			<div id="map-info"  style="width:70%;height:662px;"></div>
			
			
			<!-- 글 영역 -->
			<div class="course-view">
				<!-- 상단 탭 -->
				<div class="course-view-tap">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath }/course/view?courseNo=${param.courseNo}" class="tabbtn selected">코스정보</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/record/view?courseNo=${param.courseNo}" class="tabbtn">기록보기</a>
						</li>
					</ul>
				</div>
				
				<!-- 코스 정보 -->
				<div class="course-view-info">
					<div class="course-info-content">
						<h2 id="course-title">${coMap.coVo.title }</h2>
						
						<!-- 제목 수정 버튼 -->
						<c:if test="${authUser.userNo eq coMap.coVo.userNo }">
							<span id="update-btn" class="glyphicon glyphicon-pencil"></span>
						</c:if>
						
						<!-- 즐겨찾기 별 -->
						<c:if test="${not empty authUser }">
							<img class="right" id="bookmark" alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star-off.png">
						</c:if>
						<div class="article-info">
							<span class="bold">${coMap.userName }</span>
							<span>${coMap.coVo.regDate }</span>
							<span>기록 ${coMap.recCnt }</span>
						</div>
						
						<div class="article-container">
							<div class="left">
								<c:choose>
									<c:when test="${coMap.coVo.courseCate eq 'walk' }">
										<img alt="산책" src="${pageContext.request.contextPath }/assets/image/course/walk.png">
										<span>산책</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'jogging' }">
										<img alt="조깅" src="${pageContext.request.contextPath }/assets/image/course/jog.png">
										<span>조깅</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'running' }">
										<img alt="러닝" src="${pageContext.request.contextPath }/assets/image/course/run.png">
										<span>러닝</span>
									</c:when>
									
									<c:when test="${coMap.coVo.courseCate eq 'marathon' }">
										<img alt="마라톤" src="${pageContext.request.contextPath }/assets/image/course/marathon.png">
										<span>마라톤</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'bicycle' }">
										<img alt="자전거" src="${pageContext.request.contextPath }/assets/image/course/bicycle.png">
										<span>자전거</span>
									</c:when>
									<c:when test="${coMap.coVo.courseCate eq 'draw' }">
										<img alt="그림" src="${pageContext.request.contextPath }/assets/image/course/drawing.png">
										<span>그림</span>
									</c:when>
								</c:choose>
							</div>
							
							<div class="right">
								<img alt="시간" src="${pageContext.request.contextPath }/assets/image/course/time.png">
								<c:if test="${coMap.coVo.courseTime >= 60 }">
									<span>${hour }시간</span>
								</c:if>
								<span>${coMap.coVo.courseTime%60 }분</span>
							</div>
							
							<div class="left">
								<img alt="거리" src="${pageContext.request.contextPath }/assets/image/course/distance.png">
								<span>${coMap.coVo.distance } km</span>
							</div>
							
							<div class="right">
								<img alt="난이도" src="${pageContext.request.contextPath }/assets/image/course/difficulty.png">
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
					</div>
					
					<!-- 통계그래프 -->
					<div class="record-status">
						<h3>일기 작성 현황</h3>
						<div class="chart-choose">
						
							<input type="radio" name="chart-choose" id="category" value="category" checked>
							<label for="category">종목별</label>
							
							<input type="radio" name="chart-choose" id="difficulty" value="diffi">
							<label for="difficulty">난이도별</label>
						</div>
						
						<div id="charts">
							<canvas id="chart"></canvas>
							
						</div>
					</div>
					
					<!-- 하단 버튼 영역 -->
					<div id="course-info-btn">
						<input type="hidden" id="courseNo" value="${coMap.coVo.courseNo }">
						<a href="${pageContext.request.contextPath}/board?boardCategory=post" class="link-btn">후기 보러가기</a>
						<a class="like-btn">
							<img id="like" src="${pageContext.request.contextPath }/assets/image/main/${coMap.liked}.png">
							<span id="like-cnt">${coMap.likeCnt }</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	
	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- 푸터 -->
	
</div>
<!-- wrap -->

<!-- 코스제목 수정 모달창 -->
<div class="modal" tabindex="-1" role="dialog" id="title-update">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">제목 수정</h5>
      </div>
      <div class="modal-body">
        <input type="text" id="modTitle" name="modTitle" value="${coMap.coVo.title }">
      </div>
      <div class="modal-footer">
      	<button type="button" id="modTitle-btn" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->


<!-- 즐겨찾기 목록 선택 -->
<div class="modal" tabindex="-1" role="dialog" id="bookmark-list">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<img alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star.png">
        <h5 class="modal-title">즐겨찾기 추가하기</h5>
      </div>
      <div class="modal-body">
        
        <div>
        	<ul id="fevList">
        		
        		
        	</ul>
        </div>
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="bookmark-add">추가</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->

</body>

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.authUserNo = parseInt('${authUser.userNo}');
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/course/view-course.js"></script>

</html>