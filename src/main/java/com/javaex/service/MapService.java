package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;

@Service
public class MapService {
	@Autowired
	private CourseDao cDao;
	
	public List<Map<String, Object>> getList(Map<String, Object> kMap){
		System.out.println("MapService>getList");
		
		List<Map<String, Object>> cList = null;
		
		if(((String)kMap.get("searchCate")).equals("location")) {
			System.out.println("locationSearch");
			cList = cDao.locationList(kMap);
		} else {
			cList = cDao.titleList(kMap);
		}
		
		System.out.println(cList);
		
		if(cList != null) {
			for(int i=0; i < cList.size(); i++) {
				switch((String)cList.get(i).get("COURSE_CATEGORY")){
					case("walk"):
						cList.get(i).put("COURSE_CATEGORY", "산책");
						break;
					case("jogging"):
						cList.get(i).put("COURSE_CATEGORY", "조깅");
						break;
					case("running"):
						cList.get(i).put("COURSE_CATEGORY", "러닝");
						break;
					case("marathon"):
						cList.get(i).put("COURSE_CATEGORY", "마라톤");
						break;
					case("bike"):
						cList.get(i).put("COURSE_CATEGORY", "자전거");
						break;
					case("draw"):
						cList.get(i).put("COURSE_CATEGORY", "그림그리기");
						break;
					default:
						cList.get(i).put("COURSE_CATEGORY", "기타");
						break;
				}
				
				switch((String)cList.get(i).get("DIFFICULTY")){
					case("easy"):
						cList.get(i).put("DIFFICULTY", "쉬움");
						break;
					case("medium"):
						cList.get(i).put("DIFFICULTY", "보통");
						break;
					case("hard"):
						cList.get(i).put("DIFFICULTY", "어려움");
						break;
					default:
						cList.get(i).put("DIFFICULTY", "기타");
						break;
				}
			}
		}
		
		
		
		return cList;
	}
}
