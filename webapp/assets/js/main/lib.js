 /**
 * API 연결
 */
 
 $api_key = "ddeb92652c34f9e77a6961c434afa555";
 $search_city = urlencode($_POST["search_city"]);	//사용자가 요청한 도시 정보, urlencode UTF-8언어를 변경
 /*$lat = $_POST["let"];
 $lon = $_POST["lng"];*/
 
 /*api 접속하는 주소*/
 $url = "api.openweathermap.org/data/2.5/weather?q=" + $search_city + "&appid=" + $api_key + "&units=metric";
 
 $is_post = false;
 $ch = url_init();
 curl_setopt($ch,CURLOPT_URL, $url);
 curl_setopt($ch,CURLOPT_POST, $is_post);
 curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
 curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, 0);  
 $response =  curl_exec($ch);
 $state_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
 curl_close($ch);
 if($state_code == 200)
 {
	document.write ($response);
 }