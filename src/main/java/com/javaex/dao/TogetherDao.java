package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class TogetherDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
		
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	public int together() {
		
		System.out.println("TogetherDao > together");
		
		return 1;
		
	}

}
