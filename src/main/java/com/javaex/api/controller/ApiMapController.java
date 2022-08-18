package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MapService;

@RequestMapping(value="/api/map")
@Controller
public class ApiMapController {
	
	@Autowired
	private MapService mService;
	
	//지도 검색 결과 가져오기
	@ResponseBody
	@RequestMapping(value="/getList", method= {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> getList(@RequestBody Map<String, Object> kMap) {
		System.out.println("ApiMapController>getList");
		
		List<Map<String, Object>> cList = mService.getList(kMap);
		
		return cList;
	}
}
