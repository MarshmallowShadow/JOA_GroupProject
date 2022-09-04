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
	str += '	<img id="edit-cate-name" class="editName" data-toggle="modal" data-target=".category-modify-btn" data-cateno="'+categoryList.cateNo+'" data-catename="'+categoryList.cateName+'" src="'+contextPath+'/assets/image/my-page/edit.png">';
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
	/*str += '<input id="input-cateName-edit" type="text" value="" data-catename="'+categoryList.cateName+'" data-cateno="'+categoryList.cateNo+'" placeholder="'+categoryList.cateName+'">';
	*/
	
	str += '<input id="input-cateName-edit" type="text" class="form-control" name="catename" value="" data-catename="'+categoryList.cateName+'" data-cateno="'+categoryList.cateNo+'" placeholder="'+categoryList.cateName+'">';
	
	$("#cateName-modal").append(str);
}







/*달력 API*/
var rList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{
					/*title: '테스트 코스',
					start: '2022-08-01',*/
				}
			];

function calendarRender(rMap) {
	
	
	var imgPath = contextPath + '/assets/image/map/map-icon.jpg';
	if(rMap.SAVENAME != undefined) {
		imgPath = contextPath+'/upload/' + rMap.SAVENAME;
	}
	
	var str = '';
	str += '<li class="reportContent">';
	str += '	<div>';
	str += '		<a href="'+contextPath+'/record/view?courseNo='+rMap.COURSENO+'" target="_blank">';
	str += '			<img class="contentImg" src="'+imgPath+'">';
	str += '			<p class="contentTitle">'+rMap.TITLE+'<p class="date" id="nows"></p></p>';
	str += '			<p class="content">'+rMap.REVIEW+'</p>';
	str += '			<p class="contentDate">'+rMap.REGDATE1+'</p>';
	str += '		</a>';
	str += '		<div class="modify-del-icons">';
	str += '			<a href="'+contextPath+'/record/modify?courseNo='+rMap.COURSENO+'&recordNo='+rMap.RECORDNO+'"><span class="glyphicon glyphicon-pencil" style="cursor:pointer"></span></a>&nbsp;';
	str += '			<span id="record-del-button" class="glyphicon glyphicon-trash" data-toggle="modal" data-target=".myrecord-del-modal" data-recordno="'+rMap.RECORDNO+'" style="cursor:pointer"></span>';
	str += '		</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".reportBox").append(str);
}

function calendarNullRender() {
	var str = '';
	str += '<li class="reportContent">';
	str += '	<p>';
	str += '		기록이 없어요ㅠㅠ';
	str += '	</p>';
	str += '</li>';

	$(".reportBox").append(str);
}



/*나의 코스*/
var cList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{	/*courseNo: '1',
					userNo: '1',
					title: '테스트',
					id: 'joa123',
					regDate: '2022-08-08',
					openStatus: '공개'*/
				}
			];


function mycourseRender(cMap) {
	var img = contextPath + '/assets/image/map/map-icon.jpg';
	if(cMap.SAVENAME != undefined) {
		img = contextPath+'/upload/' + cMap.SAVENAME;
	}
	
	var heartonoff = contextPath + '/assets/image/main/heart-off.png';
	if(cMap.LIKED != undefined) {
		heartonoff = contextPath + '/assets/image/main/heart.png';
	}
	
	var favorite = contextPath + '/assets/image/main/star-off.png';
	if(cMap.FAVORITE != undefined) {
		favorite = contextPath + '/assets/image/main/star.png';
	}
	
	var ocStatus = '공개'
	if(cMap.OPENSTATUS !='open'){
		ocStatus = '비공개'
	}
	/*var pCount = contextPath + '/assets/image/main/star-off.png';
	if(cMap.PCOUNT != undefined) {
		pCount = contextPath + '/assets/image/main/new.png';
	}else{
		cMap.PCOUNT = '0';
	}
	*/
	
	
	var newpost = '&nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png">';
	var pCount;
	if(cMap.PCOUNT != undefined){
		pCount = cMap.PCOUNT + newpost;
	}else{
		pCount = '0';
	}
	
	
	var str = '';
	str += '<li class="course-list-result">';
	str += '	<div class="listBox" >'; /*style="cursor: pointer;" onclick="window.location='';"   */
	str += '	  	<a href="'+contextPath+'/course/view?courseNo='+cMap.COURSENO+'" target="_blank"><img id="courseMapImg" class="courseImg" src="'+img+'"></a>';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">['+ocStatus+'] '+cMap.TITLE+' </p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+heartonoff+'" data-courseno="'+cMap.COURSENO+'">';  
	str += '					<img class="bookmark-cancel-btn" src="'+favorite+'" data-courseno="'+cMap.COURSENO+'" data-toggle="modal" data-target=".bookmark-checkbox-list" >';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+cMap.ID+'</p>';
	str += '			<p id="courseInfo">'+cMap.REGDATE+'</p>';
	str += '			<a href="'+contextPath+'/board/board?boardCategory=post&courseNo=' + cMap.COURSENO + '"><p id="courseInfo">후기글 '+pCount+' </p></a>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-course-list-box").append(str);
}




