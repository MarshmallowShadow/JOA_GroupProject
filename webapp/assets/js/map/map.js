

var lat = 33.450701;
var lon = 126.570667;

$(document).ready(function(){
	$("#rdo-loc").prop("checked", true);
	
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
		
			lat = position.coords.latitude; // 위도
			lon = position.coords.longitude; // 경도
			console.log(lat);
			console.log(lon);
			
			var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
	
			// 접속 위치 변경
			map.setCenter(locPosition); 
		    
		});
		
	} else { // HTML5의 GeoLocation을 사용할 수 없을때
		
		var locPosition = new kakao.maps.LatLng(lat, lon); 
		
		// 접속 위치 변경
		map.setCenter(locPosition); 
	}
});

$(window).load(function(){
	/*------------주변 추천------------*/
	
	var kMap = {
		searchCate: "location",
		x: lat,
		y: lon
	}
	
	console.log(kMap);
	
	showList(kMap);
});


$("#btn-cate").on("click", function(){
	showMenu("cate");
});
$("#btn-cate").on("mousedown", function(e){
	e.preventDefault();
});

$("#btn-dist").on("click", function(){
	showMenu("dist");
});
$("#btn-dist").on("mousedown", function(e){
	e.preventDefault();
});

$("#btn-diff").on("click", function(){
	showMenu("diff");
});
$("#btn-diff").on("mousedown", function(e){
	e.preventDefault();
});


$("#menu-cate").on("focusout", function(){
	hideMenu("cate");
});

$("#menu-dist").on("focusout", function(){
	hideMenu("dist");
});

$("#menu-diff").on("focusout", function(){
	hideMenu("diff");
});





$("#btn-loc").on("click", function(){
	$(this).removeClass("btn-grey");
	$(this).addClass("btn-blue");
	$("#btn-title").removeClass("btn-blue");
	$("#btn-title").addClass("btn-grey");
});

$("#btn-title").on("click", function(){
	$(this).removeClass("btn-grey");
	$(this).addClass("btn-blue");
	$("#btn-loc").removeClass("btn-blue");
	$("#btn-loc").addClass("btn-grey");
});



$("#search-form").on("submit", function(){
	
	
	return false;
});



//--------------------functions--------------------//

var showMenu = function(type){
	$("#btn-" + type).toggleClass("fmenu-btn-selected");
	$("#btn-" + type).toggleClass("fmenu-btn");
	$("#icon-" + type).toggleClass("glyphicon-menu-down");
	$("#icon-" + type).toggleClass("glyphicon-menu-up");
	
	if($("#btn-" + type).hasClass("fmenu-btn-selected")) {
		$("#menu-" + type).css("display", "block");
		$("#menu-" + type).focus();
	} else {
		$("#menu-" + type).css("display", "none");
	}
};

var hideMenu = function(type){
	$("#btn-" + type).removeClass("fmenu-btn-selected");
	$("#btn-" + type).addClass("fmenu-btn");
	$("#icon-" + type).addClass("glyphicon-menu-down");
	$("#icon-" + type).removeClass("glyphicon-menu-up");
	
	$("#menu-" + type).css("display", "none");
}

var showList = function(kMap) {
	$.ajax({
		url : contextPath + "/api/map/getList",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(kMap),
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			if(result.length > 0){
				$("#result-list").html("<ul></ul>");
				for(var i=0; i<result.length; i++){
					render(result[i]);
					
					
				}
			} else {
				$("#result-list").html("");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};

var render = function(cMap){
	
	var hr = cMap.COURSE_TIME / 60;
	var min = cMap.COURSE_TIME % 60;
	var time = "";
	
	if(hr > 0) {
		time += hr + "시간 ";
	}
	if (min > 0 || hr == 0) {
		time += min + "분";
	}
	
	var item = "";
	item += '<div class="course-container" onclick="window.open(\'${pageContext.request.contextPath }/course/view?courseNo=' + cMap.COURSE_NO + '\', \'_blank\');">';
	item += '	<div class="course-info">';
	item += '	<div class="course-icon">';
	item += '		<img src="${pageContext.request.contextPath }/assets/image/map/map-icon.jpg">';
	item += '	</div>';
	item += '		<h3 class="course-title">' + cMap.TITLE + '</h3>';
	item += '		<p class="p-info">';
	item += '			작성자:' + cMap.ID + ' <br>';
	item += '			거리: ' + cMap.DISTANCE + 'km' + ' <br>';
	item += '			시간: ' + time;
	item += '		</p>';
	item += '		<div class="tag-blue"><p>' + cMap.COURSE_CATEGORY + '</p></div>';
	item += '		<div class="tag-pink"><p>' + cMap.DIFFICULTY + '</p></div>';
	item += '	</div>';
	item += '</div>';
	
	
	$("#result-list ul").append(item);
}


var addPoint = function(x, y){
	
}