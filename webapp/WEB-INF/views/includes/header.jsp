<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="header">
	<a href="${pageContext.request.contextPath }/"><img id="logo" src="${pageContext.request.contextPath }/assets/image/main/logo.jpg"></a>
	<div id="user-menu">
		<c:choose>
			<c:when test="${empty authUser}">
				<div id="login">
					<ul>
						<li><a href="${pageContext.request.contextPath }/user/joinForm">회원가입</a></li>
						<li id="middle">
						<li><a href="${pageContext.request.contextPath }/user/loginForm">로그인</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<label for="check-btn" id="menu-btn">${authUser.name }님</label>
				<input id="check-btn" type="checkbox">
				<ul id="menuitems" class="menubars" tabindex="-1">
						<li class="a" onclick="window.location='${pageContext.request.contextPath }/course/write';">코스 등록하기</li>
						<li class="a" onclick="window.location='${pageContext.request.contextPath }/my-page';">마이사이트</li>
						<li class="a" onclick="window.location='${pageContext.request.contextPath }/user/logout';">로그아웃</li>
				</ul>
				
				<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
				<script type="text/javascript">
					$("#check-btn").on("click", function() {
						$("#menuitems").focus();
						//console.log(document.activeElement);
					});
					$("#menu-btn").on("mousedown", function(e) {
						e.preventDefault();
					});
					
					$("#menuitems").on("focusout", function(){
						$("#check-btn").prop('checked', false);
					});
				</script>
			</c:otherwise>
		</c:choose>
	</div>

	<div id="nav">
		<ul>
			<li><a href="${pageContext.request.contextPath }/together">함께하기</a></li>
			<li><a href="${pageContext.request.contextPath }/board">게시판</a></li>
			<li><a href="${pageContext.request.contextPath }/best">베스트</a></li>
			<li><a href="${pageContext.request.contextPath }/map">코스 탐색</a></li>
			<li><a href="${pageContext.request.contextPath }/mobile/timer">시간 기록</a></li>
		</ul>
	</div> <!-- nav -->
</div>  <!-- header -->