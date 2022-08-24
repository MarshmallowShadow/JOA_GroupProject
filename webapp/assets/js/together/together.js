/**
 * 함께하기 리스트
 */
 
  /*------------------------------ 리스트 --------------------------------*/ 
 
 	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		//리스트 요청 + 그리기
		fetchList();
		
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
		
		var tagImg = pageContext +'/assets/image/together/bookmarks_white.png';
		
		if(Map.tagged != null) {
			tagImg = pageContext + '/assets/image/together/bookmarks_black.png';
		}
		
		var str = '' ;
		str += ' <div class="chart"> ' ;
		str += '	<a href="'+ pageContext +'/together/read/'+Map.EVENTNO+'"> ';
		str += ' 		<table> ' ;
		str += ' 			<thead> ' ;
		str += ' 				<tr class="top"> ' ;
		str += ' 					<th class="line_top">'+Map.REGSTART+' - '+Map.REGEND+'</th> ' ;
		str += ' 					<th class="mark"> ' ;
		str += ' 						<button class="bookmark"> ' ;
		str += ' 							<img class="image" src="'+ tagImg + '"> ' ;
		str += ' 						</button> ' ;
		str += ' 					</th> ' ;
		str += ' 				</tr> ' ;
		str += ' 			</thead> ' ;
		str += ' 			<tbody> ' ;
		str += ' 				<tr> ' ;
		str += ' 					<th colspan="2" class="content">'+Map.EVENTTITLE+'</th> ' ;
		str += ' 				</tr> ' ;
		str += ' 				<tr> ' ;
		str += ' 					<th colspan="2" class="content_course"> ' ;
		str += ' 						<span class="glyphicon glyphicon-map-marker" class="marking"></span>'+ Map.START +' - '+ Map.END +' ' ;
		str += ' 						<input type="hidden" name="courseNo"> ' ;
		str += ' 					</th> ' ;
		str += ' 				</tr> ' ;
		str += ' 				<tr> ' ;
		str += ' 					<th colspan="2" class="line_bottom"> ' ;
		str += ' 						'+courseCate[Map.COURSECATEGORY];
		str += ' 						<button type="submit" class="join"><span class="glyphicon glyphicon-user" id="join_icon"></span>'+parseInt(Map.COUNT)+'/'+Map.JOINMAX+'</button> ' ;
		str += ' 					</th> ' ;
		str += ' 				</tr> ' ;
		str += ' 			</tbody> ' ;
		str += ' 		</table> ' ;
		str += ' 	</a> ' ;
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
	

 
 