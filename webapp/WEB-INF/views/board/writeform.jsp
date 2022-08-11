<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기폼</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/writeForm.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/course/view-course.js"></script>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
	
		<h1>게시판</h1>
		
		<div id="writebox">
		
			<!-- <form action="${pageContext.request.contextPath}/board/write" method="get"> -->
				<!-- 글쓴이 -->
				<input type="hidden" name="userNo" value="${authUser.userNo}">
				
				<!-- 글쓰기 옵션 항목 -->
				<div id="option_line">
					<p id="option">항목</p>
					<select id="option_list" name="boardCategory">
						<option value="question">질문</option>
						<option value="commute">소통</option>
						<option value="post">후기</option>
						<option value="together">함께</option>
					</select>
				</div>
				
				<!-- 제목 -->
				<div id="title_line">
					<p id="title">제목</p>
					<input type="text" id="titlebox" name="title" placeholder="제목을 입력해 주세요.">
				</div>
				
				<!-- 글내용 -->
				<div id="content_line"><input type="text" id="contentbox" name="content"></div>
				
				<!-- 사진 첨부 -->
				<div id="file_line">
					<p id="file">사진첨부</p>
					<input type="file" id="filebox" name="boardImgNo" multiple="multiple">
				</div>
				
				<!-- 코스 선택 -->
				<div id="course_line">
					<p id="course">코스선택</p>
					<button type="submit" id="course_choice"><span class="glyphicon glyphicon-folder-open gray" id="folder"></span>코스 불러오기</button>
				</div>
				
				<!-- 함께하기 선택 -->
				<div id="together_line">
					<p id="together">함께하기</p>
					<button type="submit" id="together_choice"><span class="glyphicon glyphicon-user gray" id="man"></span>함께하기 불러오기</button>
				</div>
				
			<!-- </form> -->
			
		</div><!-- writebox -->	
		
	</div><!-- wrap -->
	
	<br><br><br>
	
	<div id="user_btn">
		<button id="cencle" onclick="location.href='http://localhost:8088/JOA_GroupProject/board';">취소</button>
		<button type="submit" id="post"  onclick="location.href='http://localhost:8088/JOA_GroupProject/read';">등록</button>
	</div>

	<br><br><br><br><br><br><br>

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
			    카테고리
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>
			
			<div class="courseChoose">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    코스
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="save">Save</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- ////////////////////////////////////////////////////////////////// -->
	
	<!-- ////////////////////////////////////////////////////////////////// -->
	<div id="togetherModal" class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">코스 등록하기</h4>
	      </div>
	      <div class="modal-body">
	        
	        <div class="togetherCate">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    카테고리
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">함께</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">태그</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">참여</a></li>
			  </ul>
			</div>
			
			<div class="togetherChoose">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    코스
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="save">Save</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- ////////////////////////////////////////////////////////////////// -->
	

</body>

	<script type="text/javascript">
		
		/* 준비가 끝났을 때 */
		$(document).ready(function() {
			
			console.log("jquery로 요청 data만 받는 요청");
			
			//리스트 요청 + 그리기
			fetchList();
			
		});
		
		//저장 버튼을 클릭했을 때
		$("#post").on("click", function() {
			
			console.log("저장 버튼 클릭");
			
			//데이터 수집
			var userNo = $("[name=userNo]").val();
			var boardCategory = $("[name=boardCategory]").val();
			var title = $("[name=title]").val();
			var content = $("[name=content]").val();
			
			//데이터 객체로 묶기
			var boardVo = {
					userNo: userNo
					, boardCategory: boardCategory
					, title: title
					, content: content
			};
			
			console.log(boardVo);
			
			$.ajax({
				
				//보낼 때
				url : "${pageContext.request.contextPath}/writeform",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(boardVo),	//js객체를 JSON 문자열로 변경
				
				//받을 때
				dataType : "json",
				success : function(boardVo){
					
					//1개데이터 리스트 추가(그리기)하기
					render(boardVo, "up");
					
					//입력폼 초기화
					$("[name=userNo]").val();
					$("[name=boardCategory]").val("");
					$("[name=title]").val("");
					$("[name=content]").val("");
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
				
			});
			
		});
		
		/* 코스 버튼을 클릭했을 때 */
		$("#course_choice").on("click", function() {
			
			console.log("코스 불러오기");

			
			//모달창 띄우기
			$("#courseModal").modal("show");
			
		});
		
		/* 함께 버튼을 클릭했을 때 */
		$("#together_choice").on("click", function() {
			
			console.log("코스 불러오기");

			
			//모달창 띄우기
			$("#togetherModal").modal("show");
			
		});
		
	</script>

</html>