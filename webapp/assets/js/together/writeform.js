/**
 * 함께하기 글쓰기폼 js
 */
 
 /*------------------------------ 모달 --------------------------------*/ 
		
	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		map();
		
	});
	
	/* 코스 버튼을 클릭했을 때 */
	$("#course-load").on("click", function() {
		
		console.log("코스 불러오기");

		
		//모달창 띄우기
		$("#courseModal").modal("show");
		
	});
	

/*------------------------------ 지도 --------------------------------*/ 

function map() {
		
	
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
			level: 3 //지도의 레벨(확대, 축소 정도)
	}
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성
	
/*---------------------------- 현재 위치 ------------------------------*/ 
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인
	if (navigator.geolocation) {
	    
	    //GeoLocation을 이용해서 접속 위치를 얻어옴
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성

	        //접속 위치 변경
   			map.setCenter(locPosition); 
	            
	      });
	    
	} else { //HTML5의 GeoLocation을 사용할 수 없을 때
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667); 
	        
	    //접속 위치 변경
	    map.setCenter(locPosition); 
	}
	
	
 /*---------------------------- 키워드 검색 ------------------------------*/ 
	
	$('#address-btn').on("click", function() {
		//주소 가져오기
		var keyword = $('input[name="address"]').val();
		
		//장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		//키워드로 장소를 검색합니다
		ps.keywordSearch(keyword, placesSearchCB); 
		
		//키워드 검색 완료 시 호출되는 콜백함수입니다
		function placesSearchCB (data, status) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        //검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해
		        //LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {   
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        //검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
	});
	
 /*---------------------------- 코스 그리기 ------------------------------*/ 
	
	var drawingFlag = false; // 그리고 있는 상태 체크
	var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체
	var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열


	//지도 클릭 이벤트
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	
	    //클릭한 위치
	    var clickPosition = mouseEvent.latLng;
	
	    //선을 그리고 있는 상태가 아닐 때
	    if (!drawingFlag) {
	
	        //그리고 있는 상태로 변경
	        drawingFlag = true;
	        
	        //선 리셋
	        deleteClickLine();
	        
	        //코스 정보 지우기
	        deleteDistnce();
	
	        //지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리 정보가 표시되고 있다면 지도에서 제거합니다
	        deleteCircleDot();
	    
	        //선 생성
	        clickLine = new kakao.maps.Polyline({
	            map: map, // 표시할 지도
	            path: [clickPosition], // 좌표 배열
	            strokeWeight: 5, // 선 두께
	            strokeColor: 'rgb(255, 52, 120)', // 선 색깔
	            strokeOpacity: 1, // 선 불투명도 (0~1)
	            strokeStyle: 'solid' // 선 스타일
	        });
	        
	        //마우스 움직일 때 선
	        moveLine = new kakao.maps.Polyline({
	            strokeWeight: 5, // 선 두께
	            strokeColor: 'rgb(255, 52, 120)', // 선 색깔
	            strokeOpacity: 0.5, // 선 불투명도 (0~1)
	            strokeStyle: 'solid' // 선 스타일   
	        });
	    
	        //클릭한 지점에 대한 정보를 지도에 표시합니다
	        displayCircleDot(clickPosition, 0);
	
	            
	    } else { //선이 그려지고 있는 상태
	
	        //그려지고 있는 선의 좌표 배열 가져오기
	        var path = clickLine.getPath();
	
	        //좌표 배열에 클릭한 위치를 추가
	        path.push(clickPosition);
	        
	        //좌표 배열 재설정하고 선을 이음
	        clickLine.setPath(path);
	
			//거리 계산
	        var distance = Math.round(clickLine.getLength());
	        displayCircleDot(clickPosition, distance);
	    }
	});
	    
	//선 그리고 있을 때 마우스 움직이면 일어나는 이벤트
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	
	    //선을 그리고 있는 상태
	    if (drawingFlag){
			
	        //현재 위치
	        var mousePosition = mouseEvent.latLng; 
	
	        //좌표 배열 가져옴
	        var path = clickLine.getPath();
	        
	        //마지막 좌표와 마우스 선으로 이음
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	        //거리 계산
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()),
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; //// 커스텀오버레이에 추가될 내용입니다
	        
	        //거리 정보를 코스 정보에 입력
	        showDistance(content);   
	    }             
	});                 
	
	//선 그리기 종료 (마우스 오른쪽 클릭)
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	    //선을 그리고 있는 상태일 때
	    if (drawingFlag) {
	        
	        //점-마우스 잇는 선 제거
	        moveLine.setMap(null);
	        moveLine = null;  
	        
	        //선의 좌표 배열
	        var path = clickLine.getPath();
	    
	        //선을 구성하는 좌표의 개수가 2개 이상일 때
	        if (path.length > 1) {
	
				//선의 총 거리 계산
	            var distance = Math.round(clickLine.getLength()), 
	                content = getTime(distance);
	                
	            //선의 거리 정보를 코스 정보에 입력
	            showDistance(content);  
	            console.log(path);
	            
	            $('input:radio[name="courseCate"]').change(function() {
					var content = getTime(distance);
					showDistance(content);
				});
				
				$("#point").empty();
				
				//input hidden 추가
				for(var i=0; i<path.length; i++) {
					
					console.log(path[i]);
					
					var input = '<input type="hidden" name="x" value="'+path[i].La+'">'
								+ '<input type="hidden" name="y" value="'+path[i].Ma+'">';
					$("#point").append(input);
				}
				
	             
	        } else {
	
	            //선을 구성하는 좌표의 개수가 1개 이하이면 
	            //지도에 표시되고 있는 선을 제거
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();
	
	        }
	        
	        //그리고 있지 않은 상태로 변경
	        drawingFlag = false;          
	    }  
	});    
	
	//선 제거
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}
	
	//코스 정보에 값 입력
	function showDistance(content) {
		
		//거리
	    var dist = content.distance / 1000;
	    if(isNaN(dist)) {
			$('input[name="distance"]').attr('value', '');
		} else {
			$('input[name="distance"]').attr('value', dist);
		}
		
		//시간
		var hour = Math.floor(content.time / 60);
		if(isNaN(hour)) {
			$('#hour').attr('value', '');
		} else {
			$('#hour').attr('value', hour);
		}
		
		
		//분
		var minute = content.time%60;
		if(isNaN(minute)) {
			$('#minute').attr('value', '');
		} else {
			$('#minute').attr('value', minute);
		}
		
	}
	
	//거리 정보 삭제
	function deleteDistnce () {
		
		$('input[name="distance"]').attr('value', '');
		
		$('#hour').attr('value', '');
		
		$('#minute').attr('value', '');
	}
	
	//클릭 지점에 대한 정보
	function displayCircleDot(position) {
	
	    //클릭 지점 표시하는 점
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });
	
	    //지도에 표시합니다
	    circleOverlay.setMap(map);

	
	    //배열 추가
	    dots.push({circle:circleOverlay});
	}
	
	//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거
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
	
	//선그리기 종료 했을 때 시간, 거리 출력
	function getTime(distance) {
		
		//총 분단위 시간
		var time = 0;
		
		
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
			
		}
		
		var content = {
			distance: distance,
			time: time
		}
	
	    return content;
	}
}

 /*---------------------------- 달력 날짜 ------------------------------*/ 


	$(function(){
		
		$("#event-start").datepicker({
			
			dateFormat: 'yy/mm/dd',
			minDate: 0
			
		});
		
		var dateFormat = "yy/mm/dd", from = $( "#reg-start" ).datepicker({
			
			defaultDate: "+1w",
			changeMonth: true,
			dateFormat: 'yy/mm/dd',
			minDate: 0
	          
		}).on( "change", function() {
		
			to.datepicker( "option", "minDate", getDate( this ) );
	          
		}), to = $( "#reg-end" ).datepicker({
		
			defaultDate: "+1w",
			changeMonth: true,
	        dateFormat: 'yy/mm/dd',
	        minDate: 0
	        
		}).on( "change", function() {
		
	        from.datepicker( "option", "maxDate", getDate( this ) );
	        $("#event-start").datepicker( "option", "minDate", getDate( this ) );
	        
		});
        
	    function getDate( element ) {
		
			var date;
			
			try {
				date = $.datepicker.parseDate( dateFormat, element.value );
			} catch( error ) {
		        date = null;
			}
		 
		      return date;
		      
		    }
		    
	});




















