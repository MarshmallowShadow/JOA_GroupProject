<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="course-container" onclick="window.open('${pageContext.request.contextPath }/course/view?courseNo=1', '_blank');">
	<div class="course-icon">
		<img src="${pageContext.request.contextPath }/assets/image/map/map-icon.jpg">
	</div>
	<div class="course-info">
		<h3 class="course-title">헬 ^^</h3>
		<p class="p-info">
			작성자: 쿵야 <br>
			거리: 5.0km <br>
			시간: 40분
		</p>
		<div class="tag-blue"><p>런닝</p></div>
		<div class="tag-pink"><p>어려움</p></div>
	</div> <!-- course-info -->
</div> <!-- course-container -->