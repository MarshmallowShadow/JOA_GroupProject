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

</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
	
		<h1>소통하기</h1>
		
		<!-- <form action="${pageContext.request.contextPath}/board/write" method="get"> -->
		
			<div id="writebox">

				<!-- 글쓴이 -->
				<input type="hidden" name="userNo" value="${authUser.userNo}">
				
				<!-- 글쓰기 옵션 항목 -->
				<div id="option_line">
					<p id="option">항목</p>
					<select id="option_list" name="boardCategory">
						<option value="default"></option>
						<option value="question">질문</option>
						<option value="commute">소통</option>
						<option value="post">후기</option>
						<option value="together">함께</option>
					</select>
				</div>
				
				<!-- 제목 -->
				<div id="title_line">
					<p id="title">제목</p>
					<input type="text" id="titlebox" name="title" value="" placeholder="제목을 입력해 주세요.">
				</div>
				
				<!-- 글내용 -->
				<div id="content_line"><textarea id="contentbox" name="content" style="resize: none;"></textarea></div>
				
				<!-- 코스 선택 -->
				<div id="course_line">
					<p id="course">코스선택</p>
					<button type="button" id="course_choice"><span class="glyphicon glyphicon-folder-open gray" id="folder"></span>코스 불러오기</button>
					<input type="hidden" id="courseFinal" name="courseNo" value="">
				</div>
				
				<!-- 함께하기 선택 -->
				<div id="together_line">
					<p id="together">함께하기</p>
					<button type="button" id="together_choice"><span class="glyphicon glyphicon-user gray" id="man"></span>함께하기 불러오기</button>
					<!-- <input type="hidden" name="eventNo" value=""> -->
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
							<img id="photo-icon" src="${pageContext.request.contextPath}/assets/image/course/photo.png">
						</div>
						
						<div id="filesList">
						</div>
					</div>
					
				</div>
				<!-- course-form -->
				
			</div><!-- writebox -->
			
				
			<br><br><br>

			<div id="user_btn">
				<a id="cancel" href="${pageContext.request.contextPath}/board/board">취소</a>
				<button type="button" id="post">등록</button>
			</div>
				
		<!-- </form> -->


	</div><!-- wrap -->
	

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
			    즐겨찾기
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			  	<c:forEach items="${fList}" var="favCateVo">
			  		<li class="fav" data-cate-no="${favCateVo.cateNo}" role="presentation"><a role="menuitem" tabindex="-1">${favCateVo.cateName}</a></li>
			  	</c:forEach>
			  </ul>
			</div>
			
			<div class="courseChoose">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    코스
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
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
	
	<!-- ////////////////////////////////////////////////////////////////// -->
	<div id="togetherModal" class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">함께하기 등록하기</h4>
	      </div>
	      <div class="modal-body">
	        
	        <div class="togetherCate">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    카테고리
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation">태그</li>
			    <li role="presentation">참여</li>
			  </ul>
			</div>
			
			<div class="togetherChoose">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			    함께하기
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1">Action</a></li>
			    <li role="presentation">Another action</li>
			    <li role="presentation">Something else here</li>
			    <li role="presentation">Separated link</li>
			  </ul>
			</div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="t-save">Save</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- ////////////////////////////////////////////////////////////////// -->
	

</body>

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.pageContext = '${pageContext.request.contextPath}';
	window.userNo = parseInt('${authUser.userNo}');
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/board/writeform.js"></script>

</html>