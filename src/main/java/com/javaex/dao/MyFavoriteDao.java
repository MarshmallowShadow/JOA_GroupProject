package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyFavoriteDao {
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//즐겨찾기 메인(전체) list 가져오기
	public List<Map<String, Object>> getFavAllList(int userNo){
		System.out.println("MyFavoriteDao>getFavAllList"); 
		return sqlSession.selectList("mypage.getFavAllList", userNo); 
	}
	
	
	//즐겨찾기 카테고리별 list 가져오기
	public List<Map<String, Object>> getFavCourseList(Map<String, Object> fcMap){
		System.out.println("MyFavoriteDao>getFavCourseList"); 
		return sqlSession.selectList("mypage.getFavCourseList", fcMap); 
	}
	
}
