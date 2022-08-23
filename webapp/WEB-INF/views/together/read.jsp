<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하기 상세페이지</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/together_read.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrap">
		<form action="#" method="get">
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
			<!-- header -->
		
			<h1>함께하기</h1>
			
			<!-- 제목과 작성일 -->
			<div>
				<p id="title">${tMap.EVENTTITLE}</p>
				<p id="date">${tMap.REGSTART} - ${tMap.REGEND}</p>
			</div>
			
			<!-- 상세지도 -->
			<div id="map_sample">
				<img class="map" src="${pageContext.request.contextPath}/assets/image/map/map-sample.jpg"><!-- a링크 걸어서 상세지도 연결 -->
			</div>
			
			<!-- 상세정보 -->
			<div>
				<table>
					<thead>
						<tr>
							<th>
								<img id="marking" src="${pageContext.request.contextPath}/assets/image/together/marking.png">
								<div id="route">신림 - 잠실</div>
							</th>
							<th>
								<img id="map_icon" src="${pageContext.request.contextPath}/assets/image/together/map.png">
								<div id="location">${tMap.PLACE}</div>
							</th>
							<th>
								<img id="calendar" src="${pageContext.request.contextPath}/assets/image/together/calendar.png">
								<div id="d-date">${tMap.EVENTSTART}</div>
							</th>
						</tr>
						<tr>
							<th>
								<img id="stopwatch" src="${pageContext.request.contextPath}/assets/image/together/stopwatch.png">
								<div id="distance">${tMap.DISTANCE}KM</div>
							</th>
							<th colspan="2">
								<img id="user" src="${pageContext.request.contextPath}/assets/image/together/user.png">
								<div id="user_num">${tMap.COUNT}/${tMap.JOINMAX}명</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" id="content">
								${tMap.CONTENT}
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- 테이블 -->
			
			<!-- 수정, 삭제 버튼 -->
			<div id="writer_btnM">
				<c:if test="${authUser.userNo eq tMap.USERNO}">
					<button type="button" id="modify_m">수정</button>
					<button type="button" id="delete_m">삭제</button>
				</c:if>
			</div><!-- writer_btn -->
		</form>
		
		<!-- 댓글 -->
		<div>
			<p id="top_comment">댓글</p>
			
			<div id="commentbox">
			
				<c:forEach items="${eventCommentList}"  var="eventCommentVo">
					<p class="id">${eventCommentVo.ID}</p>
					<div id="comment-inline">
						<p class="comment">${eventCommentVo.CONTENT}</p>
						<div id="writer_btnS">
							<button type="submit" id="modify_s"><span class="glyphicon glyphicon-pencil"></span></button>
							<button type="submit" id="delete_s"><span class="glyphicon glyphicon-trash"></span></button>
						</div><!-- writer_btn -->
					</div>
				</c:forEach>
				
				<!-- 수정, 삭제 버튼 -->
				<form method="get" action="${pageContext.request.contextPath}/together/comment">
					<input type="hidden" name="eventNo" value="${tMap.EVENTNO}">
					<input type="hidden" name="userNo" value="${authUser.userNo}">
					<textarea id="replybox" name="content"></textarea><button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
				</form>
			</div><!-- commentbox -->
		</div><!-- 댓글 -->

		<button type="submit" id="list" onclick="location.href='http://localhost:8088/JOA/together/together';">목록</button>
		
		<br><br><br><br><br><br><br><br><br><br>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
	
	</div><!-- wrap -->

</body>
</html>