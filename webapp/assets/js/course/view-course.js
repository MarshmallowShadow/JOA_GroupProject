/*코스 정보 상세보기 js*/
/*차트 https://www.chartjs.org/docs/latest/*/

$(document).ready(function() {
	console.log("tq");
	
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
	
/********************************************************즐겨찾기 모달********************************************************/
	/*즐겨찾기 버튼 클릭*/
	$("#bookmark").on("click", function() {
		//모달창 띄우기
		$("#bookmark-list").modal("show");
	});
	
	
	
	
	
/********************************************************좋아요 버튼********************************************************/
	
	$(".like-btn").on("click", function() {
		
		var courseNo = $("#courseNo").val();
		
		if(authUserNo != null || authUserNo != ""){
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
			var imageSrc1 = contextPath+'/assets/image/course/location-bl.png', // 마커이미지 주소
				imageSrc2 = contextPath+'/assets/image/course/location-b.png', // 마커이미지 주소
		    imageSize = new kakao.maps.Size(64, 64), // 마커이미지 크기
		    imageOption = {offset: new kakao.maps.Point(32, 64)}; // 마커 위치
		    
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
				strokeWeight: 10, //선 두께
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

