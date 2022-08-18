package com.javaex.api.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.TogetherService;

@Controller
@RequestMapping(value="/api/together")
public class ApiTogetherController {
	
	@Autowired
	TogetherService togetherService;
	
	@ResponseBody
	@RequestMapping(value="/getList")
	public Map<String, Object> getList (@RequestBody int crtPage){
		
		Map<String, Object> xMap = togetherService.together(crtPage);
		
		System.out.println(xMap);
		
		return xMap;
		
	}
	
}
