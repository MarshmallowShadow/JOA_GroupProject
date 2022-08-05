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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/menubar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/bookmark.js"></script>



</head>
<body>
<div id="header">
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
</div>
<!-- 헤더 -->
<div id="wrap">	
	<!-- content -->
	<div id="content">
		
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		<div id="menuBar">
			<div class="menu1">
				<ol>
					<li id="mypage">
						<a href="${pageContext.request.contextPath}/my-page">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></a>
					</li>
					<li class="menuBar-close">
						 <!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"> --><img class="menuBar-close-btn" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
					</li>
					<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-course">나의 코스 보기</a></li>
					<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-report">나의 기록 보기</a></li>
				</ol>
			</div>
			
			<div class="menu2">
				<ol>
					<li id="bookmark"><a href="${pageContext.request.contextPath}/my-page/bookmark">즐겨찾기 <img class="bmStar" src="${pageContext.request.contextPath}/assets/image/my-page/star.png"></a></li>
					<li class="bookmark-btn">
						<img class="plus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/plus.png">&nbsp; 
						<img class="minus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/minus.png">
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">서울 근교 코스 </a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">				
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">웃겨 자빠질 코스</a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">기어가는 코스</a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
					</li>
				</ol>
			</div>
			
			<div class="menu3">
				<ol>
					<li id="members"><p><a href="">회원정보수정 <img id="setting" src="${pageContext.request.contextPath}/assets/image/my-page/setting.png"></a></p></li>
				</ol>
			</div>
		</div>
		
		
		
		
		
		
		
		
		<div class="subHeader">
			<span onclick="openNav()"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></span>
			<p id="title">즐겨찾기 
				<img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/star.png">
			</p>
		</div>
		
		
		
		
		
		
		
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
	</div>
	<!-- //center-content -->
</div>
<!-- wrap -->
	<!-- 메인 푸터  자리-->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->


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