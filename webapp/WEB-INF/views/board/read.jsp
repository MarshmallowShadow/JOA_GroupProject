<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/read.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
	
		<h1>소통하기</h1>
		
			<div><!-- table -->

				<table>
					<thead>
						<tr>
							<th colspan="3" id="board_title">[${categoryMap[bMap.BOARDCATEGORY]}]${bMap.TITLE}</th>
						</tr>
						<tr id="top">
							<th id="id">${bMap.ID}</th>
							<th id="date">${bMap.REGDATE}</th>
							<th id="up">조회수: ${bMap.VIEWCOUNT}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" id="content">
								${bMap.CONTENT}
							</td>
						</tr>
						<tr>
							<td>
								
								<c:if test="${bMap.COURSENO != null}">
									<div class="course-container" onclick="window.location='${pageContext.request.contextPath}/course/c_viewform.html';">
										<a href="${pageContext.request.contextPath}/WEB-INF/course/view-course">
											<div class="course-icon"><img src="${pageContext.request.contextPath}/assets/image/map/map-icon.jpg"></div>
											<div class="course-info">
												<h3 class="course-title">${bMap.CTITLE}</h3>
												<p class="p-info">
													작성자: ${bMap.ID} <br>
													거리: ${bMap.DISTANCE}km <br>
													시간: ${bMap.COURSETIME}분
												</p>
												<div class="tag-blue"><p>${courseCateMap[bMap.COURSECATEGORY]}</p></div>
												<div class="tag-pink"><p>${courseDifiMap[bMap.DIFFICULTY]}</p></div>
											</div>
										</a>
									</div>
								</c:if>
								
								<c:if test="${bMap.EVENTNO != null}">
									<div class="chart">
										<table id="over" onClick="location.href='${pageContext.request.contextPath}/together/read/${bMap.EVENTNO}'">
											<thead>
												<tr class="t-top">
													<th class="line_top">${bMap.REGSTART} - ${bMap.REGEND}</th>
													<th class="mark">
														<button class="bookmark">
															<img id="image" src="${pageContext.request.contextPath}/assets/image/together/bookmarks_white.png">
														</button>
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th colspan="2" class="content">${bMap.EVENTTITLE}</th>
												</tr>
												<tr>
													<th colspan="2" class="content_course">
														<span class="glyphicon glyphicon-map-marker" class="marking"></span>${mapName[bMap.START]} - ${mapName[bMap.END]}
													</th>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="2" class="line_bottom">
														${courseCateMap[bMap.COURSECATEGORY]}
														<button type="submit" class="join"><span class="glyphicon glyphicon-user" id="join_icon"></span>${bMap.COUNT}/${bMap.JOINMAX}</button>
													</th>
												</tr>
											</tfoot>
										</table>
									</div>
								</c:if>
								
							</td>
						</tr>
						<tr>
							<td>
								<c:forEach items="${imgList}" var="boardImgVo">
									<li id="${boardImgVo.boardImgNo}" data-no="${boardImgVo.boardImgNo}">
										<img class="image" src="${pageContext.request.contextPath}/upload/${boardImgVo.saveName}">
									</li>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
				
				<br>
		
				<!-- 수정, 삭제 버튼 -->
				<div id="writer_btnM">
					<c:if test="${authUser.userNo eq bMap.USERNO}">
						<button type="button" id="modify_m">수정</button>
						<button type="button" id="delete_m">삭제</button>
					</c:if>
				</div><!-- writer_btn -->

			</div><!-- table -->
			
			
			<!-- 댓글 -->
			<div>
				<p id="top_comment">댓글</p>
				
				<div id="commentbox">
			
					<c:forEach items="${boardCommentList}"  var="boardCommentVo">
						<p class="id">${boardCommentVo.ID}</p>
						<div id="comment-inline">
							<!-- 멘션이 있는지 확인 -->
							<c:if test="${boardCommentVo.MENTION != null}">
								<span class="mention">@${boardCommentVo.MENTION} </span>
							</c:if>
							<p class="comment">${boardCommentVo.CONTENT}</p>
						</div>
					</c:forEach>
					
					<!-- 댓글 상자 -->
					<c:if test="${authUser != null}">
						<form method="get" action="${pageContext.request.contextPath}/board/comment">
							<input type="hidden" name="boardNo" value="${bMap.BOARDNO}">
							<input type="hidden" name="userNo" value="${authUser.userNo}">
							<div id="comment-box">
								<textarea id="replybox" name="content" style="resize: none;"></textarea><button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
							</div>
						</form>
					</c:if>
				</div><!-- commentbox -->
			</div><!-- 댓글 -->
		
			<button type="submit" id="list" onclick="location.href='${pageContext.request.contextPath}/board/board';">목록</button>
			
			<br><br><br><br><br><br><br><br><br><br>
			
			<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			<!-- footer -->
		
	</div><!-- wrap -->	

</body>
</html>