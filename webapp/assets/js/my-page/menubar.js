
/*준비가 끝나면*/
$(document).ready(function(){
    console.log('메뉴바!!');
    
    $(".hello").click(function(){
		$(".hello").hide();
	});
	
	
	$("#plus-btn").click(function(){
		$(".category-add-btn").show();
	});
	
});

/*var add = document.getElementById("hello");*/


