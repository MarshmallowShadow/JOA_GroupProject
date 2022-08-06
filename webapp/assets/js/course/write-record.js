/**
 * 기록 작성하기 js
 */

$(document).ready(function() {
	console.log("페이지 준비");
	
	//마커 위치
	/*var markers = [
	    {
	        position: new kakao.maps.LatLng(33.450701, 126.570667)
	    },
	    {
	        position: new kakao.maps.LatLng(33.450001, 126.570467), 
	    }
	];*/
	
	//지도 정보
	var mapContainer = document.getElementById('map-info');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3, //지도의 레벨(확대, 축소 정도)
		//marker: markers
		
	};
	
	// 이미지 지도 생성
	var staticMap = new kakao.maps.StaticMap(mapContainer, mapOption),
		overlays = []; //지도에 그릴 선 담을 배열
		
	
	// Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
/*	function drawMarker(markers) {
	    var len = markers.length, i = 0;
	
	    for (; i < len; i++) {
	        var marker = new kakao.maps.Marker({
	            map: map, 
	            position: new kakao.maps.LatLng(markers[i].y, markers[i].x), 
	            zIndex: markers[i].zIndex
	        });
	
	        overlays.push(marker);
	    }
	}*/
	
	
	// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
/*	function drawPolyline(lines) {
	    var len = lines.length, i = 0;
	
	    for (; i < len; i++) {
	        var path = pointsToPath(lines[i].points);
	        var style = lines[i].options;
	        var polyline = new kakao.maps.Polyline({
	            map: map,
	            path: path,
	            strokeColor: style.strokeColor,
	            strokeOpacity: style.strokeOpacity,
	            strokeStyle: style.strokeStyle,
	            strokeWeight: style.strokeWeight
	        });
	
	        overlays.push(polyline);
	    }
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
							<div class="close" data-idx="' + idx + '"><img src="${pageContext.request.contextPath }/assets/image/course/pic-cancel.png"></div> \
							<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
						</div>';
				$("#thumbnails").append(div);
			};
		})(file, idx);
		reader.readAsDataURL(file);
	}
		
	/* 등록 버튼 클릭 했을때 */
	$("#btnSubmit").on("click", function() {
		/*var formData = new FormData();
		$.each(uploadFiles, function(i, file) {
			if(file.upload != 'disable')  //삭제하지 않은 이미지만 업로드 항목으로 추가
			formData.append('upload-file', file, file.name);
		});*/
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