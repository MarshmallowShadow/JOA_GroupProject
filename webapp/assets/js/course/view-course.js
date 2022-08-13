/*코스 정보 상세보기 js*/
/*차트 https://www.chartjs.org/docs/latest/*/

$(document).ready(function() {
	console.log("tq");

	
	/*------------모달창-------------------------------------------------------------------*/
	/*코스제목 수정 버튼 클릭*/
	$("#update-btn").on("click", function() {
		//모달창 띄우기
		$("#title-update").modal("show");
	});
	
	/*$("#modTitle-btn").on("click", function() {
		
		var modTitle = $("#title-update").val();
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
				}
				
	
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});*/
	
	
	/*즐겨찾기 버튼 클릭*/
	$("#bookmark").on("click", function() {
		//모달창 띄우기
		$("#bookmark-list").modal("show");
	});
	
	
	
	
	
	
	/*------------지도-------------------------------------------------------------------*/
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
	
	
	
	
	
	
	/*------------차트-------------------------------------------------------------------*/
	
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
			console.log(cateData);
			
			
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
			console.log(diffiData);
	
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





