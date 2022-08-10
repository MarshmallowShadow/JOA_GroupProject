// 날씨 api 구현 

$(document).ready(function(position){
	
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
		console.warn('ERROR(' + err.code + '): ' + err.message);
	};
	
	navigator.geolocation.getCurrentPosition(success, error, options);
	
	var wAPI = 'ddeb92652c34f9e77a6961c434afa555'
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
	
