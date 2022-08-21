<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세페이지</title>

<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/listRead.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>

</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!---------------------------------------- header --------------------------------------->

<div class="wrap">
<h1>게시판</h1>

	<div>
		<table>
			<thead>
				<tr>
					<th colspan="3" id="board_title">${rMap.TITLE}</th>
				</tr>
				<tr id="top">
					<th id="id">${rMap.ID}</th>
					<th id="date">${rMap.REGDATE}</th>
					<th id="up">${rMap.VIEWCOUNT}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3" id="content">${rMap.CONTENT}</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<br>
	
	<!-- 수정, 삭제 버튼 -->
	<div id="writer_btnM">
		<button type="submit" id="modify_m">수정</button>
		<button type="button" id="delete" onclick="window.location='${pageContext.request.contextPath}/list/delete/${rMap.QLISTNO}';">삭제</button>
	</div><!-- writer_btn -->
	
	<!-- 댓글 -->
	<div>
		<p id="top_comment">댓글</p>
		<div id="commentbox">
			
		<c:forEach items="${cList}"  var="listCommentVo">
			<p class="id">${listCommentVo.id}</p>
			<p class="comment">${listCommentVo.comment}</p>
		</c:forEach>
		
			<!-- 수정, 삭제 버튼 -->
			<form method="get" action="${pageContext.request.contextPath}/list/comment">
				<input type="hidden" name="qListNo" value="${rMap.QLISTNO}">
				<input type="hidden" name="userNo" value="${authUser.userNo}">
				<textarea id="replybox" name="content"></textarea>
				<button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
			</form>
		</div><!-- commentbox -->
	</div><!-- 댓글 -->

	<button type="submit" id="list" onclick="location.href='http://localhost:8088/JOA/list/list';">목록</button>
	
	<br><br><br><br><br><br><br><br><br><br>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<!------------------------ footer ------------------------>	

</body>
</html>