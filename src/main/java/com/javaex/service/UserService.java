package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao uDao;
	
	//회원가입
	public int join(UserVo uVo) {
		System.out.println("UserService>join");
		
		int count = uDao.join(uVo);
		return count;
	}
	
	//로그인
	public UserVo login(UserVo uVo) {
		System.out.println("UserService>login");
		
		UserVo authUser = uDao.login(uVo);
		return authUser;
	}

}
