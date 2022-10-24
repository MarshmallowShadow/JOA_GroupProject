package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.StatisticsService;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService statService;

	//통계 페이지
	@RequestMapping(value="stat", method = {RequestMethod.GET, RequestMethod.POST})
	public String Statistics(Model model) {
		List<Map<String, Object>> statList = statService.getStat();
		model.addAttribute("statList", statList);
		return "course/statistics";
	}
}
