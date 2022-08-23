package com.javaex.dao;

import java.util.HashMap;
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
	
	//북마크한 코스들 list 가져오기
	public List<Map<String, Object>> getFavCourseList(int userNo, int cateNo){
		System.out.println("MyCourseDao>getFavCourse"); 
		Map<String, Object> myFavMap = new HashMap<String, Object>();
		myFavMap.put("userNo", userNo);
		myFavMap.put("cateNo", cateNo);
		return sqlSession.selectList("mypage.getFavCourseList", myFavMap); 
	}

}
