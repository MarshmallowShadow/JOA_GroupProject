/**
 * 기록 작성하기 js
 */

$(document).ready(function() {
/*사진 드래그앤 드롭*/ 
var uploadFiles = [];
var $drop = $("#drop");
$drop.on("dragenter", function(e) {//드래그 요소가 들어왔을 때  
	
	$(this).addClass('drag-over');}).on("dragleave", function(e) { //드래그 요소가 나갔을때
		
		$(this).removeClass('drag-over');}).on("dragover", function(e) {  
			
			e.stopPropagation();
			e.preventDefault();
		
		}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
				
			e.preventDefault();
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files;  //드래그&드랍 항목
			for(var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadFiles.push(file);  //업로드 목록에 추가
				preview(file, size - 1);  //미리보기 만들기
					
			}
		});
		
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
				$("#course-pic").remove();
				
				var div = '<div class="pic-content"> \
							<div class="close" data-idx="' + idx + '"><img src="../../../assets/image/course/pic-cancel.png"></div> \
							<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
						</div>';
				$("#thumbnails").append(div);
			};
		})(file, idx);
		reader.readAsDataURL(file);
	}
	
	/* 등록 버튼 클릭 했을때 */
	/* $("#btnSubmit").on("click", function() {
		var formData = new FormData();
		$.each(uploadFiles, function(i, file) {
			if(file.upload != 'disable')  //삭제하지 않은 이미지만 업로드 항목으로 추가
			formData.append('upload-file', file, file.name);
		});
		$.ajax({
			url: '/api/etc/file/upload',
			data : formData,
			type : 'post',
			contentType : false,
			processData: false,
			success : function(ret) {
				alert("완료");
			}  
		});
	}); */
	$("#thumbnails").on("click", ".close", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		uploadFiles[idx].upload = 'disable';  //삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove();  //프리뷰 삭제
	});
});