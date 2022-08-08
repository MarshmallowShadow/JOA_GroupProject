<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA Main</title>

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet"  type="text/css">


</head>
<body>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
<!--메인 해더 자리 -->

<!------------------------- 날씨 api ------------------------>
	<div class="weather">
		<ul>
			<li class="time">현재 시간 : </li>
			<li class="ctemp">온도 : </li>
			<li class="hightemp">최고 온도 : </li>
			<li class="lowtemp">최저 온도 : </li>
			<li class="humidity">습도 : </li>
			<li class="rain">강수량 : </li>
			<li class="wind">풍속 : </li>
			<li class="icon"></li>
		</ul>
		<button onclick="javascript:goSearch();">현재 위치 날씨 검색</button>
	</div>

<!------------------------- photo slider ------------------------>	

	<div class="slide slide_wrap">
			<div class="slide_item item1"><img src="${pageContext.request.contextPath }/assets/image/main/swiss.jpg">
			</div>
			<div class="slide_item item2"><img src="${pageContext.request.contextPath }/assets/image/main/paris.jpg">
			</div>
			<div class="slide_item item3"><img src="${pageContext.request.contextPath }/assets/image/main/parispark.jpg">
			</div>
			<div class="slide_item item4"><img src="${pageContext.request.contextPath }/assets/image/main/parispark.jpg">
			</div>

		<div class="slide_prev_button slide_button">◀</div>
		<div class="slide_next_button slide_button">▶</div>
		<ul class="slide_pagination"></ul>
	</div>
	
<!------------------------- 글귀 ------------------------>

<div id="wrap">
		<div class="main-text">
			<p>살아 숨쉬는 자연에서 <br><br><br> 운동을 시작하다.
			</p>
			<br> <br> <br>
			<p>
				<br><br><span>J<marquee width="35px" height="15px" scrolldelay="400" direction="up">oyful</marquee> O<marquee width="45px" height="15px" scrolldelay="400" direction="up">utdoor</marquee> A<marquee width="40px" height="15px" scrolldelay="400" direction="up">ctivity</marquee></span>
			</p>
		</div>
</div>

<!------------------------ footer ------------------------>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>

<!-- js -->
<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main/main.js"></script>
<!-- <script src="${pageContext.request.contextPath}/assets/js/main/weather.js"></script> -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=ddeb92652c34f9e77a6961c434afa555&units=metric',
		function(result){
		
			$('.ctemp').append(result.main.temp);
			$('.lowtemp').append(result.main.temp_min);
			$('.hightemp').append(result.main.temp_max);
			$('.humidity').append(result.main.humidity);
			//$('.rain').append(result.rain.rain);
			$('.wind').append(result.wind.speed);
			
			//result.weather[0].icon
			var wiconUrl = '<img src="http://openwethermap.org/img/wn/'+ result.weather[0].icon +
			'.png" alt="'+result.weather[0].description +'">'
			$('.icon').html(wiconUrl);
			
			var ct = result.dt;
			
			function convertTime(t) {
				var ot = new Date(t * 1000);
				
				var hr = ot.getHours();
				var m = ot.getMinutes();
				var s = ot.getSeconds();
				var mo = ot.getMonth() + 1;
				var d = ot.getDate();
				
				//return ot;
				return mo + '월' + d + '일' + '  '+ hr + ':' + m + ':' + s;
			}
			
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);
	});
	
</script>

</html>