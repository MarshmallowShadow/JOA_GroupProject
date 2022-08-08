/*달력 API*/
$(document).ready(function(){
   	
   	var userNo = '${authUser.userNo}';
   	
   	$.ajax({
		url : "${pageContext.request.contextPath}/api/my-page/get-record-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendarApi');
    
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
    	/*dayPopoverFormat: 'event-popover',*/
    	editable: false,
		selectable: true,
		businessHours: true,	//주말 구분;
		dayMaxEvents: false, // allow "more" link when too many events
		
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


