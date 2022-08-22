package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyReportDao {
		
	@Autowired 
	private SqlSession sqlSession;
	
	
	
	//나의기록 list 가져오기
	public List <Map<String,Object>> getRecordList(int userNo){
		System.out.println("MyReportDao>calendarList"); 
		return sqlSession.selectList("mypage.getRecordList", userNo); 
	}
	
	//나의기록 삭제 delete
	public int deleteRecord(int recordNo) {
		System.out.println("MyReportDao>deleteRecord()");
		return sqlSession.delete("mypage.deleteRecord", recordNo);
	}
	
	
	
}
