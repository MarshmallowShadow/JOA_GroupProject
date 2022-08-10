/*준비가 끝나면*/
function render(categoryList) {
	var str = '';
	str += '<li id="menuList">';
	str += '	<a href="'+contextPath+'/my-page/bookmark/01">'+categoryList.cateName+'</a>';	//카테고리 번호에 따라 페이지 이동하기...!!
	str += '	<img class="editName" src="'+contextPath+'/assets/image/my-page/edit.png">';
	str += '</li>';
	
	
	$(".categoryArea").append(str);
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
    $(".category-add-btn").hide();
    $(".category-del-btn").hide();
    $(".category-modify-btn").hide();
    
    
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 추가하기*/
	$(".plus-btn").click(function(){
      console.log("카테고리추가");
      $(".category-add-btn").modal("show");
      
      $("#add-bookmark-category").on("click", function(){
			console.log("즐겨찾기 추가 버튼 클릭");
			
			//데이터 수집
			var catename = $("[name=catename]").val();
			/*
			
			var guestVo = {
				name: name, 
				password: password, 
				content: content
			};
			
			
			console.log(guestVo);
			
			
			
			$.ajax({
				
				url : "${pageContext.request.contextPath }/api/guestbook/add2",		
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(guestVo),		//js객체를 JSON문자열로 변경->그래야 controller에서 @RequestBody로 받을 수 있음
				dataType : "json",
				success : function(gVo){
					//성공시 처리해야될 코드 작성
					console.log(gVo);
					
					//1개의 데이터 리스트에 추가(그리기)
					render(gVo, "up");
					
					
					//데이터 저장후, 입력폼에 있는 내용 사라지게 하기.
					$("[name=name]").val("");
					$("[name=password]").val("");
					$("[name=content]").val("");
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});*/
			
		});
      
   	});
   
   	$(".minus-btn").click(function(){
      console.log("카테고리삭제");
      $(".category-del-btn").modal("show");
   	});
   	
   	
   	$(".editName").click(function(){
      console.log("카테고리이름 수정");
      $(".category-modify-btn").modal("show");
   });
   
   
   
	
});

