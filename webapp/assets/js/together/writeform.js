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
	
/*------------------------------ 코스모달 ----------------------------------*/
	
	/* 코스 버튼을 클릭했을 때 */
	$("#course-load").on("click", function() {
		
		console.log("코스 불러오기");
		
		$("#courseModal").modal("show");
		
	});
	
	/* 코스 no */
	$("#courseModal").on("click", ".fav", function(){
		
		var $this = $(this);
		
		var cateNo = $this.data("cate-no");
		
		//ajax
		$.ajax({
							
			//보낼 때
			url : pageContext + "/apiBoard/getCourseList",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(cateNo),
			dataType: "json",
			
			//받을 때
			//dataType : "json",
			success : function(result){
				
				$(".courseChoose ul").empty();
				
				for(var i=0; i<result.length; i++){
					$(".courseChoose ul").append('<li class="co" data-title="' + result[i].title + '" data-course-no="'+ result[i].courseNo +'" role="presentation">' + result[i].title + '</li>');
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	//코스 즐겨찾기 선택된 값 띄우기
	$('#courseModal').on('click', '#fav-menu li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기 
	    $('#dropdownMenu1').html($(this).text() + '<span class="caret"></span>');
	    
	});
	
	//코스 선택
	$("#courseModal").on("click", ".co", function(){
		
		$(".co").removeClass("c_selected");
		$(this).addClass("c_selected");
		
	});
	
	//즐겨찾기된 코스 선택된 값 띄우기
	$('#courseModal').on('click', '#fav-course li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기 
	    $('#dropdownMenu2').html($(this).text() + '<span class="caret"></span>');
	    
	});
	
	/* 코스 SAVE 버튼 눌렀을 때 */
	$("#c-save").on("click", function() {
		
		var courseNo = $(".c_selected").data("course-no");
		
		var folderIcon = '<span class="glyphicon glyphicon-folder-open gray" id="folder"></span>';
		
		if(courseNo != null || isNaN(courseNo) == false) {
			//black text
			$("#course-load").addClass("blackBtn");
			
			//change course text
			$("#course-load").html(folderIcon + $(".c_selected").data("title"));
			
			//hidden add courseNo
			$("#courseFinal").val(courseNo);
		}
		
		//모달 닫기
		$("#courseModal").modal("hide");
		
	});

/*------------------------------ 지도 --------------------------------*/ 

	function map() {
	
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center: new kakao.maps.LatLng(37.57793316923273, 126.97704154286627), //지도 중심좌표
			level: 3 //지도의 레벨(확대, 축소 정도)
		}
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성

	$(document).ready(function() {
		
		console.log("tq");
		
		/* 지도 그리기 */
		mapInfo();
	  
		 function mapInfo() {
			
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
	    
	    var locPosition = new kakao.maps.LatLng(37.57793316923273, 126.97704154286627); 
	        
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




















