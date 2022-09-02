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
					<li><a href="${pageContext.request.contextPath}/together/together?regStatus=1">전체</a></li>
					<li>|</li>
					<li><a href="${pageContext.request.contextPath}/together/together?regStatus=2">진행중</a></li>
					<li>|</li>
					<li><a href="${pageContext.request.contextPath}/together/together?regStatus=3">마감</a></li>
				</ul>
			</div><!-- top_side -->
				
				
			<!-- 함께하기 만들기 버튼 -->
			<div id="together-nav">
			
				<div id="to_make">
					<c:if test="${authUser != null}">
						<button type="submit" id="together_make" onclick="location.href='${pageContext.request.contextPath}/together/writeform';">함께하기 만들기</button>
					</c:if>
				</div>
		
				<!-- 본인 제작 이벤트, 즐겨찾기와 참여한 항목 필터링 버튼 -->
				<div id="rightside">
					<c:if test="${authUser != null}">
						<ul>
							<li id="man_btn">
								<a href="${pageContext.request.contextPath}/together/together?filStatus=1&regStatus=${param.regStatuss}">
									<span class="glyphicon glyphicon-user"></span> 함께
								</a>
							</li>
							<li id="tag_btn">
								<a href="${pageContext.request.contextPath}/together/together?filStatus=2&regStatus=${param.regStatuss}">
									<span class="glyphicon glyphicon-bookmark"></span> 태그
								</a>
							</li>
							<li id="joined_btn">
								<a href="${pageContext.request.contextPath}/together/together?filStatus=3&regStatus=${param.regStatuss}">
									<span class="glyphicon glyphicon-ok"></span> 참여
								</a>
							</li>
						</ul>
					</c:if>
				</div><!-- rightside -->
				
			</div><!-- together-nav -->
			
			
			<!-- 함께하기 리스트 -->
			<div id="list">
				<!-- List -->
				<div id="ListArea">
					
				</div>
				<!-- /List -->
			</div><!-- list -->

			<!-- 페이지 -->
			<div id="page">
				<ul class="ul">
					
				</ul>
			</div><!-- Together button -->
			
		</div> <!-- content -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->
		
		
	</div><!-- wrap -->

</body>

<!-- 자바스크립트 -->
<script type="text/javascript">
	window.pageContext = '${pageContext.request.contextPath}';
	window.userNo = parseInt('${authUser.userNo}');
	
	window.crtPage = parseInt('${param.crtPage}') || 0;
	window.regStatus = ('${param.regStatus}') || 0;
	window.filStatus = ('${param.filStatus}') || 0;
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/together/together.js"></script>

</html>