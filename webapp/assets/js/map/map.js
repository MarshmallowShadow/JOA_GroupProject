
$(document).ready(function(){
	/*
	$(window).on("click", function(){
		$(".fmenu").css("display", "none");
		$(".fmenu-btn-selected").addClass("fmenu-btn");
		$(".fmenu-btn").removeClass("fmenu-btn-selected");
	});
	*/
	
	$("#btn-cate").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("cate");
	});
	
	$("#btn-dist").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("dist");
	});
	
	$("#btn-diff").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("diff");
	});
	
	
	/*------------지도-------------------------------------------------------------------*/
   //지도 정보
   var mapContainer = document.getElementById('map-info');
   var mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
      level: 3, //지도의 레벨(확대, 축소 정도)
   };
   
   // 이미지 지도 생성
   //var map = new kakao.maps.StaticMap(mapContainer, mapOption);
   var map = new kakao.maps.Map(mapContainer, mapOption); //지도에 그릴 선 담을 배열
   
   if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옴
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성

	        // 접속 위치 변경
   			map.setCenter(locPosition); 
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667); 
	        
	    // 접속 위치 변경
	    map.setCenter(locPosition); 
	}
});


