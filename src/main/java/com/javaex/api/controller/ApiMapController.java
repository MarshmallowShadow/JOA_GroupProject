package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.MapService;

@RequestMapping(value="/api/map")
@Controller
public class ApiMapController {
	
	@Autowired
	private MapService mService;
	
	@RequestMapping(value="/getList")
	public List<Map<String, Object>> getList(@ModelAttribute Map<String, Object> kMap) {
		System.out.println("ApiMapController>getList");
		
		List<Map<String, Object>> cList = mService.getList(kMap);
		
		return cList;
	}
}
