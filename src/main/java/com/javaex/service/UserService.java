package com.javaex.service;

import org.springframework.stereotype.Service;

import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	//회원가입
	public int join(UserVo userVo) {
		
		System.out.println("UserService>join");
		
		return 0;
	}

}
