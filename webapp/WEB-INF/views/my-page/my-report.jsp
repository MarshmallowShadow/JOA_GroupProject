<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 기록들</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/my-page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/calendar.css">


<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/menubar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/my-page/bookmark.js"></script>



</head>
<body>
<div id="header">
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
</div>
<!-- 헤더 -->
<div id="wrap">	
	<!-- content -->
	<div id="content">
		
		
		
		
		
		<!-- 마이페이지 메뉴바 자리 -->
		<div id="menuBar">
			<div class="menu1">
				<ol>
					<li id="mypage">
						<a href="${pageContext.request.contextPath}/my-page">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></a>
					</li>
					<li class="menuBar-close">
						 <!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"> --><img class="menuBar-close-btn" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png">
					</li>
					<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-course">나의 코스 보기</a></li>
					<li id="menuList"><a href="${pageContext.request.contextPath}/my-page/my-report">나의 기록 보기</a></li>
				</ol>
			</div>
			
			<div class="menu2">
				<ol>
					<li id="bookmark"><a href="${pageContext.request.contextPath}/my-page/bookmark">즐겨찾기 <img class="bmStar" src="${pageContext.request.contextPath}/assets/image/my-page/star.png"></a></li>
					<li class="bookmark-btn">
						<img class="plus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/plus.png">&nbsp; 
						<img class="minus-btn" src="${pageContext.request.contextPath}/assets/image/my-page/minus.png">
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">서울 근교 코스 </a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">				
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">웃겨 자빠질 코스</a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
					</li>
					<li id="menuList">
						<a href="${pageContext.request.contextPath}/my-page/bookmark/01">기어가는 코스</a>
						<img class="editName" src="${pageContext.request.contextPath}/assets/image/my-page/edit.png">
					</li>
				</ol>
			</div>
			
			<div class="menu3">
				<ol>
					<li id="members"><p><a href="">회원정보수정 <img id="setting" src="${pageContext.request.contextPath}/assets/image/my-page/setting.png"></a></p></li>
				</ol>
			</div>
		</div>
		
		<div class="subHeader">
			<a href="${pageContext.request.contextPath}/my-page/menu"><img class="menuBar-open" src="${pageContext.request.contextPath}/assets/image/my-page/menu.png"></a>
			<p id="title">마이페이지 <img class="myHome" src="${pageContext.request.contextPath}/assets/image/my-page/house.png"></p>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		<div class="resultView">
			<div class="resultList">
				<p id="listTitle">나의 기록 보기</p>
				<div class="myReport">
					<div id="calendar">
						<div id="dateForm">
							<!-- <p id="calDate">2022년 3월</p> -->
							<!-- <input id="dateSearch" type="date"> -->
						</div>
						<div id="calendar"></div>
					</div>
				
					
					<div id="reportList">
						<div class="listTitle">
							<p class="monthReport">이달의 기록</p>
							<p class="todayReport">오늘의 기록</p>
						</div>
						<ul class="reportBox">	
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle"><p class="date" id="nows"></p></p>
									<p class="content">링거 맞고 뛰었다^^</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">우앙우앙우앙</p>
									<p class="content">우앙우앙우앙^^</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">산책 재밌다</p>
									<p class="content">산책 다녀왔는데 좋았네</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">무더위</p>
									<p class="content">요즘 날씨 미친거 같다</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
							<li class="reportContent">
								<div style="cursor: pointer;" onclick="window.location='';">
									<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">
									<p class="contentTitle">살려줘ㅠㅠ</p>
									<p class="content">html/css너무 귀찮다ㅠㅠ</p>
									<p class="contentDate">2022.07.18 &nbsp; 10:03</p>
									<div class="modify-del-icons">
										<span class="glyphicon glyphicon-pencil"></span>&nbsp;
										<span class="glyphicon glyphicon-trash"></span>
									</div>
								</div>
							</li>
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


</body>

<!-- 달력 API 구현 -->
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
    	/* dayPopoverFormat: event-popover, */
    	editable: false,
		selectable: true,
		businessHours: true,	//주말 구분;
		dayMaxEvents: false, // allow "more" link when too many events
		events: [	//나의 기록 여기다가 추가해야할 듯?
			{
	          title: '테스트 코스',
	          start: '2022-08-01',
	          textcolor: 'white',
			},
	        {
	          title: '88길',
	          start: '2022-08-08',
	        },
	        {
	          groupId: 999,
	          title: '학원 가는 길',
	          start: '2022-08-10'
	        },
	        {
	          groupId: 999,
	          title: '집에 가는 길',
	          start: '2022-08-10'
	        },
	        {
	          title: '새로운 길',
	          start: '2022-08-12',
	         },
	        {
	          title: '이쁜 길',
	          start: '2022-08-15',
	        },
	        {
	          title: '데이트 코스',
	          start: '2022-08-18'
	        }
				
				
				
				
		/* {
          title: 'All Day Event',
          start: '2020-09-01'
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2020-09-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-09-11',
          end: '2020-09-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-09-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-09-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-09-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-09-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        } */
      ]
    });
    
	
    
    calendar.render();
    
  });

  
  
</script>
</html>