package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.ListService;
import com.javaex.vo.ListVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/list")
public class ListController {
	
	//필드
	@Autowired
	ListService listService;
	
	//생성자
	
	//메소드
	
	//메소드 일반
	
	/***************** 페이징 (페이징 + 검색) ****************/
	@RequestMapping(value = "/page", method = {RequestMethod.GET, RequestMethod.POST})
	public String page(Model model,
			@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage) {
			//required = false 오류 발생을 줄여주는 역할, defaultValue는 crtPage(현재페이지)라는 정보가 없을 경우 1페이지로 가라는 의미
			
		System.out.println("ListController>page");
		
		Map<String, Object> pMap = listService.getListPage(crtPage);
		model.addAttribute("pMap", pMap);
		
		System.out.println(pMap);

		return "list/list";
	}
	
	/***************** 삭제  ****************/
	@RequestMapping(value = "/delete/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete (@PathVariable("no") int no) {
		System.out.println("ListController>delete");
		
		listService.delete(no);
		
		return "redirect:/list/list";
	}
	
	/***************** 상세페이지 읽기  ****************/
	@RequestMapping(value = "/read/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String read (@PathVariable("no") int no, Model model) {
		
		System.out.println("ListController > read");
		
		//listService.hitUpdate(no);
		//ListVo lVo = listService.getList(no);
		
		Map<String, Object> rMap = listService.getList(no);
		model.addAttribute("rMap",rMap);
		
		return "list/read";
	}
	
	/***************** 글쓰기  ****************/
	//글쓰기 등록
	@RequestMapping(value = "/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute ListVo listVo, HttpSession session) {
		System.out.println("ListController > write");
		
		listService.write(listVo);
		
		//ID 출력
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		listVo.setUserNo(authUser.getUserNo());
		System.out.println(authUser.getUserNo());
		
		return "redirect:/list/list"; 
	}
	
	//글쓰기폼
	@RequestMapping(value = "/listWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String listWrite () {
		System.out.println("ListController > listWirte");
		
		return "list/listWrite";
	}
	
	//메인(리스트)
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list (String keyword, Model model) {
		System.out.println("ListController > list");
		
		//검색
		if (keyword == null) {
			keyword = "";
		}
		keyword = "%" + keyword + "%";
		
		// lList 데이터 가져오기
		List<ListVo> lList = listService.getlist(keyword);
		//System.out.println(lList); 
		
		//데이터 가져오기 
		model.addAttribute("lList", lList);
		
		return "list/list";
	}
}