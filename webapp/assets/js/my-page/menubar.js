/*준비가 끝나면*/
function fetchList(){
	/*--------------------------------------------------*/
	/*카테고리 리스트 가져오기*/
	$.ajax({
		url : contextPath + "/api/my-page/get-category-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(categoryList){
			//컨트롤러 함수 실행 후 코드
			console.log(categoryList);
			//화면에 data + html로 띄운다(그린다).
			//리스트니까 for문으로 그리기!
			for(var i=0; i<categoryList.length; i++){
				render(categoryList[i], "down");	//vo --> 화면에 그린다.
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
}

function render(categoryList) {
	var str = '';
	str += '<li id="menuList" class="bookmark-menuList">';
	str += '	<a href="'+contextPath+'/my-page/bookmark/01">'+categoryList.cateName+'</a>';	//카테고리 번호에 따라 페이지 이동하기...!!
	str += '	<img id="edit-cate-name" class="editName" data-cateNo="'+categoryList.cateNo+'" value="'+categoryList.cateNo+'" src="'+contextPath+'/assets/image/my-page/edit.png">';
	str += '</li>';
	
	$(".categoryArea").append(str);
}

function render2(categoryList) {
	var str = '';
	str += '<option id="opt-del-cateNo" value="'+categoryList.cateNo+'" data-cateNo="'+categoryList.cateNo+'">'+categoryList.cateName+'</option>';
	
	$(".sel-delCategory").append(str);
}

function render3(categoryList){
	var str = '';
	str = '<input id="input-cateName-edit" type="text" data-cateNo="'+categoryList.cateNo+'" placeholder="'+categoryList.cateName+'">';
	
	$("#cateName-modal").append(str);
}




$(document).ready(function(){
	console.log("준비")
	$("#menuBar").hide();
	
	/*메뉴창 열기*/
	$(".menuBar-open").click(function(){
		$(".menuBar-open").hide();
		$("#menuBar").show();
	});
	
	/*메뉴창 닫기*/
	$(".menuBar-close-btn").click(function(){
		$("#menuBar").hide();
		$(".menuBar-open").show();
	});
	
	/*메뉴창 안의 모달들 숨겨두기*/
    $(".category-add-btn").modal('hide');
    $(".category-del-btn").modal('hide');
    $(".category-modify-btn").modal('hide');

	
	/*--------------------------------------------------*/
	/*카테고리 리스트 가져오기*/
	fetchList();	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 추가하기*/
	$(".plus-btn").click(function(){
		console.log("카테고리추가");
		$(".category-add-btn").modal("show");
	  
		$("#add-bookmark-category").on("click", function(){
			console.log("즐겨찾기 추가 버튼 클릭");
			//데이터 수집
			var catename = $("[name=catename]").val();
			var categoryVo = {
				/*cateNo: cateNo,*/
				userNo: userNo,
				cateName: catename
			};
			console.log(categoryVo);
		
			$.ajax({
				url : contextPath + "/api/my-page/add-category-list",		
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(categoryVo),		//js객체를 JSON문자열로 변경->그래야 controller에서 @RequestBody로 받을 수 있음
				dataType : "json",
				success : function(categoryVo){
					//성공시 처리해야될 코드 작성
					console.log(categoryVo);
				
					//1개의 데이터 리스트에 추가(그리기)
					render(categoryVo, "up");
				
					//데이터 저장후, 입력폼에 있는 내용 사라지게 하기.
					$("[name=catename]").val("");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			$(".category-add-btn").modal('hide');
		});
	});
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 삭제하기*/
	$(".minus-btn").click(function(){
		console.log("카테고리삭제");
		$("option").remove();
		
		/*삭제리스트 가져오기*/
		$.ajax({
			url : contextPath + "/api/my-page/get-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(categoryList){
				//컨트롤러 함수 실행 후 코드
				console.log(categoryList);
				//화면에 data + html로 띄운다(그린다).
				//리스트니까 for문으로 그리기!
				for(var i=0; i<categoryList.length; i++){
					render2(categoryList[i], "down");	//vo --> 화면에 그린다.
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		//모달창 띄우기
		$(".category-del-btn").modal("show");
	});
	
	//모달창의 삭제버튼 클릭할때
	$("#del-bookmark-category").on("click", function(){
		console.log("모달>삭제버튼 클릭")
		/*$(".bookmark-menuList").remove();*/
				
		//삭제할 데이터 모으기
		var cateNo = $("#del-select-list").val();
        console.log("cateNo", cateNo);
		
		//서버로 데이터 전송(ajax)
		$.ajax({
			url : contextPath + "/api/my-page/del-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(cateNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(result){
				/*성공시 처리해야될 코드 작성*/
				console.log(result);
				$(".bookmark-menuList").remove();
				fetchList();
				/*location.reload(true);*/
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		$(".category-del-btn").modal("hide");
	});
	
	
	/*--------------------------------------------------*/
	/*카테고리 이름 수정하기 - 보류*/
	$("body").on("click", "#edit-cate-name", function(){
		console.log("카테고리이름 수정");
		
		/*수정리스트 가져오기*/
		$.ajax({
			url : contextPath + "/api/my-page/get-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(categoryList){
				//컨트롤러 함수 실행 후 코드
				//리스트니까 for문으로 그리기!
				for(var i=0; i<categoryList.length; i++){
					render3(categoryList[i], "down");	//vo --> 화면에 그린다.
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		var cateNo = $("#input-cateName-edit").data("cateNo");
		console.log(cateNo);
		/*var cateNo = $(".bookmark-menuList").val();*/
	
		//모달창 띄우기
		$(".category-modify-btn").modal("show");	  
	});
   
});   

