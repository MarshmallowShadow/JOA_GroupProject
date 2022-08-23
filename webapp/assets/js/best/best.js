/**
 * 베스트
 */
 
 $(document).ready(function(){
	console.log("jquery로 요청 data만 받는 요청");
	
	//리스트 요청 + 그리기
	fetchList();
});

function fetchList(){
	var map = {
		course_cate: course_cate,
		count_cate: count_cate
	};
	
	$.ajax({
		
		url : contextPath + "/api/best/apiBest", //지도 api
		type : "post",
		//contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼 거 없으면 필요없음)
		//data : JSON.stringify(map), //@RequestBody로 데이터 보낼때 필수 (정보 보낼 거 없으면 필요없음)
		data: map, //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼 거 없으면 필요없음)
		//dataType : "json",
		success : function(result){
			
			console.log(result);
			
			
			
			
		}
	});
}