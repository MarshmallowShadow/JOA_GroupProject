/**
 * 함께하기 리스트
 */
 
  /*------------------------------ 리스트 --------------------------------*/ 
 
 	$(document).ready(function() {
		
		console.log("jquery로 요청 data만 받는 요청");
		
		//리스트 요청 + 그리기
		//fetchList();
		
	});
 
 	/* 리스트 요청 */
	function fetchList(){
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/together/together",		
			type : "post",
			//contentType : "application/json",
			//data : {name: "홍길동"},
			
			dataType : "json",
			success : function(togetherList){
				//화면 data + html 그린다
				for(var i=0; i<togetherList.length; i++){
					render(togetherList[i], "down");  //vo --> 화면에 그린다.
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	}
 
 	/* 리스트 그리기 1개씩*/
	function render(map, opt) {
		
		console.log("render");
		
		var str = '' ;
		str += ' <div class="chart"> ' ;
		str += ' 	<table> ' ;
		str += ' 		<thead> ' ;
		str += ' 			<tr class="top"> ' ;
		str += ' 				<th class="line_top">${tMap.REGSTART} - ${tMap.REGEND}</th> ' ;
		str += ' 				<th class="mark"> ' ;
		str += ' 					<button class="bookmark"> ' ;
		str += ' 						<img class="image" src="${pageContext.request.contextPath}/assets/image/together/bookmarks_black.png"> ' ;
		str += ' 					</button> ' ;
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 		</thead> ' ;
		str += ' 		<tbody> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="content">${tMap.TITLE}</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="content_course"> ' ;
		str += ' 					<span class="glyphicon glyphicon-map-marker" class="marking"></span>${tMap.MINORDERNO} - ${tMap.MAXORDERNO} ' ;
		str += ' 					<input type="hidden" name="courseNo"> ' ;
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 			<tr> ' ;
		str += ' 				<th colspan="2" class="line_bottom"> ' ;
		str += ' 					${tMap.COURSECATEGORY} ' ;
		str += ' 					<button type="submit" class="join"><span class="glyphicon glyphicon-user" id="join_icon"></span>${tMap.COUNT}/${tMap.JOINMAX}</button> ' ;
		str += ' 				</th> ' ;
		str += ' 			</tr> ' ;
		str += ' 		</tbody> ' ;
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
 
 
 
 