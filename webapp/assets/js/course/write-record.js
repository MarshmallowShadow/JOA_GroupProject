/**
 * 기록 작성하기 js
 */

$(document).ready(function() {
	console.log("페이지 준비");
	
	//input date에 현재 날짜 세팅
	document.getElementById('date').value = new Date().toISOString().substring(0, 10);;
	
	
	
	/*-----------------------지도 보여주기--------------------------------------*/
	//지도 정보
	var mapContainer = document.getElementById('map-info');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3, //지도의 레벨(확대, 축소 정도)
	};
	
	// 이미지 지도 생성
	//var staticMap = new kakao.maps.StaticMap(mapContainer, mapOption),
	var staticMap = new kakao.maps.Map(mapContainer, mapOption),
		overlays = []; //지도에 그릴 선 담을 배열
		
		
	// Drawing Manager 옵션
	var options = { 
	    map: staticMap, // 그림 그릴 map
	    drawingMode: [ // 그림 모드
	        kakao.maps.drawing.OverlayType.MARKER,
	        kakao.maps.drawing.OverlayType.POLYLINE
	    ],
	    markerOptions: { // 마커 옵션
	        draggable: false, // 드래그기능
	        removable: false // 삭제기능
	    },
	    polylineOptions: { // 선 옵션
	        draggable: false, // 드래그기능
	        removable: false, //삭제기능
	        editable: false, // 수정기능
	        strokeColor: '#39f' // 선 색
	    }
	};
	
	// Drawing Manager 생성
	var manager = new kakao.maps.drawing.DrawingManager(options);
	
	// 데이터 그리기
	function getDataFromDrawingMap() {
	    // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
	    var data = manager.getData();
	
	    // 마커, 선 그리기
	    drawMarker();
	    //drawPolyline();
	}
		
	
	// 마커 표시
	function drawMarker() {
	
		/*var	pointFirst_x = '${coMap.pointVo[0].x}';
		var	pointFirst_y = '${coMap.pointVo[0].y}';*/
		
		//시작 좌표
		var pointFirst_x = 127.1154720072476;
		var pointFirst_y = 37.52690948940164;
		
        var markerFirst = new kakao.maps.Marker({
            map: map, 
            position: new kakao.maps.LatLng(pointFirst_x, pointFirst_y), 
        });

        overlays.push(markerFirst);
        
        //마지막 좌표
        var pointLast_x = 127.09366891463725;
		var pointLast_y = 37.53363224297457;
		
        var markerLast = new kakao.maps.Marker({
            map: map, 
            position: new kakao.maps.LatLng(pointLast_x, pointLast_y), 
        });

        overlays.push(markerLast);
	}
	
	
	// 선 표시
	function drawPolyline() {
		
		var points = [
			{x:127.1154720072476, y:37.52690948940164},
			{x:127.07808345777057, y:37.51699305866043},
			{x:127.10938803317734, y:37.51307588057327},
			{x:127.09366891463725, y:37.53363224297457}
		];
		
	    var len = points.length, i = 0;
	
	    for (; i < len; i++) {
	        var path = pointsToPath(points[i]);
	        //var style = lines[i].options;
	        var polyline = new kakao.maps.Polyline({
	            map: staticMap,
	            path: path,
	            strokeColor: style.strokeColor,
	            strokeOpacity: style.strokeOpacity,
	            strokeStyle: style.strokeStyle,
	            strokeWeight: style.strokeWeight
	        });
	
	        overlays.push(polyline);
	    }
	}
	
	// Drawing Manager에서 가져온 데이터 중 
	// 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다 
	function pointsToPath(points) {
	    var len = points.length, 
	        path = [], 
	        i = 0;
	
	    for (; i < len; i++) { 
	        var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
	        path.push(latlng); 
	    }
	
	    return path;
	}
	
	/*
	범위 재설정하는거 선표시 할때 쓰기
	// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    var bounds = new kakao.maps.LatLngBounds();

    for (var i=0; i<data.length; i++) {   
        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
    }       

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*----------------------사진 드래그앤 드롭------------------------------------*/ 
	var uploadFiles = [];
	var $drop = $("#drop");
	$drop.on("dragenter", function(e) {//드래그 요소가 들어왔을 때  
		
		$(this).addClass('drag-over');
		
	}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			
		$(this).removeClass('drag-over');
	
	}).on("dragover", function(e) {  
				
		e.stopPropagation();
		e.preventDefault();
			
	}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
					
		e.preventDefault();
		$(this).removeClass('drag-over');
				
		var files = e.originalEvent.dataTransfer.files;  //드래그&드랍 항목
		
		for(var i = 0; i < files.length; i++) {
			var file = files[i];
			var size = uploadFiles.push(file);  //업로드 목록에 추가
			preview(file, size - 1);  //미리보기 만들기
				
		}
	});
			
	function preview(file, idx) {
		var reader = new FileReader();
		
		reader.onload = (function(f, idx) {
			return function(e) {
				$("#course-pic").remove();
					
				var div = '<div class="pic-content"> \
							<div class="close" data-idx="' + idx + '"><span class="glyphicon glyphicon-remove"></div> \
							<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
						</div>';
				$("#thumbnails").append(div);
			};
		})(file, idx);
		reader.readAsDataURL(file);
	}
		
	/* 등록 버튼 클릭 했을때 */
	$(".add").on("submit", function() {
		var formData = new FormData();
		$.each(uploadFiles, function(i, file) {
			if(file.upload != 'disable')  //삭제하지 않은 이미지만 업로드 항목으로 추가
			formData.append('upload-file', file, file.name);
		});
		/*$.ajax({
			url: '/api/etc/file/upload',
			data : formData,
			type : 'post',
			contentType : false,
			processData: false,
			success : function(ret) {
				alert("완료");
			}  
		});*/
	}); 
	
	$("#thumbnails").on("click", ".close", function(e) {
		var $target = $(e.target);
		console.log($target);
		var idx = $target.attr('data-idx');
		uploadFiles[idx].upload = 'disable';  //삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove();  //프리뷰 삭제
	});
});