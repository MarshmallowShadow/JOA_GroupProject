/*
 * 날씨 api 
 */
function goSearch () 	//현재 위치로 검색
{
	var SERCH_CITY = $("city").val();
	if(!SERCH_CITY){
		alert("먼저 도시를 입력하세요");		//SERCH_CITY값 입력하지 않을 경우 경고장
		return false;					//그럴 경우 더이상 진행 불가
	}
	else {								//API 엔진과 소통
		$ajax({
			type: "POST",
			dataType: "JSON",
			url: "lib.js",
			data: {"search_ciy" : SERCH_CITY},	//검색하고자 하는 도시 정보
			cache: false,
			async: false
		})
		.done(function(result) {
			//ajax 통신이 성공한 경우
			console.log(result);
			alert("현재온도" + result.main.temp);
		});
	}
}
