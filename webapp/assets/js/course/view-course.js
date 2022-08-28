/*코스 정보 상세보기 js*/
/*차트 https://www.chartjs.org/docs/latest/*/

$(document).ready(function() {
	var courseNo = $("#courseNo").val();
	
	/*지도 그리기*/
	map();

	
/********************************************************코스제목 수정 모달********************************************************/
	/*코스제목 수정 모달 띄우는 버튼 클릭*/
	$("#update-btn").on("click", function() {
		//모달창 띄우기
		$("#title-update").modal("show");
	});
	
	/*코스제목 수정 버튼 클릭*/
	$("#modTitle-btn").on("click", function() {
		
		var modTitle = $("#modTitle").val();
		var courseNo = $("#courseNo").val();
		
		$.ajax({
			//보낼때
			url : contextPath+"/apiCo/modifyTitle",
			type : "post",
			//contentType : "application/json",
			data : {modTitle, courseNo},
			
			//받을때
			//dataType : "json",
			success : function(result){
				//성공시 처리해야될 코드 작성
				console.log(result);
				
				if(result == 'success') {
					$("#course-title").text(modTitle);
					$("#title-update").modal("hide");
				}
				
	
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});
	
	/*취소버튼*/
	$(".btn-secondary").on("click", function() {
		$(this).modal("hide");
	});
	
/********************************************************코스제목 수정 모달********************************************************/
	/*코스 공개 설정 모달창 띄우기*/
	$("#open-btn").on("click", function() {
		//모달창 띄우기
		$("#open-update").modal("show");
	});

	/*코스 공개 설정 수정 버튼 클릭*/
	$("#modOpen-btn").on("click", function() {
		
		var openStatus = $('input[name="openStatus"]:checked').val();
		var courseNo = $("#courseNo").val();
		
		$.ajax({
			//보낼때
			url : contextPath+"/apiCo/modifyOpen",
			type : "post",
			//contentType : "application/json",
			data : {openStatus, courseNo},
			
			//받을때
			//dataType : "json",
			success : function(result){
				//성공시 처리해야될 코드 작성
				console.log(result);
				
				if(result == 'success') {
					$("#open-update").modal("hide");
					location.reload();
				}
				
	
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});

	
/********************************************************즐겨찾기 모달********************************************************/
	/*즐겨찾기 버튼 클릭*/
	$("#bookmark").on("click", function() {
		
		$("#fevList").empty();
		
		//즐겨찾기 목록 가져오기
		$.ajax({
			//보낼때
			url : contextPath+"/apiFav/getFavCate",
			type : "post",
			//contentType : "application/json",
			data : {authUserNo, courseNo},
			
			//받을때
			//dataType : "json",
			success : function(favList){
				//성공시 처리해야될 코드 작성
				console.log(favList);
				
				for(var i=0; i<favList.length; i++) {
					render(favList[i]);
				}
				
				//모달창 띄우기
				$("#bookmark-list").modal("show");
	
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		
	});
	
	
	/*즐겨찾기 추가 버튼 클릭*/
	$("#bookmark-add").on("click", function() {
		
		
		
		var bmkList = [];
		var notBmkList = [];
		
		$("input[name='bookmark']:checked").each(function() {
			var bmk = parseInt($(this).val());
			bmkList.push(bmk);
		});
		
		$("input[name='bookmark']:not(:checked)").each(function() {
			var bmk = parseInt($(this).val());
			notBmkList.push(bmk);
		});
		
		console.log(notBmkList);
		
		//즐겨찾기 목록 가져오기
		$.ajax({
				//보낼때
			url : contextPath+"/apiFav/addFav",
			type : "post",
			//contentType : "application/json",
			data : {authUserNo, courseNo, bmkList, notBmkList},
			
			//받을때
			//dataType : "json",
			success : function(result){
				//성공시 처리해야될 코드 작성
				
				if(result > 0) {
					var src = contextPath + "/assets/image/main/star.png";
					$("#bookmark").attr("src", src);
				} else {
					var src = contextPath + "/assets/image/main/star-off.png";
					$("#bookmark").attr("src", src);
				}
				
				//모달창 닫기
				$("#bookmark-list").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});
	
	/*즐겨찾기 리스트 출력*/
	function render(fevVo) {
		
		console.log(fevVo.COURSENO);
		
		var str = "";
	    str += '<li>';
	    str += '	<div>';
	    str += '		<input type="checkbox" id="bookmark'+fevVo.CATENO+'" name="bookmark" value="'+fevVo.CATENO + '"';
	    
	    if(fevVo.COURSENO != 0) {
			str += 'checked';
		}
	    
	    str += '>';
	    str += '		<label for="bookmark'+fevVo.CATENO+'">'+fevVo.CATENAME+'</label>';
	    str += '	</div>';
	    str += '</li>';	
	    
	    $("#fevList").append(str);
	}
	
	
	
	
	
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
	
	
	
	
/*********************************************************차트*********************************************************/
	
	var courseNo = $("#courseNo").val();
	
	/*디폴트 - 종목별 차트*/
	category(courseNo);
	
	var charts = $("#charts");
	$('input:radio[name="chart-choose"]').change(function() {
		if($(this).val() === 'diffi') {
			$('#chart').remove();
			$('#charts').append('<canvas id="chart"></canvas>');
			difficult(courseNo);
		} else if($(this).val() === 'category') {
			$('#chart').remove();
			$('#charts').append('<canvas id="chart"></canvas>');
			category(courseNo);
		}
	});
	
	
	
});

/* 종목별 차트 */
function category(courseNo) {
	
	
	//종목 데이터 가져오기
	$.ajax({
		//보낼때
		url : contextPath+"/apiCo/getCateData",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(cateData){
			//성공시 처리해야될 코드 작성
			//console.log(cateData);
			
			
			const labels = [
				'산책',
			    '조깅',
			    '러닝',
			    '마라톤',
			    '자전거',
			    '그림',
			  ];
			
			const data = {
				labels: labels,
				datasets: [{
			      label: '종목',
			      backgroundColor: 'rgb(50, 108, 249)',
			      borderColor: 'rgb(50, 108, 249)',
			      data: cateData
				}]
			};
			
			const config = {
				type: 'bar',
				data: data,
			    options: {
					scale: {
						ticks: {
							min: 0,
							stepSize: 1
						}
					},
			    	maintainAspectRatio: false,
			    	plugins: {
			    		legend: {
				    		display: false,
				    		labels: {
				    			font: {
				    				size: 12,
				    				family: 'Nanum Gothic'
				    			}
				    		}
				    	}
			    	}
			    }
			};
			  
			const chart = new Chart(
				document.getElementById('chart'),
				config
			);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	
	
	
}

/* 난이도별 차트 */
function difficult(courseNo) {
	
	//종목 데이터 가져오기
	$.ajax({
		//보낼때
		url : contextPath+"/apiCo/getDiffiData",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(diffiData){
			//성공시 처리해야될 코드 작성
			//console.log(diffiData);
	
			const labels = [
				'쉬움',
			    '보통',
			    '어려움',
			  ];
			
			const data = {
			    labels: labels,
			    datasets: [{
			      label: '난이도',
			      backgroundColor: [
			    	  'rgb(255, 99, 132)',
			          'rgb(54, 162, 235)',
			          'rgb(255, 205, 86)'
			      ],
			      borderColor: 'rgb(255, 255, 255)',
			      data: diffiData,
			      hoverOffset: 4
			    }]
			  };
			
			const config = {
			    type: 'doughnut',
			    data: data,
			    options: {
			    	maintainAspectRatio: false,
			    	plugins: {
			    		legend: {
				    		labels: {
				    			font: {
				    				size: 12,
				    				family: 'Nanum Gothic'
				    			}
				    		}
				    	}
			    	}
			    }
			};
			  
			const chart = new Chart(
				document.getElementById('chart'),
				config
			);
	
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}




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
			
			// 마커 생성
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
			
			//인포윈도우
			/*var iwContent = '<div class="mk-info">시작</div>',
			    iwPosition = firstLocation,
			    iwRemoveable = true;
			    
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
			
			
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});*/
			
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
	var map = new kakao.maps.Map(mapContainer, mapOption);

}

