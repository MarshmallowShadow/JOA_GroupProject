package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/delete/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@PathVariable("no") int no) {
		
		System.out.println("ListController>delete");
		
		//listService.delete(no);
		
		return "redirect:/list/list";
	}
	
	/***************** 글쓰기  ****************/
	//글쓰기 등록
	@RequestMapping(value = "/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute ListVo listVo) {
		System.out.println("ListController>write");
		
		listService.write(listVo);
		
		return "redirect:/list/listWrite";
	}
	
	//글쓰기폼
	@RequestMapping(value = "/listWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String listWrite () {
		System.out.println("ListController>listWirte");
		
		return "list/listWrite";
	}
	
	//메인(리스트)
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list () {
		System.out.println("ListController");
		
		//데이터 가져오기 
		
		//model.addAttribute("lList", lList);
		
		return "list/list";
	}

}
