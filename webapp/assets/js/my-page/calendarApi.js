/*달력 API*/

var rList =
	[	//ajax 데이터 불러올 부분(배열)///////////////////////////////
		{
	      title: '테스트 코스',
	      start: '2022-08-01',
		}
	];
	
	
/*function render(guestbookVo){
	console.log("render()");
	//var name = guestbookVo.name;
	
	var str = '';
	str += '<table id="t'+guestbookVo.no+'" class="guestRead">';
	str += '	<colgroup>';
	str += '		<col style="width: 10%;">';
	str += '		<col style="width: 40%;">';
	str += '		<col style="width: 40%;">';
	str += '		<col style="width: 10%;">';
	str += '	</colgroup>';
	str += '	<tr>';
	str += '		<td>'+guestbookVo.no+'</td>';
	str += '		<td>'+guestbookVo.name+'</td>';
	str += '		<td>'+guestbookVo.regDate+'</td>';
	str += '		<td><button class="btnDel" type="button" data-no="' +guestbookVo.no+ '" data-age="">삭제</button></td>';	//data는 여러개 설정가능
	str += '	</tr>';
	str += '	<tr>';
	str += '		<td colspan=4 class="text-left">'+guestbookVo.content+'</td>';
	str += '	</tr>';
	str += '</table>';
	
	
	if(opt == "down"){
		$("#listArea").append(str);
	}else if(opt == "up"){
		$("#listArea").prepend(str);
	}else{
		console.log("opt오류");
	}
}*/	


function render(rMap) {
	
	var str = '<li class="reportContent">';
	str += '	<div style="cursor: pointer;" >'; /*onclick="window.location='';"*/
	str += '		<img class="contentImg" src="${pageContext.request.contextPath}/assets/image/my-page/sample.jpg">';
	str += '		<p class="contentTitle">88888888888<p class="date" id="nows"></p></p>';
	str += '		<p class="content">링거 맞고 뛰었다^^</p>';
	str += '		<p class="contentDate">2022.07.18 &nbsp; 10:03</p>';
	str += '		<div class="modify-del-icons">';
	str += '			<span class="glyphicon glyphicon-pencil"></span>&nbsp;';
	str += '			<span class="glyphicon glyphicon-trash"></span>';
	str += '		</div>';
	str += '	</div>';
	str += '</li>';
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
				
				$(".reportBox").append(render(rMap));
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

