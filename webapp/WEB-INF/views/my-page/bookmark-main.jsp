<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 메인</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/bookmark.js"></script>



</head>
<body>
	<div id="wrap">
		
		<!--메인 해더 자리 -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
		
		
		
		
		
		
		
		
		<div class="subHeader">
			<a href="${pageContext.request.contextPath}/my-page/menu"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></a>
			<p id="title">즐겨찾기 
				<img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/star.png">
			</p>
		</div>
		
		
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle"></p>
				<ol>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg"  style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg"  style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">오예</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg"  style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글4 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg"  style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가자</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글5 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">오호</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">집에 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글2 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">우이씨</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글3 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">밥먹으러 가는 길 </p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
								<p id="courseInfo">후기글0</p>
						 	</div>
						</div>
					</li>
					
					
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">재밌는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg" style="cursor: pointer;" onclick="window.location='';">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">나만 아는 길</p>
									<div class="img-icons">
										<img class="like-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					
				</ol> 
			</div>
		</div>
		
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
		
	
	</div>
	<!-- //center-content -->








<!-- 좋아요 해제 모달!! ************************************************************************************* -->
<div class="modal course-like-cancel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">좋아요 해제</h5>
      </div>
      <div class="modal-body">
        <p class="modal-body-detail">좋아요를 해제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">좋아요 해제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 좋아요 해제 모달 끝!! ************************************************************************************* -->

<!-- 즐겨찾기 해제 모달!! ************************************************************************************* -->
<div class="modal course-bookmark-cancel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 해제</h5>
      </div>
      <div class="modal-body">
        <p class="modal-body-detail">즐겨찾기를 해제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">즐겨찾기 해제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 즐겨찾기 해제 모달 끝!! ************************************************************************************* -->


</body>
</html>