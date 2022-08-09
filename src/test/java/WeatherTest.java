import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class WeatherTest {
	public static void main(String[] args) throws IOException, ParseException {
		
		double lat = 37.5684;
		double lon = 126.9778;
		String apiKey = "";
		String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lon=" + lon + "&lat=" + lat + "&appid=" + apiKey;
		
		//API 가져오기
		URL url = new URL(weatherUrl);
		URLConnection conn = url.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		//리더로 JSON파일을 Map 형식으로 저장
		JSONParser parser = new JSONParser();
		JSONObject weatherJson = (JSONObject)parser.parse(br);
		
		//test
		String base = (String) weatherJson.get("name");
		System.out.println(base);
		
		//날씨 가져오기
		List<Object> weather = ((List<Object>)weatherJson.get("weather"));
		Map<String, Object> wInfo = (Map<String,Object>)weather.get(0);
		System.out.println(wInfo.get("main"));
	}
	
	//날씨 weather > main
	//기온 main > temp
	//풍속 wind > speed
	//습도 main > humidity
	//강수량 
}
