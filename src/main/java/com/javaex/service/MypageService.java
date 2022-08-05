package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MyReportDao;
import com.javaex.vo.MyReportVo;

@Service
public class MypageService {
	
	@Autowired private MyReportDao myReportDao;
	
	
	//나의기록 list 가져오기
	public List<MyReportVo> calendarList(){
		System.out.println("MyReportService>calendarList");
		return myReportDao.calendarList();
	}
	
}
