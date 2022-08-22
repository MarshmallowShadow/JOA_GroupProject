/*코스 기록 상세보기 js*/


$(document).ready(function() {
	
	console.log(authUserNo);
	
	/*지도 그리기*/
	map();
	
	
/********************************************************사진모달********************************************************/
	lightbox.option({
		/*https://lokeshdhakar.com/projects/lightbox2/*/
		'alwaysShowNavOnTouchDevices': true, /*이미지 세트 일때 화면 양쪽 누르면 사진 변경*/
		'disableScrolling': true, /*화면 스크롤링 막기*/
		'fadeDuration': 100, /*페이드인아웃*/
		'imageFadeDuration': 100, /*페이드인*/
		'fitImagesInViewport': true, /*이미지 크기 자동조절*/
		'wrapAround': true, /*이미지 끝나도 다시 첫이미지로*/
		'albumLabel': "총 %2개 중 %1번째 이미지"
	});
	
	
	
/********************************************************좋아요 버튼********************************************************/
	
	$(".like-btn").on("click", function() {
		
		var courseNo = $("#courseNo").val();
		
		if(isNaN(authUserNo)) {
			authUserNo = 0;
		}
		
		if(authUserNo != 0){
			$.ajax({
				//보낼때
				url : contextPath+"/apiCo/likeBtnClick",
				type : "post",
				//contentType : "application/json",
				data : {courseNo},
				
				//받을때
				//dataType : "json",
				success : function(result){
					//성공시 처리해야될 코드 작성
					var heart = result.heart;
					var cnt = result.cnt;
					
					var src = contextPath + "/assets/image/main/"+heart+".png";
					
					$("#like").attr("src", src);
					$("#like-cnt").text(cnt);
					
		
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
		
		
	});
	
	
	
/********************************************************기록리스트********************************************************/	

	/*스크롤 변화가 발생할때 호출*/
	/*$(".record-info-content").scroll(function() {
		console.log("스크롤");
		
		if($(window).scrollTop() == $(".record-info-content").height() - $(window).height()) {
			console.log("페이지++");
		}

	})*/
	
	
	//코스번호
	var courseNo = $("#courseNo").val();
	//코스작성자번호 가져오기
	var coUserNo = getCoUserNo(courseNo);
	
	/*디폴트-전체 기록 리스트 가져오기*/
	getAllRecord(courseNo, coUserNo);
	
	/*전체-내가쓴기록 선택*/
	$('input:radio[name="record-filter"]').change(function() {
		if($(this).val() === 'all') {
			$('.record-list').empty();
			getAllRecord(courseNo, coUserNo);
		} else if($(this).val() === 'myrecord') {
			$('.record-list').empty();
			
			if(isNaN(authUserNo)) {
				var str = '';
				str += '<li>';
				str += '	<div class="message">';
				str += '		로그인 후에 이용해 주세요.';
				str += '	</div>';
				str += '</li>';
				
				$(".record-list").append(str);
			} else {
				getMyRecord(courseNo, coUserNo, authUserNo);
			}
		}
	});
});


/*전체 기록 리스트 가져오기*/
function getAllRecord(courseNo, coUserNo) {
	
	console.log("getAllRecord");
	
	$.ajax({
		//보낼때
		url : contextPath+"/apiRec/getRecord",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(recMap){
			//성공시 처리해야될 코드 작성
			var recList = recMap.recList;
			var recImgs = recMap.recImgs;
			console.log(recList);
			console.log(recImgs);
			
			if(recList.length > 0) {
				for(var i=0; i<recList.length; i++) {
					render(recList[i], coUserNo, recImgs);
				}
			} else {
				var str = '';
				str += '<li>';
				str += '	<div class="noRec">';
				str += '		기록이 없습니다.';
				str += '	</div>';
				str += '</li>';
				
				$(".record-list").append(str);
			}
			

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};


/*내가 쓴 기록 리스트 가져오기*/
function getMyRecord(courseNo, coUserNo, authUserNo) {
	
	console.log("getMyRecord");
	
	$.ajax({
		//보낼때
		url : contextPath+"/apiRec/getRecord",
		type : "post",
		//contentType : "application/json",
		data : {courseNo, authUserNo},
		
		//받을때
		//dataType : "json",
		success : function(recMap){
			//성공시 처리해야될 코드 작성
			var recList = recMap.recList;
			var recImgs = recMap.recImgs;
			console.log(recList);
			console.log(recImgs);
			
			if(recList.length > 0) {
				
				for(var i=0; i<recList.length; i++) {
					render(recList[i], coUserNo, recImgs);
				}
				
			} else {
				var str = '';
				str += '<li>';
				str += '	<div class="noRec">';
				str += '		기록이 없습니다.';
				str += '	</div>';
				str += '</li>';
				
				$(".record-list").append(str);
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};


/*리스트 추가하기*/
function render(recVo, coUserNo, recImgs) {
	//console.log("render");
	
	var hour = Math.floor(recVo.COURSETIME/60);
	hour = "00" + hour;
	hour = hour.slice(-2);
	
	var minute = recVo.COURSETIME%60;
	minute = "00" + minute;
	minute = minute.slice(-2);
	
	
	if(recVo.REVIEW == undefined || recVo.REVIEW == null || recVo.REVIEW == "") {
		recVo.REVIEW = "";
	}
	
	var str="";	
	str = '	<li>';
	str +=	'<div class="record-full-content">';
	str +=	'	<div class="record-txt">';
	str +=	'		<div class="record-content">';
	str +=	'			<span class="record">';
	str +=	'				<span class="bold">';
	
	//코스 작성자 표시
	if(coUserNo == recVo.USERNO) {
		str += '<img src="'+contextPath+'/assets/image/course/footprint.png" style="width: 15px;">';
	}
	
	str +=	recVo.NAME+'	</span>';
	str +=	'				<span>'+recVo.REVIEW+'</span>';
	str +=	'			</span>';
	str +=	'		</div>';
	str +=	'		<div class="record-info">';
	
	str +=	'			<div>';
	str +=	'				<span class="box blue">';
	
	//종목
	if(recVo.COURSECATE === 'walk') {
		str += '산책';
	} else if(recVo.COURSECATE === 'jogging') {
		str += '조깅';
	} else if(recVo.COURSECATE === 'running') {
		str += '러닝';
	} else if(recVo.COURSECATE === 'marathon') {
		str += '마라톤';
	} else if(recVo.COURSECATE === 'bicycle') {
		str += '자전거';
	} else if(recVo.COURSECATE === 'draw') {
		str += '그림';
	}
	
	//시간
	str +=	' | '+hour+':'+minute+'</span>';
	str +=	'				<span class="box pink">';
	
	//난이도
	if(recVo.DIFFICULTY === 'easy') {
		str += '쉬움'
	} else if(recVo.DIFFICULTY === 'normal') {
		str += '보통'
	} else if(recVo.DIFFICULTY === 'hard') {
		str += '어려움'
	}
	
	str +=	'				</span>';
	str +=	'			</div>';
	
	str +=	'			<div>';
	str +=	'				<span>'+recVo.REGDATE+'</span>';
	
	//기온
	if(recVo.TEMPERATURE != -100) {
		str +=	'				<span style="width:24px;">'+recVo.TEMPERATURE+'℃</span>';
	}
	//날씨
	if(recVo.WEATHER != "null") {
		str +=	'				<span><img class="weather" src="'+contextPath+'/assets/image/course/'+recVo.WEATHER+'.png"></span>';
	}
	str +=	'			</div>';
	
	str +=	'		</div>';
	str +=	'	</div>';
				
	str +=	'	<div class="record-img">';
	
	//이미지
	for(var i=0; i<recImgs.length; i++) {
		//console.log(recVo.RECORDNO+","+recImgs[i].RECORD_NO);
		if(recVo.RECORDNO == recImgs[i].RECORD_NO) {
			if(recImgs[i].ORDER_NO == 0) {
				str +=	'<a href="'+contextPath+'/upload/'+recImgs[i].SAVE_NAME+'" data-lightbox="image-'+recImgs[i].COURSE_NO+recImgs[i].RECORD_NO+'">';
				str +=	'	<img class="recordImg" src="'+contextPath+'/upload/'+recImgs[i].SAVE_NAME+'" width="24px">';
				str +=	'</a>';
			} else {
				str +=	'<a href="'+contextPath+'/upload/'+recImgs[i].SAVE_NAME+'" data-lightbox="image-'+recImgs[i].COURSE_NO+recImgs[i].RECORD_NO+'"></a>';
			}
		}
	}
	str +=	'	</div>';
	str +=	'</div>';
	str +=	'</li>';
		
	$(".record-list").append(str);

	
}

function getCoUserNo(courseNo) {
	
	//console.log("getuserNo");
	var coUserNo;
	
	$.ajax({
		//보낼때
		url : contextPath+"/apiRec/getCoUserNo",
		type : "post",
		//contentType : "application/json",
		async: false,
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(result){
			//성공시 처리해야될 코드 작성
			coUserNo = result;

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	return coUserNo;
	
};


/********************************************************지도********************************************************/
function map() {
	
	var courseNo = $("#courseNo").val();
	
	//좌표 배열
	var path = [];
	//지도 범위정보 객체
	var bounds = new kakao.maps.LatLngBounds();
	// 마커 위치
	var markerPosition = [];
	
	/*좌표 가져오기*/
	$.ajax({
		//보낼때
		url : contextPath+"/apiCo/getPoint",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(points){
			//성공시 처리해야될 코드 작성
			console.log(points);
			
			for(var i=0; i<points.length; i++) {
				var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
				
				//좌표 배열에 추가
				path.push(latlng);
				
				//범위정보에 마커 좌표 추가
				bounds.extend(latlng);
			}
			
			//지도 범위 재설정
			map.setBounds(bounds);
			
			
			/*마커 생성*/
			//마커 이미지 설정
			var imageSrc1 = contextPath+'/assets/image/course/pin-b.png', // 마커이미지 주소
				imageSrc2 = contextPath+'/assets/image/course/pin-r.png', // 마커이미지 주소
		    imageSize = new kakao.maps.Size(32, 32), // 마커이미지 크기
		    imageOption = {offset: new kakao.maps.Point(16, 32)}; // 마커 위치
		    
		    var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize, imageOption);
		    var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption);
		    
			//시작 마커와 마지막 마커 배열 저장
			var firstMk = {
				title: 'start',
				latlng: new kakao.maps.LatLng(points[0].y, points[0].x),
				image: markerImage1
			};
			markerPosition.push(firstMk);
			var lastMk = {
				title: 'end',
				latlng: new kakao.maps.LatLng(points[points.length-1].y, points[points.length-1].x),
				image: markerImage2
			};
			markerPosition.push(lastMk);
			
			// 마커 생성
			for(var i=0; i<markerPosition.length; i++) {
				var marker = new kakao.maps.Marker({
					map: map,
				    position: markerPosition[i].latlng,
				    title: markerPosition[i].title,
				    image: markerPosition[i].image
				});
				console.log(marker);
			}
			
			/*라인 그리기*/
			//선 생성
			var polyline = new kakao.maps.Polyline({
				map: map, //표시할 지도
				path: path, //선의 좌표
				strokeWeight: 6, //선 두께
				strokeColor: 'rgb(50, 108, 249)', //선 색깔
				strokeOpacity: 0.9, //선의 불투명도 (0~1)
				strokeStyle: 'solid' //선 스타일
			});

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
		
	//지도 정보
	var mapContainer = document.getElementById('map-info');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3, //지도의 레벨(확대, 축소 정도)
		draggable: false, //마우스 휠 이동, 확대, 축소 여부
		scrollwheel: false, //마우스 휠 확대 축소 여부
		disableDoubleClick: false, //더블클릭 이벤트 여부
		disableDoubleClickZoom: true, //더블클릭 줌 이벤트 여부
		keyboardShortcuts: false //키보드 이동, 확대, 축소 여부
	};
	
	// 이미지 지도 생성
	//var map = new kakao.maps.StaticMap(mapContainer, mapOption);
	var map = new kakao.maps.Map(mapContainer, mapOption);

}


