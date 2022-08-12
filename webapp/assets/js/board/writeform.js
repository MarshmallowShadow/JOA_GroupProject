/**
 * 게시판 글쓰기폼 js
 */
 
 /*------------------------------ 모달 --------------------------------*/ 
		
	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		//리스트 요청 + 그리기
		//fetchList();
		
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
	
	$(document).ready(function() {
		
		console.log("페이지 준비");
		
		var courseNo = $("#courseNo");
		
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
	
	});
	
	//업로드할 파일 목록
	var uploadFiles = [];
	
	$(function() {
		//파일 드롭 다운
		fileDropDown();
	});
	
	//파일 드롭 다운
	function fileDropDown() {
		var dropZone = $("#drop");
		
		//drag 기능
		dropZone.on('dragenter', function(e){
			e.stopPropagation();
			e.preventDefault();
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
		});
		//drag 뺐을때
		dropZone.on('dragleave', function(e) {
			e.stopPropagation();
			e.preventDefault();
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
		});
		//drag 끝났을때
		dropZone.on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
		});
		//drag한 파일 떨어뜨렸을때
		dropZone.on('drop', function(e) {
			e.preventDefault();
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
			
			var files = e.originalEvent.dataTransfer.files;
			if(files != null) {
				if(files.length < 1) {
					console.log("폴더 업로드 불가");
					return;
				} else {
					selectFile(files);
				}
			} else {
				alert("ERROR");
			}
		});
	}
	
	//파일 선택시
	function selectFile(fileObject) {
		var files = null;
		
		if(fileObject != null) {
			//파일 Drag 이용하여 등록시
			files = fileObject;
		} else {
			//직접 파일 등록시
			files = $('#multipaartFileList_' + fileIndex)[0].files;
		}
		
		//다중파일 등록
		if(files != null) {
			
			if(files != null && files.length > 0) {
				$("#fileDragDesc").hide();
				$("#filesList").show();
			} else {
				$("#fileDragDesc").show();
				$("#filesList").hide();
			}
			
			
			for(var i = 0; i < files.length; i++) {
				console.log(files[i]);
				var file = files[i];
				var size = uploadFiles.push(file); //업로드 목록에 추가
				preview(file, size - 1); //미리보기 만들기
			}
			
		}
		
	}
	
	//미리보기 생성
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
				var div = '<div class="thumb">'+
								'<div class="close" data-idx="'+idx+'">'+
									'<span class="glyphicon glyphicon-remove">' +
								'</div>'+
								'<img src="'+e.target.result+'"title="'+escape(f.name)+'"/>'+
							'</div>';
				$("#filesList").append(div);
			};						
		})(file,idx);
		reader.readAsDataURL(file);
	}