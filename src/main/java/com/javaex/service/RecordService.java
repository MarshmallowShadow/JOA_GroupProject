package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.PointDao;
import com.javaex.vo.CourseVo;
import com.javaex.vo.PointVo;

@Service
public class RecordService {
	
	@Autowired
	private CourseDao coDao;
	@Autowired
	private PointDao pointDao;

	
	//(기록등록) 코스 정보 가져오기
	public Map<String, Object> getCourseInfo(int courseNo) {
		System.out.println("RecordService->getCourseInfo");
		
		//코스 정보
		CourseVo coVo = coDao.selectCourse(courseNo);
		System.out.println(coVo);
		//코스 좌표
		List<PointVo> pointVo = pointDao.selectPoint(courseNo);
		System.out.println(pointVo);
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("coVo", coVo);
		coMap.put("pointVo", pointVo);
		
		return coMap;
		
	}

}
