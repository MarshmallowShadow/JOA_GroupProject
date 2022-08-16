package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.ListService;
import com.javaex.vo.ListVo;

@Controller
public class ListController {
	
	//필드
	@Autowired
	ListService listService;
	
	//생성자
	
	//메소드
	
	//메소드 일반
	
	/***************** 삭제  ****************/
	@RequestMapping(value="/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete() {
		
		System.out.println("ListController>delete");
		
		return "list/listWrite";
	}
	
	/***************** 글쓰기  ****************/
	//글쓰기 등록
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute ListVo listVo) {
		System.out.println("ListController>write");
		
		listService.write(listVo);
		
		return "redirect:/list/listWrite";
	}
	
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
