package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	
/* @Autowired 잊지 말자... */
	
	//메인화면
	@RequestMapping(value="/", method = {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		
	return "";
		
	}
}
