// 날씨 api 구현 

$(document).ready(function(position){
	
	//위치 모를 때 기본은 서울
	var lat = 37.5683;
	var lon = 126.9778;
	
	var options = {
		enableHighAccuracy : true,		//배터리를 더 소모해서 더 정확한 위치를 찾음
		timeout : 5000,					//주어진 초 안에 찾지 못하면 에러 발생
		maximumAge : 0					//한 번 찾은 위치 정보를 해당 초만큼 캐싱
	};
	function success(pos) {		
		var crd = pos.coords;			//pos : 카카오 좌표 객체, coords : 객체의 위도,경도 불러오기
		console.log('위도 : ' + crd.latitude);
		console.log('경도: ' + crd.longitude);
		lat = crd.latitude;
		lon = crd.longitude;
	};
	
	function error(err) {
		console.warn('ERROR(' + err.code + '): ' + err.message);
	};
	
	navigator.geolocation.getCurrentPosition(success, error, options);
	
	let wAPI = 'ddeb92652c34f9e77a6961c434afa555'
	//var url = 'https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' +lon+ '&appid=' + '9e59ce9dcb1014633e13dc6b7a7ffa54' + &units=metric';
	
	
    $.ajax({
		url: 'https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&appid=' + wAPI + '&units=metric',
        dataType: 'json',
        type: 'POST',
       	//data: {'lat' : LAT, 'lon' : LON},
        success:function(result){
        	
        	// 보여질 정보
        	$('.city').append(result.name);
			$('.ctemp').append(result.main.temp);
			$('.lowtemp').append(result.main.temp_min);
			$('.hightemp').append(result.main.temp_max);
			$('.humidity').append(result.main.humidity);
			$('.wind').append(result.wind.speed);
			
			//아이콘
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.weather[0].icon +
			'.png" alt="'+result.weather[0].description +'">'
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
				return mo + '월' + d + '일' + '  '+ hr + ':' + m + ':' + s;
			}
			
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);
        	}
   		})
   		//console.log(url);
	});
	
