package com.javaex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;

@Service
public class BestService {
	
	//필드
	@Autowired
	CourseDao courseDao;
	
	//생성자
	
	//메소드 g/s
	
	//메소드 일반
	public Map<String, Object> getBest(String course_cate, String count_cate) {
		System.out.println("BestService>getBest");
		
		//빈통 생성
		Map<String, Object> bestMap = new HashMap<>();
		
		List<Map<String, Object>> courseList = courseDao.getBest(bestMap); //---------------수정하세요 제발!!!!---------------//
		List<List<String>> recordList = new ArrayList<>();
		
		for(int i=0; i<courseList.size(); i++) {
			//recordList.add(/*레코드다오 부르기*/);
		}
		
		return null; //---------------수정하세요 제발!!!!---------------//
	}

}
