/**
 * 함께하기 상세페이지 js
 */
 
  /*------------------------------ 지도 --------------------------------*/ 
   
$(document).ready(function() {
	
	console.log("tq");
	
	/* 지도 그리기 */
	map();
  
	 function map() {
		
		//좌표 배열
		var path = [];
		//지도 범위 정보 객체
		var bounds = new kakao.maps.LatLngBounds();
		// 마커 위치
		var markerPosition = [];
		
		/* 좌표 가져오기 */
		$.ajax({
			//보낼 때
			url : pageContext + "/api/together/map",
			type : "post",
			//contentType : "application/json",
			data : {eventNo},
			
			//받을 때
			//dataType : "json",
			success : function(points){
				//성공 시 처리해야 될 코드 작성
				console.log(points);
				
				for(var i=0; i<points.length; i++) {
					var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
					
					//좌표 배열에 추가
					path.push(latlng);
					
					//범위 정보에 마커 좌표 추가
					bounds.extend(latlng);
				}
				
				//지도 범위 재설정
				map.setBounds(bounds);
				
				
				/* 마커 생성 */
				
				//마커 이미지 설정
				var imageSrc1 = pageContext + '/assets/image/course/pin-b.png', // 마커이미지 주소
					imageSrc2 = pageContext + '/assets/image/course/pin-r.png', // 마커이미지 주소
			    imageSize = new kakao.maps.Size(32, 32), // 마커이미지 크기
			    imageOption = {offset: new kakao.maps.Point(16, 32)}; // 마커 위치
			    
			    var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize, imageOption);
			    var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption);
			    
				//시작 마커와 마지막 마커 배열 저장
				var firstLocation = new kakao.maps.LatLng(points[0].y, points[0].x); //시작위치
				var lastLocation = new kakao.maps.LatLng(points[points.length-1].y, points[points.length-1].x); //끝위치
				
				var firstMk = {
					title: 'start',
					latlng: firstLocation,
					image: markerImage1
				};
				markerPosition.push(firstMk);
				var lastMk = {
					title: 'end',
					latlng: lastLocation,
					image: markerImage2
				};
				markerPosition.push(lastMk);
				
				//마커 생성
				for(var i=0; i<markerPosition.length; i++) {
					var marker = new kakao.maps.Marker({
						map: map,
					    position: markerPosition[i].latlng,
					    title: markerPosition[i].title,
					    image: markerPosition[i].image,
					    clickable: true
					});
					console.log(marker);
				}

				/* 라인 그리기 */
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
		
		//이미지 지도 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
	}

});