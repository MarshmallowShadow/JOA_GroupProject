package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
public class joinForm {
	
	// 필드
	@Autowired
	UserService userService;
	
//--------------------------------------------------회원가입(폼)--------------------------------------------------//
	
	//회원가입폼
	@RequestMapping(value="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinform() {
		System.out.println("userController>joinForm");
		
		return "user/joinForm";
	}
	
	//회원가입 => jsp에서 ModelAttribute를 통해 받은 정보를 컨트롤러에서 다시 db에 정보 저장
	@RequestMapping(value="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("userController>join");
		
		// int count 유무 : 서비스에서 컨트롤러로 올 때 정보 저장 할 것인가 말 것 인가?
		// userVo에 저장하여 jsp 정보를 보냄
		int count = userService.join(userVo);
		
		return "main/index";					//회원가입 후 메인화면 or 로그인 화면?
	}
	
	// 아이디 중복찾기 => ajax

}
