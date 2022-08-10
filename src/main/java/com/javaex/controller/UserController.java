package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	//회원가입 폼
	@RequestMapping(value="/joinForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm(){
		System.out.println("UserController>joinForm");
		return "user/joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo uVo){
		System.out.println("UserController>join");
		
		int count = uService.join(uVo);
		
		return "redirect:/user/login";
	}
	
	//로그인 폼
	@RequestMapping(value="/loginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(){
		System.out.println("UserController>loginForm");
		return "user/loginForm";
	}
	
	//로그인
	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute UserVo uVo, HttpSession session){
		System.out.println("UserController>login");
		
		UserVo authUser = uService.login(uVo);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			return "redirect:/main";
		} else {
			return "redirect:/loginForm?login=fail";
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session){
		System.out.println("UserController>logout");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
	}
}
