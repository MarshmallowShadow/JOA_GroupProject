/*준비가 끝나면*/
$(document).ready(function(){
    console.log('메뉴바!!');
    $(".category-add-btn").hide();
    $(".category-del-btn").hide();
    $(".category-modify-btn").hide();
    
    $(".hello").click(function(){
		$(".hello").hide();
	});
	
	
	$(".plus-btn").click(function(){
      console.log("카테고리추가");
      $(".category-add-btn").modal("show");
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




