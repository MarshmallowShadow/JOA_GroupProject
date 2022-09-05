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
			<div class="map_sample">
				<!-- 지도 영역 -->
				<div id="map-info" class="map"></div>
			</div>
			
			<!-- 상세정보 -->
			<div>
				<table>
					<thead>
						<tr>
							<th>
								<img id="marking" src="${pageContext.request.contextPath}/assets/image/together/marking.png">
								<div id="route">${tMap.START} - ${tMap.END}</div>
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
						<p class="comment">
							<!-- 멘션이 있는지 확인 -->
							<c:if test="${eventCommentVo.MENTION != null}">
								<span class="mention">@${eventCommentVo.MENTION} </span>
							</c:if>
							${eventCommentVo.CONTENT}
						</p>
					</div>
				</c:forEach>
				
				<!-- 댓글 -->
				<c:if test="${authUser != null}">
					<form method="get" action="${pageContext.request.contextPath}/together/comment">
						<input type="hidden" name="eventNo" value="${tMap.EVENTNO}">
						<input type="hidden" name="userNo" value="${authUser.userNo}">
						<div id="comment-box">
							<textarea id="replybox" name="content" style="resize: none;"></textarea><button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
						</div>
					</form>
				</c:if>
			</div><!-- commentbox -->
		</div><!-- 댓글 -->

		<button type="submit" id="list" onclick="location.href='${pageContext.request.contextPath}/together/together';">목록</button>
		
		<br><br><br><br><br><br><br><br><br><br>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
	
	</div><!-- wrap -->

</body>

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.pageContext = '${pageContext.request.contextPath}';
	window.eventNo = '${tMap.EVENTNO}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/together/read.js"></script>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61a92b5fb49fcf77c122981c5991fdb8"></script>

</html>