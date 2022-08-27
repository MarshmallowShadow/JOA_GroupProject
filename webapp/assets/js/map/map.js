
//기본 지도 변수들

//위치 정보 차단 경우 기본 좌표
var lat = 33.450701;
var lon = 126.570667;
var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

//마커 배열
var markerList = [];

//선택 마커
var selectedMarker = null;

//인포윈도우
var overlay = null;

//지도 검색 정보
var kMap = {
	searchCate: "title",
	keyword: '',
	x1: 0,
	x2: 0,
	y1: 0,
	y2: 0
};

$(document).ready(function(){
	//초기화
	$("#rdo-loc").prop("checked", true);
	resetFilters();
	
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
			//console.log(lat);
			//console.log(lon);
			
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
	
	kMap = {
		searchCate: "location",
		x1: lon - 0.05,
		y1: lat - 0.03,
		x2: lon + 0.05,
		y2: lat + 0.03
	}
	
	//console.log(kMap);
	
	//코스 현제 위치 위주로 추천
	getList(kMap);
});

/* ************************* menu-slider ************************* */

let sliderOne = document.getElementById("slider-1");
let sliderTwo = document.getElementById("slider-2");
let displayValOne = document.getElementById("range1");
let displayValTwo = document.getElementById("range2");
let minGap = 0;
let sliderTrack = document.querySelector(".slider-track");
let sliderMaxValue = document.getElementById("slider-1").max;
function slideOne(){
    if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
        sliderOne.value = parseInt(sliderTwo.value) - minGap;
    }
    displayRange();
    fillColor();
}
function slideTwo(){
    if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
        sliderTwo.value = parseInt(sliderOne.value) + minGap;
    }
    displayRange();
    fillColor();
}
function displayRange(){
	displayValOne.textContent = sliderOne.value + " km";
	displayValTwo.textContent = sliderTwo.value + " km";
	
	if((sliderOne.value == sliderTwo.value && sliderOne.value != 50)
			|| (sliderOne.value == 1 && sliderTwo.value == 50)) {
		
		displayValOne.textContent = "";
		$("#range-sign").html("");
		
		if(sliderTwo.value == 1){
			displayValTwo.textContent = sliderTwo.value + " km 이하";
		}
	} else {
		displayValOne.textContent = sliderOne.value + "km";
		$("#range-sign").html("~");
		
		if(sliderOne.value == 1 && sliderTwo.value != 50){
			displayValOne.textContent = sliderOne.value + " km 이하";
		}
	}
	
	
	if(sliderTwo.value == 50){
		displayValTwo.textContent = '무제한';
	}
	
	if(sliderOne.value == 50){
		$("#slider-2").css("z-index", "900");
	} else {
		$("#slider-2").css("z-index", "902");
	}
}

function fillColor(){
    percent1 = (sliderOne.value / sliderMaxValue) * 100;
    percent2 = (sliderTwo.value / sliderMaxValue) * 100;
    sliderTrack.style.background = `linear-gradient(to right, #dadae5 ${percent1}% , #3264fe ${percent1}% , #3264fe ${percent2}%, #dadae5 ${percent2}%)`;
}


/* ************************* UI Functions ************************* */

$(window).click(function() {
	hideMenu("cate");
	hideMenu("dist");
	hideMenu("diff");
});

$("#btn-cate").on("click", function(){
	hideMenu("dist");
	hideMenu("diff");
	showMenu("cate");
});

$("#btn-dist").on("click", function(){
	hideMenu("cate");
	hideMenu("diff");
	showMenu("dist");
});

$("#btn-diff").on("click", function(){
	hideMenu("cate");
	hideMenu("dist");
	showMenu("diff");
});

$("#btn-reset").on("click", function(){
	var reset = confirm("필터를 초기화 하시겠습니까?");
	if(reset) {
		resetFilters();
		getList(kMap);
	}
});

//필터 옵션 선택 시
$(".menu-option").on("click", function(){
	if($(this).children(".menu-chk").is(":checked") == true) {
		$(this).children("img").attr("src", contextPath + "/assets/image/map/check_on.png");
	} else {
		$(this).children("img").attr("src", contextPath + "/assets/image/map/check_off.png");
	}
	
	getList(kMap);
});

$(".slider").on("mouseup", function(){
	//console.log("YESSSSSSSSSS");
	getList(kMap);
});

$(".menu-option, .menu-chk").on("mousedown", function(e){
	e.preventDefault();
});

$("#btn-cate, #btn-dist, #btn-diff, #menu-cate, #menu-dist, #menu-diff").on("click", function(event){
	event.stopPropagation();
});


//검색 항목 바꾸기
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


