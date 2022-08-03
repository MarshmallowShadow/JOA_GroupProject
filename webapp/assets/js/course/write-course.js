/**
 * 코스 작성하기 js
 */
 
$(document).ready(function() {
	console.log("페이지 준비");
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3 //지도의 레벨(확대, 축소 정도)
	}
	
	var map = new kakao.maps.Map(container, options); //지도 생성
});

//지도 확대 버튼
function zoomIn() {
	map.setLevel(map.getLevel() - 1);
}

//지도 축소 버튼
function zoomOut() {
	map.setLevel(map.getLevel() + 1);
}