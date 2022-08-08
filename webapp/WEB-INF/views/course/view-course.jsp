<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 정보 상세보기</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/course-view.css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/course/view-course.js"></script>
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
			<div id="map">
				<!-- 지도 -->
				<img src="${pageContext.request.contextPath }/assets/image/course/map.jpg" width="100%">
			</div>
			
			
			<!-- 글 영역 -->
			<div class="course-view">
				<!-- 상단 탭 -->
				<div class="course-view-tap">
					<ul>
						<li>
							<a href="./view-course.html" class="tabbtn selected">코스정보</a>
						</li>
						<li>
							<a href="./view-record.html" class="tabbtn">기록보기</a>
						</li>
					</ul>
				</div>
				
				<!-- 코스 정보 -->
				<div class="course-view-info">
					<div class="course-info-content">
						<h2>코스제목</h2>
						
						<!-- 수정 버튼 -->
						<span id="update-btn" class="glyphicon glyphicon-pencil"></span>
						
						<!-- 즐겨찾기 별 -->
						<img class="right" id="bookmark" alt="즐겨찾기" src="${pageContext.request.contextPath }/assets/image/main/star.png">
						
						<div class="article-info">
							<span class="bold">박깜이</span>
							<span>조회수 518</span>
							<span>22.07.18</span>
							<span>기록 8</span>
						</div>
						
						<div class="article-container">
							<div class="left">
								<img alt="산책" src="${pageContext.request.contextPath }/assets/image/course/walk.png">
								<span>산책</span>
								
								<!-- <img alt="조깅" src="${pageContext.request.contextPath }/assets/image/course/jog.png">
								<span>조깅</span>
								<img alt="러닝" src="${pageContext.request.contextPath }/assets/image/course/run.png">
								<span>러닝</span>
								<img alt="마라톤" src="${pageContext.request.contextPath }/assets/image/course/marathon.png">
								<span>마라톤</span>
								<img alt="자전거" src="${pageContext.request.contextPath }/assets/image/course/bicycle.png">
								<span>자전거</span>
								<img alt="그림" src="${pageContext.request.contextPath }/assets/image/course/drawing.png">
								<span>그림</span> -->
							</div>
							
							<div class="right">
								<img alt="시간" src="${pageContext.request.contextPath }/assets/image/course/time.png">
								<span>30분</span>
							</div>
							
							<div class="left">
								<img alt="거리" src="${pageContext.request.contextPath }/assets/image/course/distance.png">
								<span>2 km</span>
							</div>
							
							<div class="right">
								<img alt="난이도" src="${pageContext.request.contextPath }/assets/image/course/difficulty.png">
								<span>어려움</span>
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
						<a href="../board/board.html" class="link-btn">후기 보러가기</a>
						<a class="like-btn">
							<img src="${pageContext.request.contextPath }/assets/image/main/heart-off.png">
							<span>0</span>
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
        <input type="text" id="title-update" value="원래 있던 제목">
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">수정</button>
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
        	<ul>
        		<li>
        			<div>
        				<input type="checkbox" id="bookmark1" name="bookmark" value="">
        				<label for="bookmark1">서울 근교 코스</label>
        			</div>
        		</li>
        	
        		<li>
        			<div>
        				<input type="checkbox" id="bookmark2" name="bookmark" value="">
        				<label for="bookmark2">웃겨 자빠질 코스</label>
        			</div>
        		</li>
        		
        		<li>
        			<div>
        				<input type="checkbox" id="bookmark3" name="bookmark" value="">
        				<label for="bookmark3">기어가는 코스</label>
        			</div>
        		</li>
        		
        	</ul>
        </div>
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">추가</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->

</body>

</html>