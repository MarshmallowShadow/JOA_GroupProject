package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.BestService;

@RequestMapping(value="/best")
@Controller
public class BestController {
	
	//필드
	@Autowired
	BestService bestService;
	
	//생성자
	
	//메소드 g/s
	
	//메소드 일반
		
	//게시글 불러오기
	@RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
	public String best() {
		System.out.println("BestController");
		
		return "best/best";
	}
}
