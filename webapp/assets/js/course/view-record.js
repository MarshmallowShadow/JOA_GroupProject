/*코스 기록 상세보기 js*/


$(document).ready(function() {
	
	var courseNo = $("#courseNo").val();
	console.log(courseNo);
	
	getRecord(courseNo);
	
	
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
	
	
	/*------------사진모달-------------------------------------------------------------------*/
	lightbox.option({
		/*https://lokeshdhakar.com/projects/lightbox2/*/
		'alwaysShowNavOnTouchDevices': true, /*이미지 세트 일때 화면 양쪽 누르면 사진 변경*/
		'disableScrolling': true, /*화면 스크롤링 막기*/
		'fadeDuration': 300, /*페이드인아웃*/
		'imageFadeDuration': 300, /*페이드인*/
		'fitImagesInViewport': true, /*이미지 크기 자동조절*/
		'wrapAround': true, /*이미지 끝나도 다시 첫이미지로*/
		'albumLabel': "총 %2개 중 %1번째 이미지"
	});
});

/*------------기록리스트-------------------------------------------------------------------*/
function getRecord(courseNo) {
	
	console.log("getRecord");
	
	$.ajax({
		//보낼때
		url : contextPath+"/getRecord",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(recList){
			//성공시 처리해야될 코드 작성
			console.log(recList);

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};