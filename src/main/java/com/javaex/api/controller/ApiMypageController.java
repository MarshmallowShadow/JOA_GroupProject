package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MypageService;

@Controller
public class ApiMypageController {
	@Autowired
	private MypageService mypageService;

	@ResponseBody
	@RequestMapping(value="/api/my-page/get-record-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getRecordList() {
		System.out.println("ApiMypageController>list()");
		//List<Map<String,Object>> calendarList = mypageService.calendarList();
	 	//System.out.println(calendarList);
	 
	 	return null; 
	}
	
}
