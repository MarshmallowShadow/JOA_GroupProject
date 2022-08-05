package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MypageService;
import com.javaex.vo.MyReportVo;

@Controller

public class ApiMypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@ResponseBody
	@RequestMapping(value="/my-page/my-report", method= {RequestMethod.GET, RequestMethod.POST})
	public List <MyReportVo> list() {
		System.out.println("ApiMypageController>list()");
		List <MyReportVo> calendarList = mypageService.calendarList();
		System.out.println(calendarList);
		
		return calendarList;
	}
	
}