/*즐겨찾기 리스트 출력*/
function bookmarkSelRender(fevVo) {
	console.log(fevVo.COURSENO);
	
	var str = "";
    str += '<li>';
    str += '	<div>';
    str += '		<input type="checkbox" id="bookmark'+fevVo.CATENO+'" name="bookmark" value="'+fevVo.CATENO + '"';
    
    if(fevVo.COURSENO != 0) {
		str += 'checked';
	}
    
    str += '>';
    str += '		<label for="bookmark'+fevVo.CATENO+'">'+fevVo.CATENAME+'</label>';
    str += '	</div>';
    str += '</li>';	
    
    $("#fevList").append(str);
}



/*나의 즐겨찾기(전체리스트)*/
var fList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{	/*courseNo: '1',
					userNo: '1',
					title: '테스트',
					id: 'joa123',
					regDate: '2022-08-08',
					openStatus: '공개'*/
				}
			];



function myfavRender(fMap){
	var img = contextPath + '/assets/image/map/map-icon.jpg';
	if(fMap.SAVENAME != undefined) {
		img = contextPath+'/upload/' + fMap.SAVENAME;
	}
	
	var heartonoff = contextPath + '/assets/image/main/heart-off.png';
	if(fMap.LIKED != undefined) {
		heartonoff = contextPath + '/assets/image/main/heart.png';
	}
	
	var favorite = contextPath + '/assets/image/main/star-off.png';
	if(fMap.FAVORITE != undefined) {
		favorite = contextPath + '/assets/image/main/star.png';
	}
	
	var ocStatus = '공개'
	if(fMap.OPENSTATUS !='open'){
		ocStatus = '비공개'
	}
	
	var newpost = '&nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png">';
	var pCount;
	if(fMap.PCOUNT != undefined){
		pCount = fMap.PCOUNT + newpost;
	}else{
		pCount = '0';
	}
	
	
	var str = '';
	str += '<li class="course-list-result" id="my-favorite-all-result-list">';
	str += '	<div class="listBox" >';
	str += '	  	<a href="'+contextPath+'/course/view?courseNo='+fMap.COURSENO+'" target="_blank"><img id="courseMapImg" class="courseImg" src="'+img+'"></a>';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">['+ocStatus+'] '+fMap.TITLE+' </p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+heartonoff+'" data-courseno="'+fMap.COURSENO+'">';  
	str += '					<img class="bookmark-cancel-btn" src="'+favorite+'" data-courseno="'+fMap.COURSENO+'" data-toggle="modal" data-target=".bookmark-checkbox-list" >';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+fMap.ID+'</p>';
	str += '			<p id="courseInfo">'+fMap.REGDATE+'</p>';
	str += '			<a href="'+contextPath+'/board/board?boardCategory=post&courseNo=' + fMap.COURSENO + '"><p id="courseInfo">후기글 '+pCount+' </p></a>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-fav-all-list-box").append(str);
}


/*나의 즐겨찾기(카테고리별리스트)*/
var fcList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{	/*courseNo: '1',
					userNo: '1',
					title: '테스트',
					id: 'joa123',
					regDate: '2022-08-08',
					openStatus: '공개'*/
				}
			];



