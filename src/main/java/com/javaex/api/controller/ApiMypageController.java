package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.javaex.service.MypageService;

@Controller

public class ApiMypageController {
	
	/*
	@Autowired
	private MypageService mypageService;
	
	@GetMapping(params="method=list")
	public String list() {
		return "my-page/my-report";
	}

	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("list", mypageService.calendarList());
		return "my-page/my-report";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/my-page/my-report", method= {RequestMethod.GET,
	 * RequestMethod.POST}) public List <MyReportVo> list() {
	 * System.out.println("ApiMypageController>list()"); List <MyReportVo>
	 * calendarList = mypageService.calendarList();
	 * System.out.println(calendarList);
	 * 
	 * return calendarList; }
	 */
	
}
