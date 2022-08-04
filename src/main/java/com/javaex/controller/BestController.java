package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BestController {
	
	//화면 test
	@RequestMapping(value="/best", method = {RequestMethod.GET, RequestMethod.POST})
	public String best() {
		
		System.out.println("BestController");
		
	return "best/best";
		
	}

}
