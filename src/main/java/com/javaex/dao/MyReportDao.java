package com.javaex.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyReportDao {
		
	@Autowired 
	private SqlSession sqlSession;
	
	public Map<String,Object> getRecordList(int userNo) {
		
		return null;
	}
	
	//나의기록 list 가져오기
	/*
	 * public List<MyReportVo> calendarList(){
	 * System.out.println("MyReportDao>calendarList"); return
	 * sqlSession.selectList("mypage.calendarList"); }
	 */
	
	
}
