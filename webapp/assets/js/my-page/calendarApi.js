/*달력 API*/

var rList =
	[	//ajax 데이터 불러올 부분(배열)///////////////////////////////
		{
	      title: '테스트 코스',
	      start: '2022-08-01',
		}
	];
	
function render(rMap, opt) {
	
	var str = '<li class="reportContent">';
	str += '	<div style="cursor: pointer;" >'; /*onclick="window.location='';"*/
	str += '		<img class="contentImg" src="contextPath+/assets/image/my-page/sample2.jpg">';
	str += '		<p class="contentTitle">'+rMap.TITLE+'<p class="date" id="nows"></p></p>';
	str += '		<p class="content">'+rMap.REVIEW+'</p>';
	str += '		<p class="contentDate">'+rMap.REGDATE+' &nbsp; 10:03</p>';
	str += '		<div class="modify-del-icons">';
	str += '			<span class="glyphicon glyphicon-pencil"></span>&nbsp;';
	str += '			<span class="glyphicon glyphicon-trash"></span>';
	str += '		</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".reportBox").append(str);
	/*if(opt == "down"){
		$(".reportBox").append(str);
	}else if(opt == "up"){
		$(".reportBox").prepend(str);
	}else{
		console.log("opt오류");
	}*/
}

document.addEventListener('DOMContentLoaded', function() {
    $.ajax({
		url : contextPath + "/api/my-page/get-record-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			
			for (var i = 0; i < result.length; i++) {
				var rMap = result[i];
				rList.push(
					{
						title: rMap.TITLE,
						start: rMap.REGDATE
					}
				);
				render(rMap, "down");
				/*$(".reportBox").append(render(rMap));*/
			}
			console.log(rList);
			
			var calendarEl = document.getElementById('calendarApi');
    	    var calendar = new FullCalendar.Calendar(calendarEl, {
		    	locale: 'ko',
		    	/*dayPopoverFormat: 'event-popover',*/
		    	editable: false,
				selectable: true,
				businessHours: true,	//주말 구분;
				dayMaxEvents: false, // allow "more" link when too many events
				events: rList
			});
			calendar.render();
			
			
			/*달력폼 준비가 끝나면*/
			$(".fc-event-title").click(function(){
				console.log("이벤트");
				alert("이벤트다!!");
			});
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});

