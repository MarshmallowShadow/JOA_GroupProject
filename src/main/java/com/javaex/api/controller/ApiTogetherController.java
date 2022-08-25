package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.TogetherService;
import com.javaex.vo.PointVo;

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
		
	//함께하기 상세페이지 지도 가져오기
	@ResponseBody
	@RequestMapping(value="/map", method = {RequestMethod.GET, RequestMethod.POST})
	public List<PointVo> map(@RequestParam(value = "eventNo", required = false) int eventNo) {
		
		 System.out.println("ApiTogetherController > map");
		 System.out.println(eventNo);
		return togetherService.map(eventNo);
		
	}
	
	
}
