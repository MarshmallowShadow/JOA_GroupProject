package com.javaex.service;

import java.math.BigDecimal;
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
		
		Map<String, String> map = new HashMap<>();
		map.put("count_cate", count_cate);
		
		if(course_cate == null) {
			map.put("course_cate", "%%");
		} else {
			map.put("course_cate", "%" + course_cate + "%");
		}
		
		//System.out.println(count_cate);
		
		
		List<Map<String, Object>> courseList = courseDao.getBest(map);
		
		//3개씩 15개 기록 반복문 사용 
		for(int i=0; i<courseList.size(); i++) {
			//recordList.add(/*레코드다오 부르기*/);
			//기록 리스트 가져오기
			courseList.get(i).put("recordList", (recordDao.getBestRecord(((BigDecimal)(courseList.get(i).get("COURSE_NO"))).intValue())));
		}
		return courseList;
	}

}
