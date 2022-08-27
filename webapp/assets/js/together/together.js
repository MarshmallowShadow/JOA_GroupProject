/**
 * 함께하기 리스트
 */
 
  /*------------------------------ 리스트 --------------------------------*/ 
  
    /* 준비되었을 때 */
 	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		//리스트 요청 + 그리기
		fetchList();
		
	});
 
    /* 북마크 아이콘을 클릭했을 때 */
    $("#ListArea").on("click", ".bookmark", function(){
		
	    var $this = $(this);
	    
	    //이벤트 no 알아내기
	    var eventNo = $this.data("eventno");
	    var tagged = $this.data("tagged");
	    
	    var map = {eventNo: eventNo
				   , userNo: userNo
				   , tagged: tagged};
	    
	    //서버 보내기 --> 저장
	    $.ajax({
		
			url : pageContext + "/api/together/bookmark",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(map),
			dataType : "json",
			success : function(eventTaggedVo){
				
				//성공 시 처리해야 될 코드 작성
				console.log(eventTaggedVo);				
				
				if(tagged == true) {
					$('[data-eventno="' + eventNo + '"]').children().attr("src", pageContext +'/assets/image/together/bookmarks_white.png');
					$this.data("tagged", false);
					$this.attr("data-tagged", "false");
				} else {
					$('[data-eventno="' + eventNo + '"]').children().attr("src", pageContext +'/assets/image/together/bookmarks_black.png');
					$this.data("tagged", true);
					$this.attr("data-tagged", "true");
				}
				
			}
			
		});
	    
	    //화면에서 변경될 부분을 그린다
		console.log(eventNo);
		
	});
 
 
 	/* 리스트 요청 */
	function fetchList(){
		
		$.ajax({
			
			url : pageContext + "/api/together/getList", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼 거 없으면 필요없음)
			data : JSON.stringify(crtPage), //@RequestBody로 데이터 보낼때 필수 (정보 보낼 거 없으면 필요없음)
			
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼 거 없으면 필요없음)
			dataType : "json",
			success : function(result){
				
				console.log(result);
				
				
				//컨트롤러 함수 실행 후 코드
				for(var i=0; i<result.togetherList.length; i++){
					render(result.togetherList[i], result.courseCate, "down");  //vo --> 화면에 그린다.
				}
				
				if(result.prev == true){
					renderPage(result.startPageBtnNo-1 , "◀");
				}
				
				for(var i=result.startPageBtnNo; i<=result.endPageBtnNo; i++){
					renderPage(i, i);
				}
				
				if(result.next == true){
					renderPage(result.endPageBtnNo+1 , "▶");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	}
	
	
 
 	/* 리스트 그리기 1개씩 */
	function render(Map, courseCate, opt) {
		
		console.log("render");
		console.log(Map);
		
		$(".btn").data("eventNo");
		
		var tagImg = pageContext +'/assets/image/together/bookmarks_white.png';
		var NtagImg = pageContext +'/assets/image/together/bookmarks_black.png';
		var bookmark = "bookmark";
		var image = "image";
		var join = "join";
		var endDate = new Date(Map.REGEND);
		var gray = "notYet";
		var black = "line_top";
		var over = "line_bottom";
		var mark = "mark";
		var joinGray = "";
		
		//현재 날짜에서 1일 전
		var today = new Date();
		today.setDate(today.getDate() - 1);
		
		console.log(today);
		
		//사용자 태그 여부 확인
		var bookmarkTag = '';
		
		console.log(Map.TAGGED != '');

		if(Map.TAGGED == '' || Map.TAGGED == undefined) {
			bookmarkTag += ' 					<button class="'+ bookmark +' btn" data-tagged="false" data-eventno="'+ Map.EVENTNO +'"> ' ;
			bookmarkTag += ' 						<img class="'+ image +'" src="'+ tagImg + '"> ' ;
			bookmarkTag += ' 					</button> ' ;
		} else {
			bookmarkTag += ' 					<button class="'+ bookmark +' btn" data-tagged="true" data-eventno="'+ Map.EVENTNO +'"> ' ;
			bookmarkTag += ' 						<img class="'+ image +'" src="'+ NtagImg + '"> ' ;
			bookmarkTag += ' 					</button> ' ;
		}
		
		if(endDate < today) {
			gray = "over";
			black = "date_over";
			over = "line_bottomOver";
			image = "image_over";
			bookmark = "bookmark_over";
			mark = "mark_over";
			joinGray = "joinGray";
		}
		if(userNo == Map.USERNO) {
			join = "joinOver";
			joinGray = "";
		}
		
		
		var str = '' ;
		str += ' <div class="chart"> ' ;
		str += ' 	<table class="'+ gray +'"> ' ;
		str += ' 		<thead> ' ;
		str += ' 			<tr class="top"> ' ;
		str += ' 				<th class="'+ black +'">'+ Map.REGSTART +' - '+ Map.REGEND +'</th> ' ;
		str += ' 				<th class="'+ mark +'"> ' ;	
		
		if(userNo != '') {
			str += bookmarkTag;
		}	
		
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 		</thead> ' ;
		str += ' 		<tbody onClick="window.open(\''+ pageContext +'/together/read/'+ Map.EVENTNO +'\', \'_self\');"> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="content">'+ Map.EVENTTITLE +'</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="content_course"> ' ;
		str += ' 					<span class="glyphicon glyphicon-map-marker" class="marking"></span>'+ Map.START +' - '+ Map.END +' ' ;
		str += ' 					<input type="hidden" name="courseNo"> ' ;
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 		</tbody> ' ;
		str += ' 		<tfoot> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="'+ over +'"> ' ;
		str += ' 					'+ courseCate[Map.COURSECATEGORY];
		str += ' 					<button type="submit" data-eventNo="'+ userNo +'" class="'+ join +' '+ joinGray +'"><span class="glyphicon glyphicon-user" id="join_icon"></span>'+ parseInt(Map.COUNT) +'/'+ Map.JOINMAX +'</button> ' ;
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 		</tfoot> ' ;
		str += ' 	</table> ' ;
		str += ' </div> ' ;
		
		if(opt == "down") {
			$("#ListArea").append(str);
		}else if(opt == "up") {
			$("#ListArea").prepend(str);
		}else {
			console.log("opt오류");
		}

 	}
 
 	function renderPage(pageNo, symbol){
	
		var str = '<li class="li"><a href="' + pageContext + '/together/together?crtPage=' + pageNo + '">' + symbol + '</a></li>';
		
		$(".ul").append(str);
		
	}
	

 
 