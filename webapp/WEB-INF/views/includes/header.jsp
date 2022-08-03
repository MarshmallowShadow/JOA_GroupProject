<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 메인 로고 이미지를 링크하세요 logo.jpg -->
	<a href="../main/index.html">
		<img id="logo" src="../../../assets/image/main/logo.jpg">
	</a>

<!-- ************** 로그인 전 ************** -->
<!-- <c:if test="${empty authUser}"> -->
	<div id="login">
		<ul>
			<li><a href="">회원가입</a></li>
			<li><a href="">로그인</a></li>
		</ul>
	</div>
	<!-- login -->

	<div id="nav">
		<ul>
			<li><a href="../together/together.html">함께하기</a></li>
			<li><a href="../board/board.html">게시판</a></li>
			<li><a href="../best/bestPlus.html">베스트</a></li>
			<li><a href="../map/map.html">지도</a></li>
		</ul>
	</div>
	<!-- nav -->

<!-- </c:if> -->



<!-- ************** 로그인 후 ************** -->
<!-- <c:if test="${empty authUser}"> -->
	<div id="login">
		<ul>
			<li><a href="">김수빈님</a></li>
			<li><a href="">코스 등록하기</a></li>
			<li><a href="">마이페이지</a></li>
			<li><a href="">로그아웃</a></li>
		</ul>
	</div>

	<div id="nav">
		<ul>
			<li><a href="../together/together.html">함께하기</a></li>
			<li><a href="../board/board.html">게시판</a></li>
			<li><a href="../best/bestPlus.html">베스트</a></li>
			<li><a href="../map/map.html">지도</a></li>
		</ul>
	</div>
<!-- </c:if> -->	