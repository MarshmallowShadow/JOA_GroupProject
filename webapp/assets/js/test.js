/* ************************* menu-slider ************************* */

window.onload = function(){
    slideOne();
    slideTwo();
}
let sliderOne = document.getElementById("slider-1");
let sliderTwo = document.getElementById("slider-2");
let displayValOne = document.getElementById("range1");
let displayValTwo = document.getElementById("range2");
let minGap = 0;
let sliderTrack = document.querySelector(".slider-track");
let sliderMaxValue = document.getElementById("slider-1").max;
function slideOne(){
    if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
        sliderOne.value = parseInt(sliderTwo.value) - minGap;
    }
    displayRange();
    fillColor();
}
function slideTwo(){
    if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
        sliderTwo.value = parseInt(sliderOne.value) + minGap;
    }
    displayRange();
    fillColor();
}
function displayRange(){
	displayValOne.textContent = sliderOne.value + " km";
	displayValTwo.textContent = sliderTwo.value + " km";
	
	if((sliderOne.value == sliderTwo.value && sliderOne.value != 50)
			|| (sliderOne.value == 1 && sliderTwo.value == 50)) {
		
		displayValOne.textContent = "";
		$("#range-sign").html("");
		
		if(sliderTwo.value == 1){
			displayValTwo.textContent = sliderTwo.value + " km 이하";
		}
	} else {
		displayValOne.textContent = sliderOne.value + "km";
		$("#range-sign").html("~");
		
		if(sliderOne.value == 1 && sliderTwo.value != 50){
			displayValOne.textContent = sliderOne.value + " km 이하";
		}
	}
	
	
	if(sliderTwo.value == 50){
		displayValTwo.textContent = '무제한';
	}
	
	
}

function fillColor(){
    percent1 = (sliderOne.value / sliderMaxValue) * 100;
    percent2 = (sliderTwo.value / sliderMaxValue) * 100;
    sliderTrack.style.background = `linear-gradient(to right, #dadae5 ${percent1}% , #3264fe ${percent1}% , #3264fe ${percent2}%, #dadae5 ${percent2}%)`;
}
/* *************************!menu-slider!************************* */