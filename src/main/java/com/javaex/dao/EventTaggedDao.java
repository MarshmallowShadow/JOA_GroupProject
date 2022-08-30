package com.javaex.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventTaggedDao {
	
	//필드
	@Autowired
	private SqlSession sqlSession;
		
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//태그 저장
	public int bookmark(Map<String, Object> map) {
		
		System.out.println("EventTaggedDao > bookmark");
		
		return sqlSession.insert("eventTagged.tagged", map);
		
	}
	
	//태그 삭제
	public int bookmarkDelete(Map<String, Object> map) {
		
		System.out.println("EventTaggedDao > bookmarkDelete");
		
		return sqlSession.delete("eventTagged.taggedDelete", map);
		
	}

}
