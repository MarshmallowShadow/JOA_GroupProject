package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.BoardService;

@Controller
public class BestController {
	
	//필드
	@Autowired
	BoardService boardService;
	
	//생성자
	//메소드 g/s
	//메소드 일반
	
	//게시물 불러오기
	
	//화면 띄우기
	@RequestMapping(value="/best", method = {RequestMethod.GET, RequestMethod.POST})
	public String best() {
		System.out.println("BestController");
		return "best/best";
		
	}

}
