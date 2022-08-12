/*코스 기록 상세보기 js*/


$(document).ready(function() {
	
	console.log(authUserNo);
	
	//코스번호
	var courseNo = $("#courseNo").val();
	//코스작성자번호 가져오기
	var coUserNo = function (courseNo) {
		
		console.log("getuserNo");
		
		$.ajax({
			//보낼때
			url : contextPath+"/getCoUserNo",
			type : "post",
			//contentType : "application/json",
			data : {courseNo},
			
			//받을때
			//dataType : "json",
			success : function(coUserNo){
				//성공시 처리해야될 코드 작성
				console.log(coUserNo);
				
				return coUserNo;
	
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	};
	
	/*디폴트-전체 기록 리스트 가져오기*/
	getAllRecord(courseNo, coUserNo);
	
	/*전체-내가쓴기록 선택*/
	$('input:radio[name="record-filter"]').change(function() {
		if($(this).val() === 'all') {
			$('.record-list').empty();
			getAllRecord(courseNo, coUserNo);
		} else if($(this).val() === 'myrecord') {
			$('.record-list').empty();
			
			if(isNaN(authUserNo)) {
				var str = '';
				str += '<li>';
				str += '	<div class="message">';
				str += '		로그인 후에 이용해 주세요.';
				str += '	</div>';
				str += '</li>';
				
				$(".record-list").append(str);
			} else {
				getMyRecord(courseNo, coUserNo, authUserNo);
			}
		}
	});
	
	
	/*------------지도-------------------------------------------------------------------*/
	//지도 정보
	var mapContainer = document.getElementById('map-info');
	var mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심좌표
		level: 3, //지도의 레벨(확대, 축소 정도)
	};
	
	// 이미지 지도 생성
	//var staticMap = new kakao.maps.StaticMap(mapContainer, mapOption),
	var staticMap = new kakao.maps.Map(mapContainer, mapOption),
		overlays = []; //지도에 그릴 선 담을 배열
	
	
	/*------------사진모달-------------------------------------------------------------------*/
	lightbox.option({
		/*https://lokeshdhakar.com/projects/lightbox2/*/
		'alwaysShowNavOnTouchDevices': true, /*이미지 세트 일때 화면 양쪽 누르면 사진 변경*/
		'disableScrolling': true, /*화면 스크롤링 막기*/
		'fadeDuration': 300, /*페이드인아웃*/
		'imageFadeDuration': 300, /*페이드인*/
		'fitImagesInViewport': true, /*이미지 크기 자동조절*/
		'wrapAround': true, /*이미지 끝나도 다시 첫이미지로*/
		'albumLabel': "총 %2개 중 %1번째 이미지"
	});
});

/*------------기록리스트-------------------------------------------------------------------*/
/*전체 기록 리스트 가져오기*/
function getAllRecord(courseNo, coUserNo) {
	
	console.log("getAllRecord");
	
	$.ajax({
		//보낼때
		url : contextPath+"/getRecord",
		type : "post",
		//contentType : "application/json",
		data : {courseNo},
		
		//받을때
		//dataType : "json",
		success : function(recList){
			//성공시 처리해야될 코드 작성
			console.log(recList);
			
			for(var i=0; i<recList.length; i++) {
				render(recList[i], coUserNo);
			}

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};


/*전체 기록 리스트 가져오기*/
function getMyRecord(courseNo, coUserNo, authUserNo) {
	
	console.log("getMyRecord");
	
	$.ajax({
		//보낼때
		url : contextPath+"/getRecord",
		type : "post",
		//contentType : "application/json",
		data : {courseNo, authUserNo},
		
		//받을때
		//dataType : "json",
		success : function(recList){
			//성공시 처리해야될 코드 작성
			console.log(recList);
			
			if(recList.length > 0) {
				
				for(var i=0; i<recList.length; i++) {
					render(recList[i], coUserNo);
				}
				
			} else {
				var str = '';
				str += '<li>';
				str += '	<div class="noRec">';
				str += '		작성된 기록이 없습니다.';
				str += '	</div>';
				str += '</li>';
				
				$(".record-list").append(str);
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
};


/*리스트 추가하기*/
function render(recVo, coUserNo) {
	//console.log("render");
	
	var name = getUserName(recVo.userNo);
	
	var str="";	
	str = '	<li>';
	str +=	'<div class="record-full-content">';
	str +=	'	<div class="record-txt">';
	str +=	'		<div class="record-content">';
	str +=	'			<span class="record">';
	str +=	'				<span class="bold">';
	if(coUserNo == recVo.userNo) {
		str += '<img src="'+contextPath+'/assets/image/course/footprint.png" width="12px">';
	};
	
	str += name;

	str +=	'</span>';
	str +=	'							<span>'+recVo.review+'</span>';
	str +=	'			</span>';
	str +=	'		</div>';
	str +=	'		<div class="record-info">';
	str +=	'			<span>'+recVo.regDate+'</span>';
	str +=	'			<span><img src="'+contextPath+'/assets/image/course/'+recVo.weather+'.png"></span>';
	str +=	'			<span style="width:24px;">'+recVo.temperature+'℃</span>';
	str +=	'			<span class="box blue">';
	
	if(recVo.courseCate === 'walk') {
		str += '산책';
	} else if(recVo.courseCate === 'jogging') {
		str += '조깅';
	} else if(recVo.courseCate === 'running') {
		str += '러닝';
	} else if(recVo.courseCate === 'marathon') {
		str += '마라톤';
	} else if(recVo.courseCate === 'bicycle') {
		str += '자전거';
	} else if(recVo.courseCate === 'draw') {
		str += '그림';
	}
	
	str +=	'			</span>';
	str +=	'			<span class="box pink">';
	
	if(recVo.difficulty === 'easy') {
		str += '쉬움'
	} else if(recVo.difficulty === 'normal') {
		str += '보통'
	} else if(recVo.difficulty === 'hard') {
		str += '어려움'
	}
	
	str +=	'			</span>';
	str +=	'		</div>';
	str +=	'	</div>';
				
	str +=	'	<div class="record-img">';
	str +=	'		<a href="'+contextPath+'/upload/166002522633658dffb58-0e13-4493-81ba-be98d29a5c34.jpg" data-lightbox="image-1">';
	str +=	'			<img class="recordImg" src="'+contextPath+'/assets/image/course/img2.jpg" width="24px">';
	str +=	'		</a>';
	str +=	'		<a href="'+contextPath+'/assets/image/course/img1.jpg" data-lightbox="image-1">';
	str +=	'		</a>';
	str +=	'	</div>';
	str +=	'</div>';
	str +=	'</li>';
		
	$(".record-list").append(str);
	
}

/*기록 작성자 이름 가져오기*/
function getUserName(userNo) {
	
	var name = "";
	
	$.ajax({
		//보낼때
		url : contextPath+"/getUserName",
		type : "post",
		//contentType : "application/json",
		async: false,
		data : {userNo},
		
		//받을때
		//dataType : "json",
		success : function(userName){
			//성공시 처리해야될 코드 작성
			//console.log(userName);
			name = userName;
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	return name;
}

