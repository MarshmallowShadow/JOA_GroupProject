package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.EventVo;

@Repository
public class EventJoinedDao {
	
	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//내용 읽기
	public int join(EventVo eventVo) {
		
		System.out.println("EventJoinedDao > join");
		
		return sqlSession.insert("event_joined.join", eventVo);
		
	}
	
	public int unjoin(EventVo eventVo) {
		System.out.println("EventJoinedDao > delete");
		
		return sqlSession.delete("event_joined.delete", eventVo);
	}

}
