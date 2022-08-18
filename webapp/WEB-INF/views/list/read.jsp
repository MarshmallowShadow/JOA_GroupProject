<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세페이지</title>

<!-- css -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/read.css" rel="stylesheet" type="text/css">

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
					<th colspan="3" id="board_title">[소통]도림천 다녀오는 길</th>
				</tr>
				<tr id="top">
					<th id="id">신림러</th>
					<th id="date">2022.07.24</th>
					<th id="up">조회수: 47</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3" id="content">
						오늘 도림천 다녀오면서 저번에 같이 달리기했던 깜이님 만났어요!<br>
						그래서 같이 마트도 다녀왔어요~~~~~<br>
						오늘 날씨 너무 덥고 힘들고 심심했는데 무척 재미있었어요!<br>
						다음에 같이 또 달리는 날이 있으면 좋겠네요!
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<br>
	
	<!-- 수정, 삭제 버튼 -->
	<div id="writer_btnM">
		<button type="submit" id="modify_m">수정</button>
		<button type="submit" id="delete_m">삭제</button>
	</div><!-- writer_btn -->
	
	<!-- 댓글 -->
	<div>
		<p id="top_comment">댓글</p>
		<div id="commentbox">
			<p class="id">히유</p>
			<p class="comment">-저도 오늘 나갔다가 놀랐어요~</p>
			<p class="id">쭌</p>
			<p id="comment_">-</p><p id="bold">@깜이</p><p class="comment">나도 부르지 그랬어~</p>
			<p class="id">깜이</p>
			<p id="comment_btn">-망고 샀어ㅎㅎ</p>
			
			<!-- 수정, 삭제 버튼 -->
			<textarea id="replybox"></textarea>
			<button type="submit" id="reply_btn"><span class="glyphicon glyphicon-open"></span></button>
		</div><!-- commentbox -->
	</div><!-- 댓글 -->

	<button type="submit" id="list" onclick="location.href='http://localhost:8088/JOA/list/list';">목록</button>
	
	<br><br><br><br><br><br><br><br><br><br>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<!------------------------ footer ------------------------>	

</body>
</html>