
//기본 지도 변수들

//위치 정보 차단 경우 기본 좌표
var lat = 33.450701;
var lon = 126.570667;
var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

//마커 배열
var markerList = [];

$(document).ready(function(){
	$("#rdo-loc").prop("checked", true);
	
	/*------------지도------------*/
	
	//지도 정보
	var mapContainer = document.getElementById('map-info');
	var mapOption = {
		center: new kakao.maps.LatLng(lat, lon), //지도 중심좌표
		level: 5, //지도의 레벨(확대, 축소 정도)
	};
	
	// 이미지 지도 생성
	//var map = new kakao.maps.StaticMap(mapContainer, mapOption);
	map = new kakao.maps.Map(mapContainer, mapOption); //지도에 그릴 선 담을 배열
	
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
		
		locPosition = new kakao.maps.LatLng(lat, lon); 
		
		// 접속 위치 변경
		map.setCenter(locPosition); 
	}
	
	
	//마커 이미지 설정
	imageSrc1 = contextPath+'/assets/image/course/pin-b.png',
	imageSrc2 = contextPath+'/assets/image/course/pin-r.png',
	imageSize = new kakao.maps.Size(32, 32),
	imageOption = {offset: new kakao.maps.Point(16, 32)};
	
	blueMarker = new kakao.maps.MarkerImage(imageSrc1, imageSize, imageOption);
	pinkMarker = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption);
	
	
});

$(window).load(function(){
	/*------------주변 추천------------*/
	
	var kMap = {
		searchCate: "location",
		x1: lon - 0.05,
		y1: lat - 0.03,
		x2: lon + 0.05,
		y2: lat + 0.03
	}
	
	console.log(kMap);
	
	//코스 현제 위치 위주로 추천
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
	var searchCate = $("input[name=searchCate]:checked").val();
	var keyword = $("input[name=keyword]").val();
	
	console.log(searchCate);
	console.log(keyword);
	
	var kMap = {
		searchCate: searchCate
	};
	
	if(searchCate == "title") {
		//제목별 검색
		kMap["keyword"] = "%" + keyword + "%";
		
		showList(kMap);
	} else {
		//카카오로 좌표 가져오기
		var ps = new kakao.maps.services.Places();
		ps.keywordSearch(keyword, function(result, status){
			var x1 = 0;
			var x2 = 0;
			var y1 = 0;
			var y2 = 0;
			
			if (status === kakao.maps.services.Status.OK) {
				x1 = result[0].x - 0.05;
				y1 = result[0].y - 0.03;
				x2 = result[0].x + 0.05;
				y2 = result[0].y + 0.03;
				
				for(var i=1; i<result.length; i++){
					if(result[i].x < x1){
						x1 = result[i].x;
					}
					if(result[i].x > x2){
						x2 = result[i].x;
					}
					if(result[i].y < y1){
						y1 = result[i].y;
					}
					if(result[i].y > y2) {
						y2 = result[i].y;
					}
				}
				
				kMap["x1"] = x1;
		    	kMap["x2"] = x1;
				kMap["y1"] = y1;
				kMap["y2"] = y2;
				
				showList(kMap);
        	}
		});
	}
	
	console.log(kMap);
	
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
};

var showList = function(kMap) {
	
	$.ajax({
		url : contextPath + "/api/map/getList",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(kMap),
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			
			//마커 배열 지우기
			for( var i=0; i < markerList.length; i++) {
				markerList[i].setMap(null);
			}
			markerList = [];
			
			if(result.length > 0){
				//리스트 비우기
				$("#result-list").html("<ul></ul>");
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        		// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();
				
				//리스트 하나씩 생성
				for(var i=0; i<result.length; i++){
					//리스트 생성
					render(result[i]);
					
					//지도에 마커 추가
					markerList.push(addPoint(result[i].X1, result[i].Y1));
					
					//범위 넓이기
					bounds.extend(new kakao.maps.LatLng(result[i].Y1, result[i].X1));
				}
				
				//범위 재설정
				map.setBounds(bounds);
			} else {
				$("#result-list").html("");
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
};

var render = function(cMap) {
	
	var hr = Math.floor(cMap.COURSE_TIME / 60);
	var min = cMap.COURSE_TIME % 60;
	var time = "";
	
	if(hr > 0) {
		time += hr + "시간 ";
	}
	if (min > 0 || hr == 0) {
		time += min + "분";
	}
	
	var imgPath = contextPath + '/assets/image/map/map-icon.jpg';
	if(cMap.FILE_PATH != undefined) {
		imgPath = cMap.FILE_PATH;
	}
	
	var item = "";
	item += '<li>';
	item += '<div class="course-container" onclick="window.open(\'' + contextPath + '/course/view?courseNo=' + cMap.COURSE_NO + '\', \'_blank\');">';
	item += '	<div class="course-icon">';
	item += '		<img src="' + imgPath + '">';
	item += '	</div>';
	item += '	<div class="course-info">';
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
	item += '</li>';
	
	
	$("#result-list ul").append(item);
}


var addPoint = function(x, y){
	var coords = new kakao.maps.LatLng(y, x);
	var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            image: blueMarker
    });
    
    return marker;
}
