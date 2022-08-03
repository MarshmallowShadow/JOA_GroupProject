package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	//게시판 리스트
	@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
	public String board() {
		
		 System.out.println("BoardController > board");
		
		return "board/board";
	}
	
	//게시판 글쓰기폼
	@RequestMapping(value="/writeform", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeform() {
		
		 System.out.println("BoardController > writeform");
		
		return "board/writeform";
	}
	
	//게시판 상세페이지
	@RequestMapping(value="/read", method = {RequestMethod.GET, RequestMethod.POST})
	public String read() {
		
		 System.out.println("BoardController > read");
		
		return "board/read";
	}
	
	//게시판 수정폼
	@RequestMapping(value="/modifyform", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyform() {
		
		 System.out.println("BoardController > modifyform");
		
		return "board/modifyform";
	}

}
