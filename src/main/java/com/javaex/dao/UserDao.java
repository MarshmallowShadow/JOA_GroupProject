package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int join(UserVo uVo) {
		System.out.println("UserDao>join");
		
		int count = sqlSession.insert("users.join", uVo);
		return count;
	}
	
	//로그인
	public UserVo login(UserVo uVo) {
		System.out.println("UserDao>login");
		
		UserVo authUser = sqlSession.selectOne("users.login", uVo);
		return authUser;
	}
	
	//사용자 이름 가져오기
	public UserVo getUserName(int userNo) {
		//System.out.println("UserDao->getUserName");
		return sqlSession.selectOne("users.getName", userNo);
	}
	
	public Integer getUserNo(String id) {
		//System.out.println("UserDao->getUserNo");
		return sqlSession.selectOne("users.getUserNo", id);
	}

	//회원 번호 전체 가져오기
	public List<UserVo> getAllUserNo() {
		return sqlSession.selectList("users.getAllUserNo");
	}

}
