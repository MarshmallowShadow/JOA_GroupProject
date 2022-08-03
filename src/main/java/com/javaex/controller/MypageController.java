package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	/*
	 * @Autowired private MypageService mypageService;
	 */
	
	
	
	//마이페이지-메인
	@RequestMapping(value="/my-page", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage() {
		System.out.println("MypageController>mypage");
		
		return "my-page/main";
	}
	
	//메뉴바
	@RequestMapping(value="/my-page/menu", method = {RequestMethod.GET, RequestMethod.POST})
	public String menu() {
		System.out.println("MypageController>menu");
		
		return "my-page/menubar";
	}
	
	
	
	
	
	//마이페이지-내 코스
	@RequestMapping(value="/my-page/my-course", method = {RequestMethod.GET, RequestMethod.POST})
	public String mycourse() {
		System.out.println("MypageController>mycourse");
		
		return "my-page/my-course";
	}
	
	//마이페이지-내 기록
	@RequestMapping(value="/my-page/my-report", method = {RequestMethod.GET, RequestMethod.POST})
	public String myreport() {
		System.out.println("MypageController>myreport");
		
		return "my-page/my-report";
	}
	
	
	
	//즐겨찾기
	@RequestMapping(value="/my-page/bookmark", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmark() {
		System.out.println("MypageController>bookmark");
		
		return "my-page/bookmark-main";
	}
	
	
	//즐겨찾기-예시
	@RequestMapping(value="/my-page/bookmark/01", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmark01() {
		System.out.println("MypageController>bookmark01");
		
		return "my-page/bookmark-ex";
	}
	
}
