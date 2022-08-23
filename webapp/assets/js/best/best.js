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
			
		//반복문으로 Top1~15 + 게시물
		for(var i=0; i<=15; i++){
			render(result[i]);
			} 
		}
	});
	
	//게시물 3개씩 커팅
	var render = function(cMap) {
		
		//for(var i=0; i<cMap.recordList.length; i++) { }
		var str = '';
		str += '<div class="img-list">';
		str += '	<a href=""> <img src="${pageContext.request.contextPath}/assets/image/best/map.jpg" />';
		str += '		<span id="best-text"> 지역 : <span>' + cMap.LOCATION + '</span> | 거리 : <span>${map.DISTANCE}</span></span></a>';
		str += '	<div class="comment-text"> ';
		
		//기록 필터링 if문 넣을 예정
		for(var i=0; i<cMap.RECORDLIST.length; i++) {
			
		}
		
		str += '	<c:forEach items="${map.recordList}" var="review">';
		str += '		<div class="comment-text1">${review}</div>';
		str += '	</c:forEach>';
		str += '		<div class="button-ttl">';
		str += '			<span class="bi bi-calendar4-week"></span> <span class="imgbutton-text">${map.R_COUNT}</span>';
		str += '			<div class="imgbutton">';
		str += '				<img src="${pageContext.request.contextPath}/assets/image/main/heart.png"><span>좋아요 : ${map.L_COUNT}</span> ';
		str += '				<img src="${pageContext.request.contextPath}/assets/image/main/star.png"><span>즐겨찾기 : ${map.F_COUNT}</span>';
		str +='				</div>';
		str +='			</div>';
		str +='		</div>';
		str +='	</div>';
		
		
	}
}