//검색
$("#search-form").on("submit", function(){
	//마커 창 초기화
	resetMap();
	
	var searchCate = $("input[name=searchCate]:checked").val();
	var keyword = $("input[name=keyword]").val();
	
	console.log(searchCate);
	console.log(keyword);
	
	kMap["searchCate"] = searchCate;
	
	if(searchCate == "title") {
		//제목별 검색
		kMap["keyword"] = "%" + keyword + "%";
		
		getList(kMap);
		
	} else {
		//카카오로 좌표 가져오기
		var ps = new kakao.maps.services.Places();
		ps.keywordSearch(keyword, function(result, status){
			//지역별 검색
			var x1 = 0;
			var x2 = 0;
			var y1 = 0;
			var y2 = 0;
			
			if (status === kakao.maps.services.Status.OK) {
				//결과 있으면 기본값 설정
				x1 = parseInt(result[0].x) - 0.05;
				y1 = parseInt(result[0].y) - 0.03;
				x2 = parseInt(result[0].x) + 0.05;
				y2 = parseInt(result[0].y) + 0.03;
				
				//최대 최소값 조절하기
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
					
					//console.log(result[i].x);
					//console.log(result[i].y);
				}
        	}
        	
        	kMap["x1"] = x1;
		    kMap["x2"] = x2;
			kMap["y1"] = y1;
			kMap["y2"] = y2;
			
        	getList(kMap);	
		});
	}
	
	console.log(kMap);
	
	return false;
});



//--------------------functions--------------------//
var resetFilters = function(){
	$("#slider-one").val(0);
	$("#slider-two").val(50);
	
	slideOne();
    slideTwo();
	
	$("#chk-walk").prop("checked", true);
	$("#chk-jogging").prop("checked", true);
	$("#chk-running").prop("checked", true);
	$("#chk-marathon").prop("checked", true);
	$("#chk-bicycle").prop("checked", true);
	$("#chk-draw").prop("checked", true);
	
	$("#chk-easy").prop("checked", true);
	$("#chk-normal").prop("checked", true);
	$("#chk-hard").prop("checked", true);
}

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