function myfavCateRender(fcMap){
	var img = contextPath + '/assets/image/map/map-icon.jpg';
	if(fcMap.SAVENAME != undefined) {
		img = contextPath+'/upload/' + fcMap.SAVENAME;
	}
	
	var heartonoff = contextPath + '/assets/image/main/heart-off.png';
	if(fcMap.LIKED != undefined) {
		heartonoff = contextPath + '/assets/image/main/heart.png';
	}
	
	var favorite = contextPath + '/assets/image/main/star-off.png';
	if(fcMap.FAVORITE != undefined) {
		favorite = contextPath + '/assets/image/main/star.png';
	}
	
	var ocStatus = '공개'
	if(fcMap.OPENSTATUS !='open'){
		ocStatus = '비공개'
	}
	
	var newpost = '&nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png">';
	var pCount;
	if(fcMap.PCOUNT != undefined){
		pCount = fcMap.PCOUNT + newpost;
	}else{
		pCount = '0';
	}
	
	
	var str = '';
	str += '<li class="course-list-result" id="my-favorite-cate-result-list">';
	str += '	<div class="listBox" >';
	str += '	  	<a href="'+contextPath+'/course/view?courseNo='+fcMap.COURSENO+'" target="_blank"><img id="courseMapImg" class="courseImg" src="'+img+'"></a>';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">['+ocStatus+'] '+fcMap.TITLE+' </p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+heartonoff+'" data-courseno="'+fcMap.COURSENO+'">';  
	str += '					<img class="bookmark-cancel-btn" src="'+favorite+'" data-courseno="'+fcMap.COURSENO+'" data-toggle="modal" data-target=".bookmark-checkbox-list" >';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+fcMap.ID+'</p>';
	str += '			<p id="courseInfo">'+fcMap.REGDATE+'</p>';
	str += '			<a href="'+contextPath+'/board/board?boardCategory=post&courseNo=' + fcMap.COURSENO + '"><p id="courseInfo">후기글 '+pCount+' </p></a>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-fav-cate-list-title").html('<p id="listTitle" class="my-fav-cate-list-title">'+fcMap.CATENAME+'</p>');
	$(".my-fav-cate-list-box").append(str);
}











/*나의 즐겨찾기(카테고리별리스트)*/
var lcList = [	//ajax 데이터 불러올 부분(배열)///////////////////////////////
				{	/*courseNo: '1',
					userNo: '1',
					title: '테스트',
					id: 'joa123',
					regDate: '2022-08-08',
					openStatus: '공개'*/
				}
			];



function mylikedCoRender(lcMap){
	var img = contextPath + '/assets/image/map/map-icon.jpg';
	if(lcMap.SAVENAME != undefined) {
		img = contextPath+'/upload/' + lcMap.SAVENAME;
	}
	
	var heartonoff = contextPath + '/assets/image/main/heart-off.png';
	if(lcMap.LIKED != undefined) {
		heartonoff = contextPath + '/assets/image/main/heart.png';
	}
	
	var favorite = contextPath + '/assets/image/main/star-off.png';
	if(lcMap.FAVORITE != undefined) {
		favorite = contextPath + '/assets/image/main/star.png';
	}
	
	var ocStatus = '공개'
	if(lcMap.OPENSTATUS !='open'){
		ocStatus = '비공개'
	}
	
	var newpost = '&nbsp;<img class="newpost" src="'+contextPath+'/assets/image/main/new.png">';
	var pCount;
	if(lcMap.PCOUNT != undefined){
		pCount = lcMap.PCOUNT + newpost;
	}else{
		pCount = '0';
	}
	
	
	var str = '';
	str += '<li class="course-list-result" id="my-favorite-cate-result-list">';
	str += '	<div class="listBox" >';
	str += '	  	<a href="'+contextPath+'/course/view?courseNo='+lcMap.COURSENO+'" target="_blank"><img id="courseMapImg" class="courseImg" src="'+img+'"></a>';
	str += '	  	<div id="textBox">';
	str += '			<div class="courseTitle">';
	str += '				<p id="courseName">['+ocStatus+'] '+lcMap.TITLE+' </p>';
	str += '				<div class="img-icons">';
	str += '					<img class="like-cancel-btn" src="'+heartonoff+'" data-courseno="'+lcMap.COURSENO+'">';  
	str += '					<img class="bookmark-cancel-btn" src="'+favorite+'" data-courseno="'+lcMap.COURSENO+'" data-toggle="modal" data-target=".bookmark-checkbox-list" >';
	str += '				</div>';
	str += '			</div>';
	str += '			<p id="courseInfo">'+lcMap.ID+'</p>';
	str += '			<p id="courseInfo">'+lcMap.REGDATE+'</p>';
	str += '			<a href="'+contextPath+'/board/board?boardCategory=post&courseNo=' + lcMap.COURSENO + '"><p id="courseInfo">후기글 '+pCount+' </p></a>';
	str += '	  	</div>';
	str += '	</div>';
	str += '</li>';
	
	$(".my-liked-course-list").append(str);
}
















