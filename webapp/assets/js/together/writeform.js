/**
 * 함께하기 글쓰기폼 js
 */
 
 /*------------------------------ 모달 --------------------------------*/ 
		
	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		//리스트 요청 + 그리기
		//fetchList();
		
	});
	
	/* 코스 버튼을 클릭했을 때 */
	$("#course-load").on("click", function() {
		
		console.log("코스 불러오기");

		
		//모달창 띄우기
		$("#courseModal").modal("show");
		
	});