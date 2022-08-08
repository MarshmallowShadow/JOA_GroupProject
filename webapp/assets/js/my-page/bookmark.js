/*준비가 끝나면*/
$(document).ready(function(){
	console.log('즐겨찾기');
	$(".course-like-cancel").hide();
	$(".course-bookmark-cancel").hide();
    
	
	$(".like-cancel-btn").click(function(){
		console.log("좋아요해제");
		$(".course-like-cancel").modal("show");
   	});
   
	$(".bookmark-cancel-btn").click(function(){
		console.log("즐겨찾기해제");
		$(".course-bookmark-cancel").modal("show");
	});
   	
   	
});
