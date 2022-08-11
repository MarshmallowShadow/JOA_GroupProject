/**
 * 게시판 글쓰기폼 js
 */
 
 /*------------------------------ 모달 --------------------------------*/ 
		
		$(document).ready(function() {
			
			console.log("jquery로 요청 data만 받는 요청");
			
			//리스트 요청 + 그리기
			fetchList();
			
		});
		
		/* 코스 버튼을 클릭했을 때 */
		$("#course_choice").on("click", function() {
			
			console.log("코스 불러오기");

			
			//모달창 띄우기
			$("#courseModal").modal("show");
			
		});
		
		/* 함께 버튼을 클릭했을 때 */
		$("#together_choice").on("click", function() {
			
			console.log("코스 불러오기");

			
			//모달창 띄우기
			$("#togetherModal").modal("show");
			
		});
 
 /*----------------------------- 사진 드래그앤 드롭 ------------------------------*/ 
	
	$("#input-file").bind('change', function() {
		selectFile(this.files);
	});
	
	//업로드 파일 삭제
	$("#filesList").on("click", ".close", function(e) {
		var $target = $(e.target).parent();
		var idx = $target.attr('data-idx');
		console.log(idx);
		delete uploadFiles[idx]; //배열에서 요소 삭제
		
		$target.parent().remove(); //프리뷰 삭제
	});
	
	