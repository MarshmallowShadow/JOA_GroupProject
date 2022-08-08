/*달력 API*/
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendarApi');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
    	/*dayPopoverFormat: 'event-popover',*/
    	editable: false,
		selectable: true,
		businessHours: true,	//주말 구분;
		dayMaxEvents: false, // allow "more" link when too many events
		
		
		
		select: function(arg) {
    	  console.log(arg);

	        var title = prompt('입력할 일정:');
	    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay,
	            backgroundColor:"yellow",
	            textColor:"blue"
	          })
	        }
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	    	  // 있는 일정 클릭시,
	    	  console.log("#등록된 일정 클릭#");
	    	  console.log(arg.event);
	    	  
	        /*if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        }*/
	      },
		
		
		events: [	//나의 기록 여기다가 추가해야할 듯?
		//ajax 데이터 불러올 부분///////////////////////////////
			{
	          title: '테스트 코스',
	          start: '2022-08-01',
	          textcolor: 'white',
			},
	        {
	          title: '88길',
	          start: '2022-08-08',
	        },
	        {
	          title: '새로운 길',
	          start: '2022-08-12',
	         },
	        {
	          title: '이쁜 길',
	          start: '2022-08-15',
	        },
	        {
	          title: '데이트 코스',
	          start: '2022-08-18'
	        }
		]
	});
	calendar.render();
	
	
	
	
	
	/*달력폼 준비가 끝나면*/
	$(".fc-event-title").click(function(){
		console.log("이벤트");
		alert("이벤트다!!");
	});
	
});


