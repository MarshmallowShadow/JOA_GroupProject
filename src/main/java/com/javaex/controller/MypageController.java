package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.MypageService;

@Controller
@RequestMapping(value="/my-page")
public class MypageController {
	
	@Autowired private MypageService mypageService;
	
	
	//마이페이지-메인
	@RequestMapping(value="", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage() {
		System.out.println("MypageController>mypage");
		
		return "my-page/main";
	}
	
	
	//마이페이지-내 코스
	@RequestMapping(value="/my-course", method = {RequestMethod.GET, RequestMethod.POST})
	public String mycourse() {
		System.out.println("MypageController>mycourse");
		
		return "my-page/my-course";
	}
	
	//마이페이지-내 기록
	@RequestMapping(value="/my-report", method = {RequestMethod.GET, RequestMethod.POST})
	public String myreport() {
		System.out.println("MypageController>myreport");
		return "my-page/my-report";
	}
	
	
	
	//즐겨찾기
	@RequestMapping(value="/bookmark", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmark() {
		System.out.println("MypageController>bookmark");
		
		return "my-page/bookmark-main";
	}
	
	
	//즐겨찾기-예시
	@RequestMapping(value="/bookmark/01", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmark01() {
		System.out.println("MypageController>bookmark01");
		
		return "my-page/bookmark-ex";
	}
	
}
