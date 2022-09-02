/**
 * 게시판 글쓰기폼 js
 */
 
 /*------------------------------ 모달 --------------------------------*/ 
		
	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
	});
	
/*------------------------------ 코스모달 ----------------------------------*/
	
	/* 코스 버튼을 클릭했을 때 */
	$("#course_choice").on("click", function() {
		
		console.log("코스 불러오기");
		
		$("#courseModal").modal("show");
		
	});
	
	/* 코스 no */
	$("#courseModal").on("click", ".fav", function(){
		
		var $this = $(this);
		
		var cateNo = $this.data("cate-no");
		
		//ajax
		$.ajax({
							
			//보낼 때
			url : pageContext + "/apiBoard/getCourseList",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(cateNo),
			dataType: "json",
			
			//받을 때
			//dataType : "json",
			success : function(result){
				
				$(".courseChoose ul").empty();
				
				for(var i=0; i<result.length; i++){
					$(".courseChoose ul").append('<li class="co" data-title="' + result[i].title + '" data-course-no="'+ result[i].courseNo +'" role="presentation"><a role="menuitem" tabindex="-1">' + result[i].title + '</a></li>');
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	//코스 즐겨찾기 선택된 값 띄우기
	$('#courseModal').on('click', '#fav-menu li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기 
	    $('#dropdownMenu1').html($(this).text() + '<span class="caret"></span>');
	    
	});

	//코스 선택
	$("#courseModal").on("click", ".co", function(){
		
		$(".co").removeClass("c_selected");
		$(this).addClass("c_selected");
		
	});
	
	//즐겨찾기된 코스 선택된 값 띄우기
	$('#courseModal').on('click', '#fav-course li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기 
	    $('#dropdownMenu2').html($(this).text() + '<span class="caret"></span>');
	    
	});
	
	/* 코스 SAVE 버튼 눌렀을 때 */
	$("#c-save").on("click", function() {
		
		var courseNo = $(".c_selected").data("course-no");
		
		var folderIcon = '<span class="glyphicon glyphicon-folder-open gray" id="folder"></span>';
		
		if(courseNo != null || isNaN(courseNo) == false) {
			//black text
			$("#course_choice").addClass("blackBtn");
			
			//change course text
			$("#course_choice").html(folderIcon + $(".c_selected").data("title"));
			
			//hidden add courseNo
			$("#courseFinal").val(courseNo);
		}
		
		//모달 닫기
		$("#courseModal").modal("hide");
		
	});
	
/*------------------------------ 함께모달 ----------------------------------*/
	
	/* 이벤트 종류 선택 */
	$("#togetherModal").on("click", ".fil", function(){
		
		var $this = $(this);
		
		var filCate = parseInt($this.data("fil-cate"));
		
		console.log(filCate);
		
		var map = {
			filCate: filCate,
			userNo: userNo
		};
		
		//ajax
		$.ajax({
							
			//보낼 때
			url : pageContext + "/apiBoard/getEventList",
			type : "post",
			data : map,
			//받을 때
			//dataType : "json",
			success : function(result){
				
				$(".togetherChoose ul").empty();
				
				for(var i=0; i<result.length; i++){
					$(".togetherChoose ul").append('<li class="ev" data-event-title="' + result[i].eventTitle + '" data-event-no="' + result[i].eventNo + '" role="presentation"><a role="menuitem" tabindex="-1">' + result[i].eventTitle + '</a></li>');
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	//함께하기 항목 중 선택된 값 띄우기
	$('#togetherModal').on('click', '#t-fil li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기 
	    $('#dropdownMenu1').html($(this).text() + '<span class="caret"></span>');
	    
	});
	
	//이벤트 선택
	$("#togetherModal").on("click", ".ev", function(){
		
		$(".ev").removeClass("e_selected");
		$(this).addClass("e_selected");
		
	});
	
	//함께하기 항목 중 선택 이벤트 값 띄우기
	$("#togetherModal").on('click', '#t-list li > a', function() {
		
	    //버튼에 선택된 항목 텍스트 넣기
	    $('#dropdownMenu2').html($(this).text() + '<span class="caret"></span>');
	    
	});
	
	/* 코스 SAVE 버튼 눌렀을 때 */
	$("#t-save").on("click", function() {
		
		var eventNo = $(".e_selected").data("event-no");
		
		var personIcon = '<span class="glyphicon glyphicon-user gray" id="man"></span>';
		
		if(eventNo != null || isNaN(eventNo) == false) {
			//black text
			$("#together_choice").addClass("blackBtn");
			
			//change course text
			$("#together_choice").html(personIcon + $(".e_selected").data("event-title"));
			
			//hidden add courseNo
			$("#togetherFinal").val(eventNo);
		}
		
		//모달 닫기
		$("#togetherModal").modal("hide");
		
	});
	
	/* 함께 버튼을 클릭했을 때 */
	$("#together_choice").on("click", function() {
		
		console.log("코스 불러오기");
		
		//모달창 띄우기
		$("#togetherModal").modal("show");
		
	});
	
 /*------------------------------ 사진 드래그앤 드롭 -----------------------------*/ 
	
	$(document).ready(function() {
		
		console.log("페이지 준비");
		
	});
	
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
	
 /*----------------------------- 게시판 글쓰기 등록하기 ----------------------------*/ 
 
	$("#post").on("click", function() {
		
		//데이터 가져오기
		var boardCategory = $("[name='boardCategory']").val();
		var title = $("[name='title']").val();
		var content = $("[name='content']").val();
		var eventNo = $("[name='eventNo']").val() || null;
		var courseNo = $("[name='courseNo']").val() || null;
		var userNo = $("[name='userNo']").val();
		
		//boardVo 생성
		var boardVo = {
			boardCategory: boardCategory
			, title: title
			, eventNo: eventNo
			, courseNo: courseNo
			, content: content
			, userNo: userNo
		};
		
		console.log(boardVo);
		
		//boardVo 전송
		$.ajax({
			
			//보낼 때
			url : pageContext +"/apiBoard/write",
			type : "post",
			//contentType : "application/json",
			data : boardVo,
	
			//받을 때
			//dataType : "json",
			success : function(boardNo){
				
				//성공 시 처리해야 될 코드 작성
				console.log("boardNo:"+boardNo);
				
				if(boardNo > 0) {
									
					//업로드할 사진이 있을 때 사진 업로드
					if(uploadFiles.length > 0) { 
						
						var formData = new FormData();
						
						for(var i=0; i < uploadFiles.length; i++) {
							formData.append('file', uploadFiles[i]);
						}
						
						formData.append('boardNo', boardNo);
						
						$.ajax({
							
							//보낼 때
							url : pageContext + "/apiBoard/boardImgWrite",
							type : "post",
							//contentType : "application/json",
							data : formData,
							
							processData: false,
							contentType: false,
							enctype : 'multipart/form-data',
							
							//받을 때
							//dataType : "json",
							success : function(imgResult){
								
								//성공 시 처리해야 될 코드 작성
								console.log("img:"+imgResult);
							},
							
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
							
						});
						
					}
					
					location.href = pageContext + "/board/read/" + boardNo;
				}
			},
			
			error : function(XHR, status, error) {console.error(status + " : " + error);}
			
		});
		
	});
 
 /*------------------------------ 사진 드래그앤 드롭 -----------------------------*/ 
	
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
		//drag 뺐을 때
		dropZone.on('dragleave', function(e) {
			
			e.stopPropagation();
			e.preventDefault();
			
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
			
		});
		//drag 끝났을 때
		dropZone.on('dragover', function(e) {
			
			e.stopPropagation();
			e.preventDefault();
			
			//드롭다운 영역 css
			//dropZone.css('background-color', '#FFFFFF');
			
		});
		//drag한 파일 떨어뜨렸을 때
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
	
	//파일 선택 시
	function selectFile(fileObject) {
		
		var files = null;
		
		if(fileObject != null) {
			//파일 Drag 이용하여 등록시
			files = fileObject;
		} else {
			//직접 파일 등록 시
			files = $('#multipaartFileList_' + fileIndex)[0].files;
		}
		
		//다중 파일 등록
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
	
	
	