import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class WeatherTest2 {
	public static void main(String[] args) throws Exception {
		
		double lat = 37.5684;
		double lon = 126.9778;
		String weatherUrl = "http://api.openweathermap.org/data/2.5/weather?lon=" + lon + "&lat=" + lat + "&appid=ddeb92652c34f9e77a6961c434afa555";
		
		URL url = new URL(weatherUrl);
		URLConnection conn = url.openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String info = null;
		while(true){
            info = br.readLine(); //날씨 정보 가져오기
            
            if(info == null) {
            	break;
            }
            
            info = info.replace("\"", "");
            System.out.println(info); //API 추력 정보 전부 출력
            
            int wIndex = info.indexOf("main");
            String weather = info.substring(wIndex);
            weather = weather.substring(0, weather.indexOf(","));
            System.out.println(weather);
            
            int a2 = info.indexOf("temp");
            int temp=(int)(Double.parseDouble(info.substring(a2+5, a2+11))-273.15);
            System.out.println("서울의 현재 온도(섭씨): " + temp + " C");
        }
		
	}
	
	//날씨 weather > main
	//기온 main > temp
	//풍속 wind > speed
	//습도 main > humidity
	//강수량 
}
