/**
 * 기록 작성하기 js
 */


$(document).ready(function() {
	console.log("페이지 준비");
	
	var courseNo = $("#courseNo");
	
	
	
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
	
	getDataFromDrawingMap();
	
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
		
		/*//시작 좌표
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

        overlays.push(markerLast);*/
        
        
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
	
	$("#input-file").bind('change', function() {
		selectFile(this.files);
	});
	
	//업로드 파일 삭제
	$("#filesList").on("click", ".close", function(e) {
		var $target = $(e.target).parent();
		var idx = $target.attr('data-idx');
		console.log(idx);
		delete uploadFiles[idx]; //배열에서 요소 삭제
		
		$target.parent().remove(); //프리뷰 삭제
	});
	
	
	/*----------------------기록 등록------------------------------------*/ 
	$(".add").on("click", function() {
		
		//폼 데이터 가져오기
		var regDate = $("#date").val()+" "+$("#time").val();
		var weather = $('input[name="weather"]:checked').val();
		var temperature = $("#tem").val();
		var courseCate = $('input[name="courseCate"]:checked').val();
		var hour = $("#hour").val();
		var minute = $("#minute").val();
		var courseTime = (hour*60)+parseInt(minute);
		var difficulty = $('input[name="difficulty"]:checked').val();
		var review = $("#review").val();
		var courseNo = $("#courseNo").val();
		var userNo = $("#userNo").val();
		//recVo 생성
		var recVo = {
			regDate: regDate,
			weather: weather,
			temperature: temperature,
			courseCate: courseCate,
			courseTime: courseTime,
			difficulty: difficulty,
			review: review,
			courseNo: courseNo,
			userNo: userNo
		};
		
		console.log(recVo);
		
		//recVo 전송
		$.ajax({
			//보낼때
			url : contextPath+"/apiRec/recordWrite",
			type : "post",
			//contentType : "application/json",
			data : recVo,
	
			//받을때
			//dataType : "json",
			success : function(recResult){
				//성공시 처리해야될 코드 작성
				console.log("record:"+recResult);
				
				//업로드할 사진이 있을때 사진 업로드
				if(uploadFiles.length > 0) { 
					var formData = new FormData();
					
					for(var i=0; i < uploadFiles.length; i++) {
						formData.append('file', uploadFiles[i]);
					}
					
					console.log(formData);
					
					$.ajax({
						//보낼때
						url : contextPath+"/apiRec/recordImgWrite",
						type : "post",
						//contentType : "application/json",
						data : formData,
						processData: false,
						contentType: false,
						enctype : 'multipart/form-data',
						
						//받을때
						//dataType : "json",
						success : function(imgResult){
							//성공시 처리해야될 코드 작성
							console.log("img:"+imgResult);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});
				}
				
				if(recResult == "success") {
					location.href = contextPath+"/record/view?courseNo="+courseNo;
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
});

//업로드할 파일 목록
var uploadFiles = [];

$(function() {
	//파일 드롭 다운
	fileDropDown();
});

//파일 드롭 다운
function fileDropDown() {
	var dropZone = $("#drop");
	
	//drag 기능
	dropZone.on('dragenter', function(e){
		e.stopPropagation();
		e.preventDefault();
		//드롭다운 영역 css
		//dropZone.css('background-color', '#FFFFFF');
	});
	//drag 뺐을때
	dropZone.on('dragleave', function(e) {
		e.stopPropagation();
		e.preventDefault();
		//드롭다운 영역 css
		//dropZone.css('background-color', '#FFFFFF');
	});
	//drag 끝났을때
	dropZone.on('dragover', function(e) {
		e.stopPropagation();
		e.preventDefault();
		//드롭다운 영역 css
		//dropZone.css('background-color', '#FFFFFF');
	});
	//drag한 파일 떨어뜨렸을때
	dropZone.on('drop', function(e) {
		e.preventDefault();
		//드롭다운 영역 css
		//dropZone.css('background-color', '#FFFFFF');
		
		var files = e.originalEvent.dataTransfer.files;
		if(files != null) {
			if(files.length < 1) {
				console.log("폴더 업로드 불가");
				return;
			} else {
				selectFile(files);
			}
		} else {
			alert("ERROR");
		}
	});
}

//파일 선택시
function selectFile(fileObject) {
	var files = null;
	
	if(fileObject != null) {
		//파일 Drag 이용하여 등록시
		files = fileObject;
	} else {
		//직접 파일 등록시
		files = $('#multipaartFileList_' + fileIndex)[0].files;
	}
	
	//다중파일 등록
	if(files != null) {
		
		if(files != null && files.length > 0) {
			$("#fileDragDesc").hide();
			$("#filesList").show();
		} else {
			$("#fileDragDesc").show();
			$("#filesList").hide();
		}
		
		
		for(var i = 0; i < files.length; i++) {
			console.log(files[i]);
			var file = files[i];
			var size = uploadFiles.push(file); //업로드 목록에 추가
			preview(file, size - 1); //미리보기 만들기
		}
		
	}
	
}

//미리보기 생성
function preview(file, idx) {
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb">'+
							'<div class="close" data-idx="'+idx+'">'+
								'<span class="glyphicon glyphicon-remove">' +
							'</div>'+
							'<img src="'+e.target.result+'"title="'+escape(f.name)+'"/>'+
						'</div>';
			$("#filesList").append(div);
		};						
	})(file,idx);
	reader.readAsDataURL(file);
}