var getList = function(kMap) {
	
	$.ajax({
		url : contextPath + "/api/map/getList",
		async: false,
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
			
			var diffFilter = [];
			var cateFilter = [];
			
			//난이도 필터링
			if($('#chk-easy').is(':checked') == false){
				diffFilter.push("쉬움");
			} 
			if($('#chk-normal').is(':checked') == false){
				diffFilter.push("보통");
			} 
			if($('#chk-hard').is(':checked') == false){
				diffFilter.push("어려움");
			}
			
			if($('#chk-walk').is(':checked') == false){
				cateFilter.push("산책");
			} 
			if($('#chk-jogging').is(':checked') == false){
				cateFilter.push("조깅");
			} 
			if($('#chk-running').is(':checked') == false){
				cateFilter.push("러닝");
			} 
			if($('#chk-marathon').is(':checked') == false){
				cateFilter.push("마라톤");
			} 
			if($('#chk-bicycle').is(':checked') == false){
				cateFilter.push("자저거");
			} 
			if($('#chk-draw').is(':checked') == false){
				cateFilter.push("그림");
			}
			
			//필터링 (종목, 난이도)
			for(var i=0; i<result.length; i++){
				var deleted = false;
				
				for(var j=0; j<diffFilter.length; j++){
					//console.log(result[i]);
					//console.log(diffFilter[j]);
					
					if(result[i].DIFFICULTY == diffFilter[j]){
						result.splice(i, 1);
						i--;
						deleted = true;
						//console.log("REDACTED");
						break;
					}
				}
				if(deleted == true){
					continue;
				}
				for(var j=0; j<cateFilter.length; j++){
					if(result[i].COURSE_CATEGORY == cateFilter[j]){
						result.splice(i, 1);
						i--;
						//console.log("CLOSE BUT REDACTED");
						break;
					}
				}
				if(deleted == true){
					continue;
				}
			}
			
			//필터링 (길이)
			var min = $("#slider-1").val();
			var max = $("#slider-2").val();
			
			//console.log(min);
			//console.log(max);
			
			for(var i=0; i<result.length; i++){
				if(result[i].DISTANCE < min && min != 1){
					result.splice(i, 1);
					i--;
					continue;
				}
				if(result[i].DISTANCE > max && max != 50){
					result.splice(i, 1);
					i--;
					continue;
				}
			}
			
			if(result.length > 0){
				//리스트 비우기
				$("#result-list").html("<ul></ul>");
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();
				
				//리스트 하나씩 생성
				for(var i=0; i<result.length; i++){
					//검색 결과 내용 진열
					render(result[i]);
					
					//마커 생성
					var marker = addPoint(result[i].X1, result[i].Y1, result[i].COURSE_NO, result[i].TITLE);
					
					//지도에 마커 추가
					markerList.push(marker);
					
					//범위 넓이기
					bounds.extend(new kakao.maps.LatLng(result[i].Y1, result[i].X1));
				}
				
				//범위 재설정
				map.setBounds(bounds);
			} else {
				renderEmpty();
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};

var render = function(cMap) {
	//시간 display 설정
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
		imgPath = contextPath + cMap.FILE_PATH;
	}
	
	var id = cMap.ID;
	if(id.length > 9) {
		id = id.substring(0,7) + '...';
	}
	
	//코스 제목 길이 줄이기
	var title = cMap.TITLE;
	if(title.length > 7) {
		title = title.substring(0, 7) + "...";
	}
	
	var item = "";
	item += '<li>';
	item += '<div id="c' + cMap.COURSE_NO + '" class="course-container">';
	item += '	<div class="course-icon">';
	item += '		<img src="' + imgPath + '">';
	item += '	</div>';
	item += '	<div class="course-info">';
	item += '		<h3 class="course-title">' + title + '</h3>';
	item += '		<p class="p-info">';
	item += '			작성자 | ' + id + ' <br>';
	item += '			거리 | ' + cMap.DISTANCE + 'km' + ' <br>';
	item += '			시간 | ' + time;
	item += '		</p>';
	item += '		<div class="tag-blue"><p>' + cMap.COURSE_CATEGORY + '</p></div>';
	item += '		<div class="tag-pink"><p>' + cMap.DIFFICULTY + '</p></div>';
	item += '	</div>';
	item += '</div>';
	item += '</li>';
	
	
	$("#result-list ul").append(item);
};

var renderEmpty = function(){
	var str = "";
	str += '<div id="no-result">';
	str += '	<h3>코스가 없습니다 ㅠㅠ</h3>';
	str += '	<p>코스를 새로 등록해보세요!</p>';
	str += '	<button id="btn-write-form" onclick="window.open(\'' + contextPath + '/course/write\');">코스 등록하기</button>';
	str += '</div>';
	
	$("#result-list").html(str);
};

//마커, 마커 클릭 이벤트 추가
var addPoint = function(x, y, courseNo, title){
	var coords = new kakao.maps.LatLng(y, x);
	var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            image: blueMarker,
            clickable: true
    });
    
    kakao.maps.event.addListener(marker, 'click', function(){
		if(selectedMarker != marker) {
			
			highlight(marker, courseNo, title);
			
			//선택된 코스로 이동 (animation needs checking)
			$('#result-list').animate({ scrollTop: $('.selected').offset().top - ($('#result-list').offset().top - $('#result-list').scrollTop())}, 'slow');
		} else {
			highlightOff(marker, courseNo);
		}
	});
	
	$('#c' + courseNo).on('click', function(){
		if(selectedMarker != marker) {
			highlight(marker, courseNo, title);
			
			//마커 위치로 이동
			map.panTo(coords);
		} else {
			window.open(contextPath + '/course/view?courseNo=' + courseNo, '_blank');
		}
	});
    
    return marker;
};

//마커 코스 컨테이너 색 변경
var highlight = function(marker, courseNo, title){
	resetMap();
	
	var coords = marker.getPosition();
	
	//커스텀 인포윈도우 만들기
	overlay = new kakao.maps.CustomOverlay({
	    content: mapInfo(title, courseNo),
	    map: map,
	    position: coords,
	    yAnchor: 1.6
	});
	overlay.setMap(map);
	
	marker.setImage(pinkMarker);
	$(".course-container").removeClass("selected");
	$("#c" + courseNo).addClass("selected");
	
	selectedMarker = marker;
	//console.log("clicked blue");
};

var highlightOff = function(marker, courseNo){
	resetMap();
	
	marker.setImage(blueMarker);
	$("#c" + courseNo).removeClass("selected");
	//console.log("clicked pink");
};

var resetMap = function(){
	//기존 선택된 마커 파랑색으로 바꾸기
	if(selectedMarker != null) {
		selectedMarker.setImage(blueMarker);
		selectedMarker = null;
	}
	
	//열려있는 인포윈도우 닫기
	if(overlay != null){
		overlay.setMap(null);
	}
};

var mapInfo = function(title, courseNo){
	var str = '';
	
	str += '<div class="overlay-wrap">';
	str += '	<div class="info-cont">';
	str += '		<h4>' + title + '</h4>';
	str += '		<button class="btn-map-course-view" type="button" onclick="window.open(\'' + contextPath + '/course/view?courseNo=' + courseNo + '\', \'_blank\');">코스 상세보기 ></button>';
	str += '	</div>';
	str += '</div>';
	
	return str;
};


