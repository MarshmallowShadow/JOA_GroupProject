
$(document).ready(function(){
	/*------------지도------------*/
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

$("#btn-cate").on("click", function(){
	$("#btn-cate").toggleClass("fmenu-btn-selected");
	$("#btn-cate").toggleClass("fmenu-btn");
	$("#icon-cate").toggleClass("glyphicon-menu-down");
	$("#icon-cate").toggleClass("glyphicon-menu-up");
	//console.log("cate");
});

$("#btn-dist").on("click", function(){
	$("#btn-dist").toggleClass("fmenu-btn-selected");
	$("#btn-dist").toggleClass("fmenu-btn");
	$("#icon-dist").toggleClass("glyphicon-menu-down");
	$("#icon-dist").toggleClass("glyphicon-menu-up");
	//console.log("dist");
});

$("#btn-diff").on("click", function(){
	$("#btn-diff").toggleClass("fmenu-btn-selected");
	$("#btn-diff").toggleClass("fmenu-btn");
	$("#icon-diff").toggleClass("glyphicon-menu-down");
	$("#icon-diff").toggleClass("glyphicon-menu-up");
	//console.log("diff");
});





$("#btn-cate").on("focusout", function(){
	$("#btn-cate").removeClass("fmenu-btn-selected");
	$("#btn-cate").addClass("fmenu-btn");
	$("#icon-cate").addClass("glyphicon-menu-down");
	$("#icon-cate").removeClass("glyphicon-menu-up");
	//console.log("cate out");
});

$("#btn-dist").on("focusout", function(){
	$("#btn-dist").removeClass("fmenu-btn-selected");
	$("#btn-dist").addClass("fmenu-btn");
	$("#icon-dist").addClass("glyphicon-menu-down");
	$("#icon-dist").removeClass("glyphicon-menu-up");
	//console.log("dist out");
});

$("#btn-diff").on("focusout", function(){
	$("#btn-diff").removeClass("fmenu-btn-selected");
	$("#btn-diff").addClass("fmenu-btn");
	$("#icon-diff").addClass("glyphicon-menu-down");
	$("#icon-diff").removeClass("glyphicon-menu-up");
	//console.log("diff out");
});





$("#btn-loc").on("click", function(){
	$("#search-input").data("cate", "location");
	$(this).removeClass("btn-grey");
	$(this).addClass("btn-blue");
	$("#btn-title").removeClass("btn-blue");
	$("#btn-title").addClass("btn-grey");
});

$("#btn-title").on("click", function(){
	$("#search-input").data("cate", "title");
	$(this).removeClass("btn-grey");
	$(this).addClass("btn-blue");
	$("#btn-loc").removeClass("btn-blue");
	$("#btn-loc").addClass("btn-grey");
});


