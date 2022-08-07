package com.javaex.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;

@Controller
public class BoardController {
	
	//필드
	@Autowired
	BoardService boardService;
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//게시판 리스트
	@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
	public String board(Model model, @RequestParam(value="crtPage", required = false, defaultValue = "1")int crtPage) {
		
		System.out.println("BoardController > board");
		 
		Map<String, Object> pMap = boardService.board(crtPage);
		model.addAttribute("pMap", pMap);
		
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
