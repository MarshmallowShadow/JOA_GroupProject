package com.javaex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.RecordDao;

@Service
public class BestService {
	
	//필드
	@Autowired
	CourseDao courseDao;
	
	@Autowired
	RecordDao recordDao;
	
	//생성자
	
	//메소드 g/s
	
	//메소드 일반
	public List<Map<String, Object>> getBest(String course_cate, String count_cate) {
		System.out.println("BestService>getBest");
		
		if(course_cate == null) {
			course_cate="";
		}
		course_cate = "%" + course_cate + "%";
		
		//System.out.println(count_cate);
		
		//빈통 생성
		Map<String, Object> bestMap = new HashMap<>();
		
		//빈통에 넣기
		bestMap.put("course_cate", course_cate);
		bestMap.put("count_cate", count_cate);
		
		List<Map<String, Object>> courseList = courseDao.getBest(bestMap);
		
		//3개씩 15개 기록 반복문 사용 
		for(int i=0; i<courseList.size(); i++) {
			//recordList.add(/*레코드다오 부르기*/);
			//기록 리스트 가져오기
			courseList.get(i).put("recordList", (recordDao.getBestRecord((int)(courseList.get(i).get("COURSE_NO")))));
		}
		return courseList;
	}

}
