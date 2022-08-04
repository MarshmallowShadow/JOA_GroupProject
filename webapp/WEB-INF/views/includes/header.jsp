<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="header">
	<a href="../main/index.html"><img id="logo" src="../../../assets/image/main/logo.jpg"></a>
	<div id="user-menu">
		<c:choose>
			<c:when test="${empty authUser}">
				<div id="login">
					<ul>
						<li><a href="">회원가입</a></li>
						<li><a href="">로그인</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<label for="check-btn">최보승님</label>
				<input id="check-btn" type="checkbox">
				<ul id="menuitems" class="menubars">
						<li class="a"><a href="">코스 등록하기</a></li>
						<li class="a"><a href="">마이사이트</a></li>
						<li class="a"><a href="">로그아웃</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>

	<div id="nav">
		<ul>
			<li><a href="../together/together.html">함께하기</a></li>
			<li><a href="../board/board.html">게시판</a></li>
			<li><a href="../best/bestPlus.html">베스트</a></li>
			<li><a href="../map/map.html">지도</a></li>
		</ul>
	</div> <!-- nav -->
</div>  <!-- header -->