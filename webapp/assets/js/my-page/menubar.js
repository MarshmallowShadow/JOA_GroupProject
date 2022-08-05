/*준비가 끝나면*/
$(document).ready(function(){
	console.log("준비")
	$("#menuBar").hide();
	
	
	$(".menuBar-open").click(function(){
		$("#menuBar").show();
		
	});
	
	$(".menuBar-close-btn").click(function(){
		$("#menuBar").hide();
		
	});
	
    $(".category-add-btn").hide();
    $(".category-del-btn").hide();
    $(".category-modify-btn").hide();
    
    
	
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



/*function openNav() {
	  document.getElementById("menuBar").style.width = "400px";
	}
	
	function closeNav() {
	  document.getElementById("menuBar").style.width = "0";
	}
	*/
