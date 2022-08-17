<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기1</title>

<!-- favicon.ico 404에러 해결 -->
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">


<!-- jquery -->
<script type="text/javascript">
	window.userNo = parseInt('1');
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/mypage.js"></script>



</head>
<body>

<div id="wrap">
	<!-- 헤더자리 -->
	<div id="header">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	</div>
	<!-- 헤더자리 -->
	
	<!-- content -->
	<div id="content">
		
		
		<!-- 마이페이지 메뉴바 자리 -->
			<div id="menuBar">
				<c:import url="/WEB-INF/views/my-page/menu.jsp"></c:import>
			</div>
		
		
		<div class="subHeader">
			<span onclick="openNav()"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></span>
			<p id="title">즐겨찾기 
				<img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/star.png">
			</p>
		</div>
		
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">즐겨찾기 제목</p>
				
				<ol>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">홍길동</p>
								<p id="courseInfo">조회수2 * 22.07.01</p>
								<p id="courseInfo">후기글8 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">화이티이잉</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">고길동</p>
								<p id="courseInfo">조회수2 * 22.06.30</p>
								<p id="courseInfo">후기글0</p>
						  	</div>
						</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample3.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">깐따삐야 가는 길</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수18 * 22.06.29</p>
								<p id="courseInfo">후기글4 &nbsp;<img class="newpost" src="${pageContext.request.contextPath}/assets/image/main/new.png"></p>
						  	</div>
					  	</div>
					</li>
					<li>
						<div class="listBox" style="cursor: pointer;" onclick="window.location='';">
						  	<img class="courseImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample2.jpg">
						  	<div id="textBox">
								<div class="courseTitle">
									<p id="courseName">신나는 코스</p>
									<div class="img-icons">
										<img class="like-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/heart-off.png">
										<img class="bookmark-cancel-btn" src="${pageContext.request.contextPath}/assets/image/main/star.png">
									</div>
								</div>
								<p id="courseInfo">둘리</p>
								<p id="courseInfo">조회수11 * 22.06.21</p>
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


<!-- 모달-즐겨찾기 추가 ***************************************************************************************** -->
<div class="modal category-add-btn">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 추가</h5>
        <br>
        <p class="modal-title">새로운 목록을 만들어 주세요.</p>
      </div>
      <div class="modal-body">
        <p>새 목록 이름</p>
        <br>
        <input type="text" name="catename" value="" placeholder="즐겨찾기 이름을 입력하세요">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="add-bookmark-category">목록 만들기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 추가 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 삭제 ***************************************************************************************** -->
<div class="modal category-del-btn">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">즐겨찾기 삭제</h5>
        <br>
        <p class="modal-title">삭제할 목록을 선택해 주세요.</p>
      </div>
      <div class="modal-body">
        <select id="del-select-list" class="sel-delCategory" >
        	<%-- <option>${categoryVo.cateName}</option> --%>
        </select>
        <br>
        <br>
        <p <%--  class="modal-body-detail" --%>>목록을 삭제할 경우, <br>목록 안의 내용들도 삭제됩니다!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="del-bookmark-category">목록 삭제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 삭제 끝!! ************************************************************************************* -->

<!-- 모달-즐겨찾기 이름변경 ***************************************************************************************** -->
<div class="modal category-modify-btn">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h5 class="modal-title">즐겨찾기 목록 이름 변경</h5>
    </div>
    <div class="modal-body">
    	<p>목록의 이름을 변경해주세요.</p>
    	<br>
    	<div id="cateName-modal">
    		<%-- <input type="text" placeholder="${categoryVo.cateName}"> --%>
    	</div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      <button type="button" class="btn btn-primary">변경</button>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 모달-즐겨찾기 이름변경 끝!! ***************************************************************************************** -->




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