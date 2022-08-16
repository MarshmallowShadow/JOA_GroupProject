package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/mobile")
public class MobileController {
	
	@RequestMapping(value="/timer", method= {RequestMethod.GET, RequestMethod.POST})
	public String timer(HttpSession session) {
		/*
		//System.out.println("MobileController>timer");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) {
			return "mobile/timer";
		} else {
			return "redirect:/user/loginForm";
		}
		*/
		
		return "mobile/timer";
	}
}
