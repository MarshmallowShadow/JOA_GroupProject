import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class WeatherTest {
	public static void main(String[] args) throws Exception {
		
		String weatherUrl = "http://api.openweathermap.org/data/2.5/weather?id=1835848&appid=ddeb92652c34f9e77a6961c434afa555";
		
		URL url = new URL(weatherUrl);
		URLConnection conn = url.openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String info = null;
		while(true){
            info = br.readLine(); //날씨 정보 가져오기
            
            if(info == null) {
            	break;
            }
            
            System.out.println(info); //API 추력 정보 전부 출력
            
            int wStart = info.indexOf("main");
            int wEnd = info.indexOf(",\"description");
            String weather = info.substring(wStart + 7, wEnd-1);
            System.out.println("서울 날씨: " + weather);
            
            int a2 = info.indexOf("temp");
            int temp=(int)(Double.parseDouble(info.substring(a2+6, a2+12))-273.15);
            System.out.println("서울의 현재 온도(섭씨): " + temp + " C");
        }
		
	}
}
