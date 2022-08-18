package com.javaex.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.TogetherService;

@Controller
@RequestMapping(value="/together")
public class TogetherController {
	
	//필드
	@Autowired
	TogetherService togetherService;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	
	//함께하기 리스트
	@RequestMapping(value="/together", method = {RequestMethod.GET, RequestMethod.POST})
	public String together(Model model, @RequestParam(value="crtPage", required = false, defaultValue = "1")int crtPage) {
		
		 System.out.println("TogetherController > together");			
		
		return "together/together";
		
	}
	
	//함께하기 글쓰기폼
	@RequestMapping(value="/writeform", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeform() {
		
		 System.out.println("TogetherController > writeform");
		
		return "together/writeform";
		
	}
	
	//함께하기 상세페이지
	@RequestMapping(value="/read", method = {RequestMethod.GET, RequestMethod.POST})
	public String read() {
		
		 System.out.println("TogetherController > read");
		
		return "together/read";
		
	}
	
}
