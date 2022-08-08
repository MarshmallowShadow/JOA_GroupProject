package com.javaex.api.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ApiRecordController {
	
	
	//기록 등록
	@ResponseBody
	@RequestMapping(value = "/recordwrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWrite(@RequestBody Map<String, Object> fileMap) {
		System.out.println("ApiRecordController->recordWrite");
		System.out.println(fileMap);
		return "";
	}
}
