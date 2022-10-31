package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.StatisticsService;

@Controller
@RequestMapping(value="api")
public class ApiStatisticsController {
	
	@Autowired
	StatisticsService statService;

	//통계 페이지
	@ResponseBody
	@RequestMapping(value="stat", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> Statistics(@RequestParam(value="month", required = false, defaultValue = "all") String month) {
		//System.out.println("api/stat");
		return statService.getStat(month);
	}
}
