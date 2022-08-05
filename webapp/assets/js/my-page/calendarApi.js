/*달력 API*/
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
    	dayPopoverFormat: 'event-popover',
    	editable: false,
		selectable: true,
		businessHours: true,	//주말 구분;
		dayMaxEvents: false, // allow "more" link when too many events
		events: [	//나의 기록 여기다가 추가해야할 듯?
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
	          groupId: 999,
	          title: '학원 가는 길',
	          start: '2022-08-10'
	        },
	        {
	          groupId: 999,
	          title: '집에 가는 길',
	          start: '2022-08-10'
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
		alert("hey!이거슨 이벤트!");
	});
	
});







