package com.javaex.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

@Repository
public class LocalApiDao {
	private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/geo/coord2address.json?input_coord=WGS84";
    private static String GEOCODE_USER_INFO="KakaoAK 8bbcad9e632e2bc7dd8eec481e015cfe"; 
    
    public String getLocation(double x, double y) {
		
        URL obj;
	
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            
            obj = new URL(GEOCODE_URL + "&x=" + x + "&y=" + y);
			
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
            
            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);
			
            Charset charset = Charset.forName("UTF-8");
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
            
        	JSONParser parser = new JSONParser();
    		JSONObject localJson = (JSONObject)parser.parse(br);
			
            List<Object> documents = (List<Object>)localJson.get("documents");
            Map<String, Object> roadAddress = (Map<String, Object>)documents.get(0);
            
            String street = (String)roadAddress.get("region_3depth_name");
            
            if(street == null || street.equals("")) {
            	street = (String)roadAddress.get("road_name");
            }
            
			return street;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        return null;
	}
}
