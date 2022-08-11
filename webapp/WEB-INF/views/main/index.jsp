<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA Main</title>

<!-- CSS -->
<link
	href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/main.css"
	rel="stylesheet" type="text/css">


</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!--메인 해더 자리 -->

	<!------------------------- 날씨 api ------------------------>

	<div class="weather">
		<ul>
			<li class="city"></li>
			<li class="time">현재 시간 : </li>
			<li class="ctemp">온도 : </li>
			<li class="hightemp">최고 온도 : </li>
			<li class="lowtemp">최저 온도 : </li>
			<li class="humidity">습도 : </li>
			<li class="wind">풍속 : </li>
			<li class="icon"></li>
		</ul>
	</div>

	<!------------------------- photo slider ------------------------>

	<div class="slide slide_wrap">
		<div class="slide_item item1">
			<img src="${pageContext.request.contextPath }/assets/image/main/swiss.jpg">
		</div>
		<div class="slide_item item2">
			<img src="${pageContext.request.contextPath }/assets/image/main/paris.jpg">
		</div>
		<div class="slide_item item3">
			<img src="${pageContext.request.contextPath }/assets/image/main/parispark.jpg">
		</div>
		<div class="slide_item item4">
			<img src="${pageContext.request.contextPath }/assets/image/main/parispark.jpg">
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
				<br>
				<br>
				<span>J<marquee width="35px" height="15px" scrolldelay="400" direction="up">oyful</marquee> O<marquee width="45px"
						height="15px" scrolldelay="400" direction="up">utdoor</marquee> A<marquee width="40px" height="15px" scrolldelay="400" direction="up">ctivity</marquee></span>
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

<!-- 날씨 api 주소 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 날씨 api 구현 -->
<script>
	$(document).ready(function(position) {

		//위치 측정 불가인 경우 기본 경/위도 : 서울
		var lat = 37.5683;
		var lon = 126.9778;

		var options = {
			enableHighAccuracy : true,
			timeout : 5000,
			maximumAge : 0
		};

		function success(pos) {
			var crd = pos.coords;
			
			console.log('위도 : ' + crd.latitude);
			console.log('경도: ' + crd.longitude);
			lat = crd.latitude;
			lon = crd.longitude;
		};

		function error(err) {
			console.warn('ERROR(' + err.code + '): '
					+ err.message);
		};

		navigator.geolocation.getCurrentPosition(success, error, options);

		var wAPI = 'ddeb92652c34f9e77a6961c434afa555'
		//var url = 'https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' +lon+ '&appid=' + '9e59ce9dcb1014633e13dc6b7a7ffa54' + &units=metric';

		$.ajax({
				url : 'https://api.openweathermap.org/data/2.5/weather?lat='+ lat+ '&lon=' + lon + '&appid=' + wAPI + '&units=metric',
				dataType : 'json',
				type : 'POST',
				success : function(result) {

				// 보여질 정보
				$('.city').append(result.name);
				$('.ctemp').append(result.main.temp);
				$('.lowtemp').append(result.main.temp_min);
				$('.hightemp').append(result.main.temp_max);
				$('.humidity').append(result.main.humidity);
				$('.wind').append(result.wind.speed);

				//아이콘
				var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.weather[0].icon + '.png" alt="'+result.weather[0].description +'">'
				$('.icon').html(wiconUrl);

				//현재시간
				var ct = result.dt;

				function convertTime(t) {
					var ot = new Date(t * 1000);

					var hr = ot.getHours();
					var m = ot.getMinutes();
					var s = ot.getSeconds();
					var mo = ot.getMonth() + 1;
					var d = ot.getDate();

					//return ot;
					return mo + '월' + d + '일' + '  '
							+ hr + ':' + m + ':' + s;
				}

				//경보 알림
				if (result.main.temp >= 35) {
					alert("더운 날씨가 예상됩니다. 야외활동에 주의하십시오.");

				} else if (result.main.temp <= -10) {
					alert("강추위가 예상됩니다. 야외활동에 주의하십시오.");

				} else if (result.wind.speed >= 5) {
					alert("강한 바람이 예상됩니다. 야외활동에 주의하십시오.")
				};

				var currentTime = convertTime(ct);
				$('.time').append(currentTime);
			}
	})
});
</script>

</html>