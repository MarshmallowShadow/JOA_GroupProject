package com.javaex.controller;

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
	
	/***************** 댓글  ****************/
	
	
	
	
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
	
	//메인(리스트) + 페이징 + 검색
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list (Model model, 
		@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
		@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
		@RequestParam(value="boardCategory", required=false, defaultValue="") String boardCategory) {
		System.out.println("ListController>List/Page/Search");
		
		//keyword 검색
		if (keyword == null) {
			keyword = "";
		}
		keyword = "%" + keyword + "%";
		
		//boardCategory 검색
		if (boardCategory == null) {
			boardCategory = "";
		}
		boardCategory = "%" + boardCategory + "%";
		
		Map<String, Object> pMap = listService.getListPage(crtPage, keyword, boardCategory);
		//System.out.println(lList); 
		
		//데이터 가져오기 
		model.addAttribute("lList", pMap.get("lList"));
		model.addAttribute("next", pMap.get("next"));
		model.addAttribute("prev", pMap.get("prev"));
		model.addAttribute("startPageBtnNo", pMap.get("startPageBtnNo"));
		model.addAttribute("endPageBtnNo", pMap.get("endPageBtnNo"));
		model.addAttribute("cateMap", pMap.get("cateMap"));
		
		return "list/list";
	}
}