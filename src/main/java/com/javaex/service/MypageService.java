package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MyReportDao;

@Service
public class MypageService {
	
	@Autowired private MyReportDao myReportDao;
	
	//나의기록 list 가져오기
	public List <Map<String,Object>> getRecordList(int userNo){
		System.out.println("MyReportService>calendarList"); 
		return myReportDao.getRecordList(userNo); 
	}
	
	
}
