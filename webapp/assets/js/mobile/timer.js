/**
 * 
 */

var deciseconds = 0;
var seconds = 0;
var minutes = 0;
var hours = 0;

var disSec = "0";
var disMin = "0";
var disHr = "0";

var interval = null;

$("#btn-start").on("click", function(){
	$(this).toggleClass("btn-blue");
	$(this).toggleClass("btn-pink");
	
	//console.log($("#btn-start").attr("class"));
	
	if($("#btn-start").hasClass("btn-pink")) {
		$("#btn-reset").css("display", "none");
		$("#btn-course-write").css("display", "none");
		interval = window.setInterval(stopWatch, 100);
	} else if($("#btn-start").hasClass("btn-blue")) {
		$("#btn-reset").css("display", "inline");
		$("#btn-course-write").css("display", "inline");
		window.clearInterval(interval);
	}
});

function stopWatch() {
	deciseconds++;
	
	if(deciseconds / 10 == 1){
		deciseconds = 0;
		seconds++;
		
		if(seconds / 60 == 1) {
			seconds = 0;
			minutes ++;
			
			if(minutes / 60 == 1) {
				minutes = 0;
				hours ++;
			}
		}
	}
	
	if(seconds < 10) {
		disSec = "0";
	} else {
		disSec = "";
	}
	if(minutes < 10) {
		disMin = "0";
	} else {
		disMin = "";
	}
	if(hours < 10) {
		disHr = "0";
	} else { 
		disHr = "";
	}
	
	$("#display").html(disHr + hours + ":" + disMin + minutes + ":" + disSec + seconds + "." + deciseconds);
}

$("#btn-reset").on("click", function(){
	window.clearInterval(interval);
	
	deciseconds = 0;
	seconds = 0;
	minutes = 0;
	hours = 0;
	
	disSec = "0";
	disMin = "0";
	disHr = "0";
	
	$("#display").html("00:00:00.0");
});
