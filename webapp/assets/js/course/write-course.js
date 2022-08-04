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
	
/***********************현재 위치 찍기********************************************************/	
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
/***********************현재 위치 찍기********************************************************/	

/***********************코스 그리기********************************************************/	

	var drawingFlag = false; // 그리고 있는 상태 체크
	var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.


	// 지도 클릭이벤트
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	
	    // 클릭한 위치
	    var clickPosition = mouseEvent.latLng;
	
	    // 선을 그리고 있는 상태가 아닐때
	    if (!drawingFlag) {
	
	        // 그리고 있는 상태로 변경
	        drawingFlag = true;
	        
	        // 선 리셋
	        deleteClickLine();
	        
	        //// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
	        deleteDistnce();
	
	        //// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
	        deleteCircleDot();
	    
	        // 선 생성
	        clickLine = new kakao.maps.Polyline({
	            map: map, // 표시할 지도
	            path: [clickPosition], // 좌표 배열!!!!!!!!
	            strokeWeight: 3, // 선 두께
	            strokeColor: '#db4040', // 선 색깔
	            strokeOpacity: 1, // 선 불투명도 (0~1)
	            strokeStyle: 'solid' // 선 스타일
	        });
	        
	        // 마우스 움직일때 선
	        moveLine = new kakao.maps.Polyline({
	            strokeWeight: 3, // 선 두께
	            strokeColor: '#db4040', // 선 색깔
	            strokeOpacity: 0.5, // 선 불투명도 (0~1)
	            strokeStyle: 'solid' // 선 스타일   
	        });
	    
	        //// 클릭한 지점에 대한 정보를 지도에 표시합니다
	        displayCircleDot(clickPosition, 0);
	
	            
	    } else { // 선이 그려지고 있는 상태
	
	        // 그려지고 있는 선의 좌표 배열 가져오기
	        var path = clickLine.getPath();
	
	        // 좌표 배열에 클릭한 위치를 추가
	        path.push(clickPosition);
	        
	        // 좌표 배열 재설정하고 선을 이음
	        clickLine.setPath(path);
	
			// 거리 계산
	        var distance = Math.round(clickLine.getLength());
	        displayCircleDot(clickPosition, distance);
	    }
	});
	    
	// 선 그리고 있을때 마우스 움직이면 일어나는 이벤트
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	
	    // 선을 그리고 있는 상태
	    if (drawingFlag){
			
	        // 현재 위치
	        var mousePosition = mouseEvent.latLng; 
	
	        // 좌표 배열 가져옴
	        var path = clickLine.getPath();
	        
	        // 마지막 좌표와 마우스 선으로 이음
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	        //거리 계산
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()),
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; //// 커스텀오버레이에 추가될 내용입니다
	        
	        // 거리정보를 코스정보에 입력
	        showDistance(content);   
	    }             
	});                 
	
	// 선 그리기 종료 (마우스 오른쪽 클릭)
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	    // 선을 그리고 있는 상태일때
	    if (drawingFlag) {
	        
	        // 점-마우스 잇는 선 제거
	        moveLine.setMap(null);
	        moveLine = null;  
	        
	        // 선의 좌표 배열
	        var path = clickLine.getPath();
	    
	        // 선을 구성하는 좌표의 개수가 2개 이상일때
	        if (path.length > 1) {
	
				//선의 총 거리 계산
	            var distance = Math.round(clickLine.getLength()), 
	                content = getTimeHTML(distance);
	                
	            // 선의 거리 정보를 코스정보에 입력
	            showDistance(content);  
	            console.log(path);
	             
	        } else {
	
	            // 선을 구성하는 좌표의 개수가 1개 이하이면 
	            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();
	
	        }
	        
	        // 그리고 있지 않은 상태로 변경
	        drawingFlag = false;          
	    }  
	});    
	
	// 선 제거
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}
	
	// 코스 정보에 값 입력
	function showDistance(content) {
		
		//거리
	    var dist = content.distance / 1000;
	    if(isNaN(dist)) {
			$('input[name="distance"]').attr('value', '');
		} else {
			$('input[name="distance"]').attr('value', dist);
		}
		
		//시간
		$('#hour').attr('value', content.hour);
		
		//분
		$('#minute').attr('value', content.minute);
	}
	
	// 거리 정보 삭제
	function deleteDistnce () {
		
		$('input[name="distance"]').attr('value', '');
		
		$('#hour').attr('value', '');
		
		$('#minute').attr('value', '');
	}
	
	// 클릭 지점에 대한 정보
	function displayCircleDot(position) {
	
	    // 클릭 지점 표시하는 점
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });
	
	    // 지도에 표시합니다
	    circleOverlay.setMap(map);

	
	    // 배열 추가
	    dots.push({circle:circleOverlay});
	}
	
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거
	function deleteCircleDot() {
	    var i;
	
	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }
	
	        if (dots[i].distance) {
	            dots[i].distance.setMap(null);
	        }
	    }
	
	    dots = [];
	}
	
	// 선그리기 종료 했을때 시간, 거리 출력
	function getTimeHTML(distance) {
		
		//총 분단위 시간
		var time = 0;
		//시간
		var hour;
		//분
		var minute;
		
		
		//선택한 종목값 가져오기
		var cate = $("input[name='courseCate']:checked").val();
		
		//종목별 시간 계산 (마라톤, 그림 제외 -> 직접 입력)
		if(cate != 'marathon' || cate != 'draw') {
		
			if(cate === 'walk') {
				//도보 4km/h / 67m/min
				time = distance / 67 | 0;
				
			} else if(cate === 'jogging') {
				//조깅 8km/h / 134m/min
				time = distance / 134 | 0;
				
			} else if(cate === 'running') {
				
				//러닝 15km/h / 250m/min
				time = distance / 250 | 0;
				
			} else if(cate === 'bicycle') {
				//자전거 16km/h / 267m/min
				time = distance / 267 | 0;
			}
			
			//시간, 분 계산
			hour = Math.floor(time / 60);
			minute = time % 60;
			
			
			var content = {
				distance: distance,
				hour : hour,
				minute : minute
			}
			
		} else {
			var content = {
				distance: distance,
				hour : '',
				minute : ''
			}
		}
	
	    return content;
	}
/***********************코스 그리기********************************************************/
});



