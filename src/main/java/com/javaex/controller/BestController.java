package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BestController {
	
	//게시물 불러오기
	
	//화면 띄우기
	@RequestMapping(value="/best", method = {RequestMethod.GET, RequestMethod.POST})
	public String best() {
		System.out.println("BestController");
		return "best/best";
		
	}

}
