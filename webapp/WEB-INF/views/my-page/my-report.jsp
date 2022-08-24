<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 기록보기</title>

<!-- favicon.ico 404에러 해결 -->
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/calendar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">


<!-- jquery -->
<script type="text/javascript">
	window.userNo = '${authUser.userNo}';
	window.contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/mypage.js"></script>


</head>
<body>
<div id="wrap">
	<!-- 헤더자리 -->
	<div id="header">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	</div>
	<!-- 헤더자리 -->	
	
	<!-- content -->
	<div id="content">
		
		 <!-- 마이페이지 메뉴바 자리 -->
			<div id="menuBar" class="w3-container w3-center w3-animate-left">
				<c:import url="/WEB-INF/views/my-page/menu.jsp"></c:import>
			</div>
		
		
		<div class="subHeader">
			<img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
			<p id="title">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></p>
		</div>
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">나의 기록 보기</p>
				<div class="myReport">
					<div id="calendar">
						<div id="calendarApi"></div>
					</div>
				
					
					<div id="reportList">
						<div class="listTitle">
							<p id="category1" class="monthReport" data-ex0="ex1"><a href="${pageContext.request.contextPath}/my-page/my-report">이달의 기록</a></p>
							<p id="category2" class="todayReport">오늘의 기록</p>
						</div>
						<ul class="reportBox">	
							<%--
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">88888888888<p class="date" id="nows"></p></p>
									<p class="content">링거 맞고 뛰었다^^</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>--%> 
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //center-content -->
</div>
<!-- wrap -->
	<!-- 메인 푸터  자리-->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->


<!-- 기록 삭제 모달!! ************************************************************************************* -->
<div class="modal myrecord-del-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="byebye-record-close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title">나의 기록 삭제</h5>
      </div>
      <div class="modal-body">
        <p>나의 기록을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="byebye-record-cancel" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="byebye-record">삭제</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 기록 삭제 모달!!  끝!! ************************************************************************************* -->
</body>
</html>