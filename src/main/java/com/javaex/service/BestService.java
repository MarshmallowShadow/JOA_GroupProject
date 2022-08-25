package com.javaex.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.RecordDao;
import com.javaex.utl.LocalApiController;

@Service
public class BestService {
	
	//필드
	@Autowired
	CourseDao courseDao;
	
	@Autowired
	RecordDao recordDao;
	
	@Autowired
	private LocalApiController localApiController;
	
	//생성자
	
	//메소드 g/s
	
	//메소드 일반
	//지역 불러오기
	
	//기록 불러오기
	public List<Map<String, Object>> getBest(String course_cate, String count_cate) {
		System.out.println("BestService>getBest");
		
		Map<String, String> map = new HashMap<>();
		map.put("count_cate", count_cate);
		
		if(course_cate == null || course_cate.equals("")) {
			map.put("course_cate", "%%");
		} else {
			map.put("course_cate", "%" + course_cate + "%");
		}
		
		
		//System.out.println(map);
		
		
		List<Map<String, Object>> courseList = courseDao.getBest(map);
		
		System.out.println(courseList);
		
		
		//3개씩 15개 기록 반복문 사용 
		for(int i=0; i<courseList.size(); i++) {
			//recordList.add(/*레코드다오 부르기*/);
			//좌표 가져오기 (x, y 선언)
			
			double x =  ((BigDecimal)courseList.get(i).get("X")).doubleValue();
			double y =  ((BigDecimal)courseList.get(i).get("Y")).doubleValue();
			
			//좌표로 위치 변환
			String LOCATION = localApiController.getLocation(x, y);
			
			//위치 저장
			courseList.get(i).put("LOCATION", LOCATION);
			
			//기록 리스트 가져오기
			courseList.get(i).put("RECORDLIST", (recordDao.getBestRecord(((BigDecimal)(courseList.get(i).get("COURSE_NO"))).intValue())));
		}
		return courseList;
	}

}
