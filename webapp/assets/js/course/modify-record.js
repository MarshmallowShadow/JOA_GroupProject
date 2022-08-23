/**
 * 기록 수정하기 js
 */
 
 $(document).ready(function() {
	console.log("페이지준비");
	
	var courseNo = $("#courseNo").val();
	var recordNo = $("#recordNo").val();
	
	/*지도 그리기*/
	map(courseNo);
	
	
/********************************************************사진 드래그앤 드롭********************************************************/ 
	
	/*사진 가져오기*/
	getImgs(recordNo);
	
	$("#input-file").bind('change', function() {
		selectFile(this.files);
	});
	
	
	//업로드 파일 삭제
	$("#filesList").on("click", ".close", function(e) {
		var $target = $(e.target).parent();
		var no = $target.attr('data-no');
		
		if(no == undefined) {
			//새로 추가한 이미지 삭제
			var idx = $target.attr('data-idx');
			delete uploadFiles[idx]; //배열에서 요소 삭제
			console.log("upload:"+uploadFiles);
		} else {
			//기존에 있던 이미지 삭제 (삭제할 배열에 추가)
			deleteFiles.push(parseInt(no));
			console.log("delete:"+deleteFiles);
		}
		
		$target.parent().remove(); //프리뷰 삭제
	});
	
	
	
/********************************************************기록 수정********************************************************/
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
		var recordNo = $("#recordNo").val();
		
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
			recordNo: recordNo
		};
		
		console.log(recVo);
		
		
		//recVo 전송
		$.ajax({
			//보낼때
			url : contextPath+"/apiRec/recordModify",
			type : "post",
			//contentType : "application/json",
			data : recVo,
	
			//받을때
			//dataType : "json",
			success : function(recResult){
				//성공시 처리해야될 코드 작성
				console.log("record:"+recResult);
				
				if(recResult == "success") {
					
					if(deleteFiles.length > 0) {
						
						$.ajax({
							//보낼때
							url : contextPath+"/apiRec/deleteImgs",
							type : "post",
							//contentType : "application/json",
							data : {deleteFiles},
					
							//받을때
							//dataType : "json",
							success : function(delResult){
								//성공시 처리해야될 코드 작성
								console.log("delImgs:"+delResult);
							},
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
						
					}
					
					//업로드할 사진이 있을때 사진 업로드
					if(uploadFiles.length > 0) { 
						var formData = new FormData();
						
						for(var i=0; i < uploadFiles.length; i++) {
							formData.append('file', uploadFiles[i]);
						}
						
						formData.append('recNo', recordNo);
						
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
					location.href = contextPath+"/record/view?courseNo="+courseNo;
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});	
	
});


/********************************************************사진********************************************************/

//업로드할 파일 목록
var uploadFiles = [];
//삭제할 파일 목록
var deleteFiles = [];


/*사진 가져오기*/
function getImgs(recordNo) {
	
	console.log(recordNo);
	
	$.ajax({
		//보낼때
		url : contextPath+"/apiRec/getImgs",
		type : "post",
		//contentType : "application/json",
		data : {recordNo},

		//받을때
		//dataType : "json",
		success : function(imgList){
			//성공시 처리해야될 코드 작성
			console.log(imgList);
			
			if(imgList.length > 0) {
				$("#fileDragDesc").hide();
				$("#filesList").show();
				
				for(var i=0; i<imgList.length; i++) {
					
					prevRender(imgList[i], imgList[i].recordImgNo);
				}
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}
/*불러온 사진 미리보기*/
function prevRender(imgVo, no) {
	var div = '<div class="thumb">'+
					'<div class="close" data-no="'+no+'">'+
						'<span class="glyphicon glyphicon-remove">' +
					'</div>'+
					'<img src="'+contextPath+'/upload/'+imgVo.saveName+'"/>'+
				'</div>';
	$("#filesList").append(div);
}


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
	console.log("ㅇㅅㅇ?");
	var files = null;
	
	if(fileObject != null) {
		//파일 Drag 이용하여 등록시
		files = fileObject;
	} else {
		//직접 파일 등록시
		files = $('#multipaartFileList_' + fileIndex)[0].files;
		console.log(files);
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
	console.log(uploadFiles);
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb">'+
							'<div class="close" data-idx="'+idx+'">'+
								'<span class="glyphicon glyphicon-remove">' +
							'</div>'+
							'<img src="'+e.target.result+'"/>'+
						'</div>';
			$("#filesList").append(div);
		};						
	})(file,idx);
	reader.readAsDataURL(file);
}






































/********************************************************지도********************************************************/
function map(courseNo) {
	
	
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
				strokeOpacity: 1, //선의 불투명도 (0~1)
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