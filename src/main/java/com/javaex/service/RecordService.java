package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.PointDao;
import com.javaex.dao.RecordDao;
import com.javaex.vo.CourseVo;
import com.javaex.vo.PointVo;
import com.javaex.vo.RecordVo;

@Service
public class RecordService {
	
	@Autowired
	private RecordDao recDao;
	@Autowired
	private CourseDao coDao;
	@Autowired
	private PointDao pointDao;

	
	//코스 등록하기
	public void recordWrite(RecordVo recVo, int hour, int minute) {
		System.out.println("RecordService->recordWrite");
		
		recVo.setCourseTime((hour*60)+minute);
		System.out.println(recVo);
		recDao.insertRecord(recVo);
		System.out.println(recVo.getRecordNo());
		
	}

	
	
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
