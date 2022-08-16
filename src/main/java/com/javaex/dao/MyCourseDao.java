package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCourseDao {
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//나의코스 list 가져오기
	public List<Map<String, Object>> getCourseList(int userNo){
		System.out.println("MyCourseDao>MyCourseList"); 
		return sqlSession.selectList("mypage.getCourseList", userNo); 
	}

}
