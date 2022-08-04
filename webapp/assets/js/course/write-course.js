/**
 * 코스 작성하기 js
 */
 
$(document).ready(function() {
	console.log("페이지 준비");
	
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3 //지도의 레벨(확대, 축소 정도)
	}
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성
	
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옴
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
	        
	        // 마커 표시
	        displayMarker(locPosition);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667); 
	        
	    displayMarker(locPosition);
	}
	
	// 현재 위치 마커 표시
	function displayMarker(locPosition) {
	
	    // 마커 생성
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 

	    // 접속 위치 변경
	    map.setCenter(locPosition);      
	}    
});



