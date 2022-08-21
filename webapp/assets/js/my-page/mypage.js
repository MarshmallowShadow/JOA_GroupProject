/*사이드메뉴*/
function categoryList(){
	/*--------------------------------------------------*/
	/*카테고리 리스트 가져오기*/
	$.ajax({
		url : contextPath + "/api/my-page/get-category-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(categoryList){
			//컨트롤러 함수 실행 후 코드
			console.log(categoryList);
			//화면에 data + html로 띄운다(그린다).
			//리스트니까 for문으로 그리기!
			for(var i=0; i<categoryList.length; i++){
				categoryRender(categoryList[i], "down");	//vo --> 화면에 그린다.
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}

function categoryRender(categoryList) {
	var str = '';
	str += '<li id="menuList" class="bookmark-menuList" value="'+categoryList.cateNo+'">';
	str += '	<a href="'+contextPath+'/my-page/bookmark?cateNo='+categoryList.cateNo+'">'+categoryList.cateName+'</a>';	//카테고리 번호에 따라 페이지 이동하기...!!
	str += '	<img id="edit-cate-name" class="editName" data-cateno="'+categoryList.cateNo+'" data-catename="'+categoryList.cateName+'" src="'+contextPath+'/assets/image/my-page/edit.png">';
	str += '</li>';
	
	$(".categoryArea").append(str);
}


function cateDelRender(categoryList) {
	var str = '';
	str += '<option id="opt-del-cateNo" value="'+categoryList.cateNo+'" data-cateNo="'+categoryList.cateNo+'">'+categoryList.cateName+'</option>';
	
	$(".sel-delCategory").append(str);
}

function cateEditRender(categoryList){
	var str = '';
	str += '<input id="input-cateName-edit" type="text" value="" data-catename="'+categoryList.cateName+'" data-cateno="'+categoryList.cateNo+'" placeholder="'+categoryList.cateName+'">';
	
	$("#cateName-modal").append(str);
}







/*달력 API*/
var rList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{
					title: '테스트 코스',
					start: '2022-08-01',
				}
			];

function calendarRender(rMap) {
	var str = '';
	str += '<li class="reportContent">';
	str += '	<div>';
	str += '		<a href="'+contextPath+'/record/view?courseNo='+rMap.COURSENO+'" target="_blank">';
	str += '			<img class="contentImg" src="'+contextPath+'/upload/'+rMap.SAVENAME+'">';
	str += '			<p class="contentTitle">'+rMap.TITLE+'<p class="date" id="nows"></p></p>';
	str += '			<p class="content">'+rMap.REVIEW+'</p>';
	str += '			<p class="contentDate">'+rMap.REGDATE+' &nbsp; 10:03</p>';
	str += '		</a>';
	str += '		<div class="modify-del-icons">';
	str += '			<span class="glyphicon glyphicon-pencil"></span>&nbsp;';
	str += '			<span class="glyphicon glyphicon-trash"></span>';
	str += '		</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".reportBox").append(str);
}





/*지도 이미지 가져오기*/
function map(cMap) {
	/*var courseNo = $("#courseNo").val();*/
	var courseNo = cMap.COURSENO;
	//좌표 배열
	var path = [];
	//지도 범위정보 객체
	var bounds = new kakao.maps.LatLngBounds();
	// 마커 위치
	var markerPosition = [];
	
	/*좌표 가져오기*/
	$.ajax({
		//보낼때
		url : contextPath+"/apiCo/getPoint",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(points){
			//성공시 처리해야될 코드 작성
			console.log(points);
			
			for(var i=0; i<points.length; i++) {
				var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
				
				//좌표 배열에 추가
				path.push(latlng);
				
				//범위정보에 마커 좌표 추가
				bounds.extend(latlng);
			}
			
			//지도 범위 재설정
			map.setBounds(bounds);
			
			
			/*마커 생성*/
			
			//마커 이미지 설정
			var imageSrc1 = contextPath+'/assets/image/course/pin-b.png', // 마커이미지 주소
				imageSrc2 = contextPath+'/assets/image/course/pin-r.png', // 마커이미지 주소
		    imageSize = new kakao.maps.Size(32, 32), // 마커이미지 크기
		    imageOption = {offset: new kakao.maps.Point(16, 32)}; // 마커 위치
		    
		    var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize, imageOption);
		    var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption);
		    
			//시작 마커와 마지막 마커 배열 저장
			var firstLocation = new kakao.maps.LatLng(points[0].y, points[0].x); //시작위치
			var lastLocation = new kakao.maps.LatLng(points[points.length-1].y, points[points.length-1].x); //끝위치
			
			var firstMk = {
				title: 'start',
				latlng: firstLocation,
				image: markerImage1
			};
			markerPosition.push(firstMk);
			var lastMk = {
				title: 'end',
				latlng: lastLocation,
				image: markerImage2
			};
			markerPosition.push(lastMk);
			
			// 마커 생성
			for(var i=0; i<markerPosition.length; i++) {
				var marker = new kakao.maps.Marker({
					map: map,
				    position: markerPosition[i].latlng,
				    title: markerPosition[i].title,
				    image: markerPosition[i].image,
				    clickable: true
				});
				console.log(marker);
			}
			
			/*라인 그리기*/
			//선 생성
			var polyline = new kakao.maps.Polyline({
				map: map, //표시할 지도
				path: path, //선의 좌표
				strokeWeight: 6, //선 두께
				strokeColor: 'rgb(50, 108, 249)', //선 색깔
				strokeOpacity: 0.9, //선의 불투명도 (0~1)
				strokeStyle: 'solid' //선 스타일
			});

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
		
	//지도 정보
	var mapContainer = document.getElementById('courseMapImg');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3, //지도의 레벨(확대, 축소 정도)
		draggable: false, //마우스 휠 이동, 확대, 축소 여부
		scrollwheel: false, //마우스 휠 확대 축소 여부
		disableDoubleClick: false, //더블클릭 이벤트 여부
		disableDoubleClickZoom: true, //더블클릭 줌 이벤트 여부
		keyboardShortcuts: false //키보드 이동, 확대, 축소 여부
	};
	
	// 이미지 지도 생성
	//var map = new kakao.maps.StaticMap(mapContainer, mapOption);
	var map = new kakao.maps.Map(mapContainer, mapOption);

}





/*나의 코스*/
var cList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{	courseNo: '1',
					userNo: '1',
					title: '테스트',
					id: 'joa123',
					regDate: '2022-08-08',
					openStatus: '공개'
				}
			];


function mycourseRender(cMap) {
	var str = '';
	str += '<li class="course-list-result">';
	str += '	<div class="listBox" >'; /*style="cursor: pointer;" onclick="window.location='';"   */
	str += '	  	<a href="'+contextPath+'/course/view?courseNo='+cMap.COURSENO+'" target="_blank"><div id="courseMapImg" class="courseImg"><img src="'+contextPath+'/assets/image/my-page/sample.jpg" ></div></a>';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">['+cMap.OPENSTATUS+']'+cMap.TITLE+' &nbsp;<img class="besticon" src="'+contextPath+'/assets/image/best/cgold.jpg"></p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+contextPath+'/assets/image/my-page/heart'+cMap.LIKED+'.png">';
	str += '					<img class="bookmark-cancel-btn" src="'+contextPath+'/assets/image/main/star.png">';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+cMap.ID+'</p>';
	str += '			<p id="courseInfo">조회수123 * '+cMap.REGDATE+'</p>';
	str += '			<p id="courseInfo">후기글123 &nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png"></p>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-course-list-box").append(str);
}
















document.addEventListener('DOMContentLoaded', function() {
	/*//달력폼/////////////////////////////////////////////////////////////*/
	console.log(userNo)
    $.ajax({
		url : contextPath + "/api/my-page/get-record-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		
		success : function(result){
			$(".reportBox").empty();
			eList = result;
			//컨트롤러 함수 실행 후 코드
			for (var i = 0; i < result.length; i++) {
				var rMap = result[i];
				rList.push(
					{
						title: rMap.TITLE,
						start: rMap.REGDATE
					}
				);
				calendarRender(rMap, "down");
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
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	
	/*//////달력폼 준비가 끝나면//////////////////////////////////////////////////*/
	$("#calendarApi").on("click", ".fc-daygrid-day.fc-day", function(){	
		console.log("this", this);
		var $this = $(this); // a[name=btnUrl] 을 this로 가져온다
		var todaydate = $this.data('date');
		console.log(todaydate);
		/*alert("날짜는???   " + todaydate);*/
		
		$(".monthReport").css('background', 'white');
		$(".monthReport").css('color', 'black');
		$(".monthReport").css('border', 'rgb(101,101,101) 1px solid');
		
		$(".todayReport").css('background', 'rgb(50, 108, 249)');
		$(".todayReport").css('color', 'white');
		$(".todayReport").css('border', 'rgb(50, 108, 249) 1px solid');
		
		$(".reportContent").remove();
		for(var i=0; i < eList.length; i++){
			if(todaydate == eList[i].REGDATE){
				calendarRender(eList[i]	, "down");	
			}
		}
	});
});	
	
	
	
	
	
	
	
	
	
	
$(window).ready(function(){	
	console.log("준비");
	var userNo = window.userNo;
	console.log(userNo);
	
	/*///////즐겨찾기/좋아요 버튼들/////////////////////////////////////////////*/
	console.log('즐겨찾기');
	$(".course-like-cancel").hide();
	$(".course-bookmark-cancel").hide();
    
	
	$(".like-cancel-btn").click(function(){
		console.log("좋아요해제");
		$(".course-like-cancel").modal("show");
   	});
   
	$(".bookmark-cancel-btn").click(function(){
		console.log("즐겨찾기해제");
		$(".course-bookmark-cancel").modal("show");
	});
	
	
	
	
	
	
	
	
	
	/*///////사이드메뉴/////////////////////////////////////////////*/
	$("#menuBar").hide();
	
	/*메뉴창 열기*/
	$(".menuBar-open").click(function(){
		$(".menuBar-open").hide();
		$("#menuBar").show();
	});
	
	
	/*메뉴창 닫기*/
	$(".menuBar-close-btn").click(function(){
		$("#menuBar").hide();
		$(".menuBar-open").show();
	});
	
	/*메뉴창 안의 모달들 숨겨두기*/
    $(".category-add-btn").hide('modal');
    $(".category-del-btn").hide('modal');
    $(".category-modify-btn").hide('modal');
    

	
	
	
	
	
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 리스트 가져오기*/
	categoryList();
	
	
	/*--------------------------------------------------*/
	/*카테고리 추가하기*/
	$(".plus-btn").click(function(){
		console.log("카테고리추가");
		$("[name=catename]").val("");
		$(".category-add-btn").show('modal');
	 }); 
	 
	$("#add-bookmark-category").on("click", function(){
		console.log("즐겨찾기 추가 버튼 클릭");
		//데이터 수집
		var catename = $("[name=catename]").val();
		var categoryVo = {
			/*cateNo: cateNo,*/
			userNo: userNo,
			cateName: catename
		};
		console.log(categoryVo);
	
		$.ajax({
			url : contextPath + "/api/my-page/add-category-list",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(categoryVo),		//js객체를 JSON문자열로 변경->그래야 controller에서 @RequestBody로 받을 수 있음
			dataType : "json",
			success : function(categoryList){
				//성공시 처리해야될 코드 작성
				console.log(categoryList);
			
				//1개의 데이터 리스트에 추가(그리기)
				categoryRender(categoryList, "up");
			
				//데이터 저장후, 입력폼에 있는 내용 사라지게 하기.
				$("[name=catename]").val("");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		$(".category-add-btn").hide('modal');
	});
	//모달창의 닫기버튼 클릭할때
	$("#add-bookmark-category-close").on("click", function(){
		$("[name=catename]").val("");
		$(".category-add-btn").hide('modal');
	});
	$("#add-bookmark-category-cancel").on("click", function(){
		$("[name=catename]").val("");
		$(".category-add-btn").hide('modal');
	});
	
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 삭제하기*/
	$(".minus-btn").click(function(){
		console.log("카테고리삭제");
		$("option").remove();
		
		/*삭제리스트 가져오기*/
		$.ajax({
			url : contextPath + "/api/my-page/get-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(categoryList){
				//컨트롤러 함수 실행 후 코드
				console.log(categoryList);
				//화면에 data + html로 띄운다(그린다).
				//리스트니까 for문으로 그리기!
				for(var i=0; i<categoryList.length; i++){
					cateDelRender(categoryList[i], "down");	//vo --> 화면에 그린다.
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		//모달창 띄우기
		$(".category-del-btn").show('modal');
	});
		
	//모달창의 삭제버튼 클릭할때
	$("#del-bookmark-category").on("click", function(){
		console.log("모달>삭제버튼 클릭")
		//삭제할 데이터 모으기
		var cateNo = $("#del-select-list").val();
        console.log("cateNo", cateNo);
		
		//서버로 데이터 전송(ajax)
		$.ajax({
			url : contextPath + "/api/my-page/del-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(cateNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(result){
				/*성공시 처리해야될 코드 작성*/
				console.log(result);
				$(".bookmark-menuList").remove();
				categoryList();
				/*location.reload(true);*/
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		$(".category-del-btn").hide('modal');
	});
	
	//모달창의 닫기버튼 클릭할때
	$("#del-bookmark-category-close").on("click", function(){
		$(".category-del-btn").hide('modal');
	});
	$("#del-bookmark-category-cancel").on("click", function(){
		$(".category-del-btn").hide('modal');
	});

	
	
	
	
	
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 이름 수정하기 - 보류*/
	$("body").on("click", "#edit-cate-name", function(){
		console.log("카테고리이름 수정");
		console.log("this", this);
		var $this = $(this); // a[name=btnUrl] 을 this로 가져온다
		var cateNo = $this.data("cateno");
		console.log(cateNo);
		
		
		$.ajax({
			url : contextPath + "/api/my-page/edit-category-list", //컨트롤러 RequestMapping url 작성하기
			type : "post",
			contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
			data : JSON.stringify(cateNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
				//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
			dataType : "json",
			success : function(categoryList){
				//컨트롤러 함수 실행 후 코드
				console.log(categoryList);
				//화면에 data + html로 띄운다(그린다).
				//리스트니까 for문으로 그리기!
				$("#cateName-modal input").remove();
				for(var i=0; i<categoryList.length; i++){
					cateEditRender(categoryList[i], "down");	//vo --> 화면에 그린다.
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		var cateName = $this.data("catename");
		var cateNo = $this.data("cateno");
        console.log(cateName, cateNo);
		//모달창 띄우기
		$(".category-modify-btn").show('modal');
		
		
		
		
		
		//모달창의 변경버튼 클릭할때
		$("#edit-bookmark-category").on("click", function(){
			console.log("모달>변경버튼 클릭")
			//삭제할 데이터 모으기
			/*var cateName = $("#input-cateName-edit").val();
			var cateNo = $("#input-cateName-edit").data("cateNo");
	        console.log(cateName, cateNo);*/
			
			var updateCateVo = {
				cateName: cateName, 
				cateNo: cateNo
			};
			console.log(updateCateVo)
			
			//서버로 데이터 전송(ajax)
			$.ajax({
				url : contextPath + "/api/my-page/modify-category", //컨트롤러 RequestMapping url 작성하기
				type : "post",
				contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
				data : JSON.stringify(updateCateVo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
					//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
				dataType : "json",
				success : function(result){
					/*성공시 처리해야될 코드 작성*/
					console.log(result);
					$(".bookmark-menuList").remove();
					categoryList();
					
					//데이터 저장후, 입력폼에 있는 내용 사라지게 하기.
					//$("#input-cateName-edit").val("");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			$(".category-modify-btn").hide('modal');
		});
		
	});
	
	
	
		
	//모달창의 닫기버튼 클릭할때
	$("#edit-bookmark-category-close").on("click", function(){
		$(".category-modify-btn").hide('modal');
	});
	$("#edit-bookmark-category-cancel").on("click", function(){
		$(".category-modify-btn").hide('modal');
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*--------------------------------------------------*/
	/*나의 코스 리스트 가져오기*/
	$.ajax({
		url : contextPath + "/api/my-page/get-course-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			console.log(result);
			$(".my-course-list-box").empty();
			
			//리스트니까 for문으로 그리기!
			for (var i = 0; i < result.length; i++) {
				var cMap = result[i];
				cList.push(
					{	courseNo: cMap.COURSENO,
						userNo: cMap.USERNO,
						title: cMap.TITLE,
						id: cMap.ID,
						regDate: cMap.REGDATE,
						openStatus: cMap.OPENSTATUS,
						liked: cMap.LIKED
					}
				);
				mycourseRender(cMap, "down");
				
			}
			console.log(cList);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	console.log(cList);
});




