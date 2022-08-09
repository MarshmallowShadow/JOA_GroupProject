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
				<!-- 글쓰기 옵션 항목 -->
				<div id="option_line">
					<p id="option">항목</p>
					<select id="option_list" name="option">
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
					<input type="file" id="filebox" multiple="multiple">
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
	        <p>One fine body&hellip;</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save</button>
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
			var option = $("[name=option]").val();
			var title = $("[name=title]").val();
			var content = $("[name=content]").val();
			
			//데이터 객체로 묶기
			var boardVo = {
					option: option
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
					render(gvo, "up");
					
					//입력폼 초기화
					$("[name=option]").val("");
					$("[name=title]").val("");
					$("[name=content]").val("");
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
				
			});
			
		});
		
		/* 코스 버튼을 클릭했을 때 */
		$("#course_choice").on("click", "#courseModal", function() {
			
			console.log("코스 불러오기");

			
			//모달창 띄우기
			$("#course_choice").modal("show");
			
		});
		
	</script>

</html>