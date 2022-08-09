package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//사용자 이름 가져오기
	public String getUserName(int userNo) {
		System.out.println("UserDao->getUserName");
		return sqlSession.selectOne("users.getName", userNo);
	}

}
