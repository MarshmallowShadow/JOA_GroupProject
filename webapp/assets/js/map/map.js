
$(document).ready(function(){
	/*
	$(window).on("click", function(){
		$(".fmenu").css("display", "none");
		$(".fmenu-btn-selected").addClass("fmenu-btn");
		$(".fmenu-btn").removeClass("fmenu-btn-selected");
	});
	*/
	
	$("#btn-cate").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("cate");
	});
	
	$("#btn-dist").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("dist");
	});
	
	$("#btn-diff").on("click", function(){
		$(this).toggleClass("fmenu-btn-selected");
		$(this).toggleClass("fmenu-btn");
		console.log("diff");
	});
	
});