document.addEventListener('DOMContentLoaded', function() {
	var nowDate     = new Date();
	var nowDay      = ((nowDate.getDate().toString().length) == 1) ? '0'+(nowDate.getDate()) : (nowDate.getDate());
	var nowMonth    = ((nowDate.getMonth().toString().length) == 1) ? '0'+(nowDate.getMonth()+1) : (nowDate.getMonth()+1);
	var nowYear     = nowDate.getFullYear();
	var formatDate1  = nowYear + "-" + nowMonth;
	var formatDate2  = nowYear + "-" + nowMonth + "-" + nowDay;
	console.log(formatDate1, "+", formatDate2);
	
	
	/*//달력폼/////////////////////////////////////////////////////////////*/
	console.log(userNo);
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
						start: rMap.REGDATE2
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
			if(todaydate == eList[i].REGDATE2){
				calendarRender(eList[i]	, "down");	
			}
		}
		
		
	});
	
	
	
	
	/*//////달력폼 준비가 끝나면2222//////////////////////////////////////////////////*/
	$(".todayReport").click(function(){
		$(".monthReport").css('background', 'white');
		$(".monthReport").css('color', 'black');
		$(".monthReport").css('border', 'rgb(101,101,101) 1px solid');
		
		$(".todayReport").css('background', 'rgb(50, 108, 249)');
		$(".todayReport").css('color', 'white');
		$(".todayReport").css('border', 'rgb(50, 108, 249) 1px solid');
		
		$(".reportContent").remove();
		for(var i=0; i < eList.length; i++){
			if(formatDate2 == eList[i].REGDATE2){
				calendarRender(eList[i]	, "down");	
			}
		}
	});
	
	
	/*//////달력폼 준비가 끝나면2222//////////////////////////////////////////////////*/
	$(".monthReport").click(function(){
		$(".todayReport").css('background', 'white');
		$(".todayReport").css('color', 'black');
		$(".todayReport").css('border', 'rgb(101,101,101) 1px solid');
		
		$(".monthReport").css('background', 'rgb(50, 108, 249)');
		$(".monthReport").css('color', 'white');
		$(".monthReport").css('border', 'rgb(50, 108, 249) 1px solid');
		
		$(".reportContent").remove();
		for(var i=0; i < eList.length; i++){
			if(formatDate1 == eList[i].REGDATE3){
				calendarRender(eList[i]	, "down");	
			}
		}
	});
	
	
	
	
});	
	
	
	
	
	
	
	
	
	
	
$(window).ready(function(){	
	console.log("준비");
	
	var userNo = window.userNo;
	var cateNo = window.cateNo;
	console.log(userNo);
	console.log("cateNo", cateNo);
	
	$(".myrecord-del-modal").hide();
	
	
	
	/*///////즐겨찾기/좋아요 버튼들/////////////////////////////////////////////*/
	console.log('즐겨찾기');
	/*$(".course-like-cancel").hide();*/
	$(".bookmark-checkbox-list").hide();
	
	$("body").on("click", ".like-cancel-btn", function(){
		console.log("좋아요해제");
		var courseNo = $(this).data("courseno");
		console.log(courseNo);
		
		if(isNaN(userNo)) {
			userNo = 0;
		}
		
		if(userNo != 0){
			$.ajax({
				//보낼때
				url : contextPath+"/apiCo/likeBtnClick",
				type : "post",
				//contentType : "application/json",
				data : {courseNo},
				
				//받을때
				//dataType : "json",
				success : function(result){
					//성공시 처리해야될 코드 작성
					/*var src = contextPath + "/assets/image/main/heart.png";
					$(this).attr("src", src);
					*/
					location.reload();
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});

	
	$("body").on("click", ".bookmark-cancel-btn", function(){
		console.log("즐겨찾기버튼");
		var authUserNo = window.userNo;
		var courseNo = $(this).data("courseno");
		console.log("즐겨찾기버튼", authUserNo, courseNo);
		
		$("#fevList").empty();
		//즐겨찾기 목록 가져오기
		$.ajax({
			//보낼때
			url : contextPath+"/apiFav/getFavCate",
			type : "post",
			//contentType : "application/json",
			data : {authUserNo, courseNo},
			
			//받을때
			//dataType : "json",
			success : function(favList){
				//성공시 처리해야될 코드 작성
				console.log("favList", favList);
				for(var i=0; i<favList.length; i++) {
					bookmarkSelRender(favList[i]);
				}
				//모달창 띄우기
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		
		
		/*즐겨찾기 추가 버튼 클릭*/
		$("#bookmark-add").on("click", function() {
			var bmkList = [];
			var notBmkList = [];
			
			$("input[name='bookmark']:checked").each(function() {
				var bmk = parseInt($(this).val());
				bmkList.push(bmk);
			});
			
			$("input[name='bookmark']:not(:checked)").each(function() {
				var bmk = parseInt($(this).val());
				notBmkList.push(bmk);
			});
			console.log(authUserNo, courseNo, "notBmkList", notBmkList);
			
			//즐겨찾기 목록 가져오기
			$.ajax({
					//보낼때
				url : contextPath+"/apiFav/addFav",
				type : "post",
				//contentType : "application/json",
				data : {authUserNo, courseNo, bmkList, notBmkList},
				
				//받을때
				//dataType : "json",
				success : function(result){
					//성공시 처리해야될 코드 작성
					
					if(result > 0) {
						var src = contextPath + "/assets/image/main/star.png";
						$("#bookmark").attr("src", src);
					} else {
						var src = contextPath + "/assets/image/main/star-off.png";
						$("#bookmark").attr("src", src);
					}
					location.reload();
					//모달창 닫기
					$("#bookmark-checkbox-list").hide();
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	/*///////사이드메뉴/////////////////////////////////////////////*/
	$("#menuBar").hide();
	
	/*메뉴창 열기*/
	$(".menuBar-open").click(function(){
		//$(".menuBar-open").attr("src", "");
		if($("#menuBar").css("display") == "none") {
			$("#menuBar").show();
		} else {
			$("#menuBar").hide();
		}
		
	});
	
	
	/*메뉴창 닫기*/
	$(".menuBar-close-btn").click(function(){
		$("#menuBar").hide();
		//$(".menuBar-open").show();
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
		$(".bookmark-menuList").remove();
		categoryList();
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
	});
	
	
	
	
	/*--------------------------------------------------*/
	/*카테고리 이름 수정하기 */
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
	});
		
		
		
		
	//모달창의 변경버튼 클릭할때
	$("#edit-bookmark-category").click(function(){
		console.log("모달>변경버튼 클릭")
				
		//변경할 데이터 모으기
		var cateName = $("#input-cateName-edit").val();
		var cateNo = $("#input-cateName-edit").data("cateno");
        console.log(cateName, cateNo);
		
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
				
				/*$("#input-cateName-edit").val("")*/
				$(".bookmark-menuList").remove();
				categoryList();
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	
	
	/*--------------------------------------------------*/
	/*나의 기록보기,- 삭제*/
	//삭제 버튼 눌렀을때,
	$("body").on("click", "#record-del-button", function(){
		console.log("기록 삭제!");
		var $this = $(this); 
		var recordNo = $this.data("recordno");
		console.log("기록삭제", recordNo);
		//모달창 열기
		
		//기록삭제 버튼 눌렀을때, 
		$("#byebye-record").on("click", function(){
			console.log("기록삭제-모달");
			console.log(recordNo);
			//서버로 데이터 전송(ajax)
			$.ajax({
				url : contextPath + "/api/my-page/delete-record", //컨트롤러 RequestMapping url 작성하기
				type : "post",
				contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
				data : JSON.stringify(recordNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
					//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
				dataType : "json",
				success : function(result){
					/*성공시 처리해야될 코드 작성*/
					console.log(result);
					
					/*$(".reportContent").remove();
					calendarRender(rMap, "down");*/
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			location.reload();
			$(".myrecord-del-modal").hide('modal');
		});
		
		//나의 기록 삭제 모달창의 닫기버튼 클릭할때
		$("#byebye-record-cancel").on("click", function(){
			$(".myrecord-del-modal").hide('modal');
		});
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
						liked: cMap.LIKED,
						favorite: cMap.FAVORITE,
						pCount: cMap.PCOUNT,
						saveName: cMap.SAVENAME
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
	
	
	
	
	/*--------------------------------------------------*/
	/*즐겨찾기 메인 리스트 가져오기*/
	$.ajax({
		url : contextPath + "/api/my-page/get-fav-all-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			console.log(result);
			$(".my-fav-all-list-box").empty();
			
			//리스트니까 for문으로 그리기!
			for (var i = 0; i < result.length; i++) {
				var fMap = result[i];
				fList.push(
					{	courseNo: fMap.COURSENO,
						userNo: fMap.USERNO,
						title: fMap.TITLE,
						id: fMap.ID,
						regDate: fMap.REGDATE,
						openStatus: fMap.OPENSTATUS,
						liked: fMap.LIKED,
						favorite: fMap.FAVORITE,
						pCount: fMap.PCOUNT,
						saveName: fMap.SAVENAME
					}
				);
				myfavRender(fMap, "down");
				
			}
			console.log(fList);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	console.log(fList);
	
	
	
	
	/*--------------------------------------------------*/
	/*즐겨찾기 메인 리스트 가져오기*/
	var fcVo = {
		userNo: window.userNo,
		cateNo: window.cateNo
	};
	$.ajax({
		url : contextPath + "/api/my-page/get-Fav-Course-List", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(fcVo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			console.log(result);
			$(".my-fav-cate-list-box").empty();
			
			//리스트니까 for문으로 그리기!
			for (var i = 0; i < result.length; i++) {
				var fcMap = result[i];
				fcList.push(
					{	cateName: fcMap.CATENAME,
						courseNo: fcMap.COURSENO,
						userNo: fcMap.USERNO,
						title: fcMap.TITLE,
						id: fcMap.ID,
						regDate: fcMap.REGDATE,
						openStatus: fcMap.OPENSTATUS,
						liked: fcMap.LIKED,
						favorite: fcMap.FAVORITE,
						pCount: fcMap.PCOUNT,
						saveName: fcMap.SAVENAME
					}
				);
				myfavCateRender(fcMap, "down");
				
			}
			console.log(fcList);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	console.log(fcList);
	
	  
	
	
	
	/*--------------------------------------------------*/
	/*좋아요한 코스들 리스트 가져오기*/
	$.ajax({
		url : contextPath + "/api/my-page/get-liked-list", //컨트롤러 RequestMapping url 작성하기
		type : "post",
		contentType : "application/json", //@RequestBody로 파라미터 가져오기 위해 필수 (정보 보낼거 없으면 필요없음)
		data : JSON.stringify(userNo), //@RequestBody로 데이터 보낼때 필수 (정보 보낼거 없으면 필요없음)
			//data: Vo //@ModelAttribute나 @RequestParam으로 데이터 보낼때 이용 (정보 보낼거 없으면 필요없음)
		dataType : "json",
		success : function(result){
			//컨트롤러 함수 실행 후 코드
			console.log(result);
			$(".my-liked-course-list").empty();
			
			//리스트니까 for문으로 그리기!
			for (var i = 0; i < result.length; i++) {
				var lcMap = result[i];
				lcList.push(
					{	cateName: lcMap.CATENAME,
						courseNo: lcMap.COURSENO,
						userNo: lcMap.USERNO,
						title: lcMap.TITLE,
						id: lcMap.ID,
						regDate: lcMap.REGDATE,
						openStatus: lcMap.OPENSTATUS,
						liked: lcMap.LIKED,
						favorite: lcMap.FAVORITE,
						pCount: lcMap.PCOUNT,
						saveName: lcMap.SAVENAME
					}
				);
				mylikedCoRender(lcMap, "down");
				
			}
			console.log(lcList);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	console.log(lcList);
});




