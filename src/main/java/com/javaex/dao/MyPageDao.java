package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao {
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//즐겨찾기 메인(전체) list 가져오기
	public List<Map<String, Object>> likedCoList(int userNo){
		System.out.println("MyPageDao>likedCoList"); 
		return sqlSession.selectList("mypage.likedCoList", userNo); 
	}
}
