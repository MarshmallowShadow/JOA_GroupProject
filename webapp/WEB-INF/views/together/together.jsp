<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하기 리스트</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/together.css" rel="stylesheet" type="text/css">
<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- header -->
	
		<div id="content">
			<h1>함께하기</h1>
			
			
			<!-- 소분류 카테고리 -->
			<div id="top_side">
				<ul>
					<li><a href="">전체</a></li>
					<li>|</li>
					<li><a href="">진행중</a></li>
					<li>|</li>
					<li><a href="">마감</a></li>
				</ul>
			</div><!-- top_side -->
				
				
			<!-- 함께하기 만들기 버튼 -->
			<div id="together-nav">
				<div id="to_make">
					<button type="submit" id="together_make" onclick="location.href='http://localhost:8088/JOA/together/writeform';">함께하기 만들기</button>
				</div>
		
				<!-- 즐겨찾기와 참여한 항목 필터링 버튼 -->
				<div id="rightside">
					<ul>
						<li id="man_btn">
							<a href="">
								<span class="glyphicon glyphicon-user"></span> 함께
							</a>
						</li>
						<li id="tag_btn">
							<a href="">
								<span class="glyphicon glyphicon-bookmark"></span> 태그
							</a>
						</li>
						<li id="joined_btn">
							<a href="">
								<span class="glyphicon glyphicon-ok"></span> 참여
							</a>
						</li>
					</ul>
				</div><!-- rightside -->
			</div><!-- together-nav -->
			
			
			<!-- 함께하기 리스트 -->
			<div id="list">
				<c:forEach items="${togetherList}" var="tMap">
					<div class="chart">
						<table>
							<thead>
								<tr class="top">
									<th class="line_top">${tMap.REGSTART} - ${tMap.REGEND}</th>
									<th class="mark">
										<button class="bookmark">
											<img class="image" src="${pageContext.request.contextPath}/assets/image/together/bookmarks_black.png">
										</button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th colspan="2" class="content">${tMap.TITLE}</th>
								</tr>
								<tr>
									<th colspan="2" class="content_course">
										<span class="glyphicon glyphicon-map-marker" class="marking"></span>신림 - 잠실
										<!-- <input type="hidden" name="courseNo"> -->
									</th>
								</tr>
								<tr>
									<th colspan="2" class="line_bottom">
										${tMap.COURSECATEGORY}
										<button type="submit" class="join"><span class="glyphicon glyphicon-user" id="join_icon"></span>${tMap.COUNT}/${tMap.JOINMAX}</button>
									</th>
								</tr>
							</tbody>
						</table>
					</div><!-- table(chart) -->
					
					<div class="chart">
						<table class="over">
							<thead>
								<tr class="top">
									<th class="date_over">2022/07/24 - 2022/07/30</th>
									<th class="mark_over">
										<button class="bookmark_over">
											<img class="image_over" src="${pageContext.request.contextPath}/assets/image/together/bookmarks_black.png">
										</button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th colspan="2" class="content">쭈쭈네 동네 한바퀴</th>
								</tr>
								<tr>
									<th colspan="2" class="content_course"><span class="glyphicon glyphicon-map-marker" class="marking"></span>신림 - 잠실</th>
								</tr>
								<tr>
									<th colspan="2" class="line_bottomOver">
										산책
										<button type="submit" class="joinOver"><span class="glyphicon glyphicon-user" id="join_iconOver"></span>11/15</button>
									</th>
								</tr>
							</tbody>
						</table>
					</div><!-- table(chart) -->
				</c:forEach>
			</div><!-- list -->

			<!-- 페이지 -->
			<div id="page">
				<ul class="ul">
					<c:if test="${prev}">
						<li class="li"><a href="#">◀</a></li>
					</c:if>
					<c:forEach begin="${startPageBtnNo}" end="${endPageBtnNo}" step="1" var="i">
						<li class="active li"><a href="${pageContext.request.contextPath}/together/together?crtPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${next}">
						<li class="li"><a href="#">▶</a></li>
					</c:if>
				</ul>
			</div><!-- Together button -->
			
		</div> <!-- content -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
		
		
	</div><!-- wrap -->

</body>
</html>