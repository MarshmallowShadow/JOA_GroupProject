package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	
	
	//글쓰기
	
	//글쓰기폼
	@RequestMapping(value="/listWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String listWrite () {
		System.out.println("ListController>listWirte");
		
		return "list/listWrite";
	}
	
	//메인
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list () {
		System.out.println("ListController");
		
		return "list/list";
	}

	
	

}
