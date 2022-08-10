package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.CourseService;

@Controller
public class ApiCourseController {
	
	@Autowired
	CourseService coService;

	//종목 차트 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "/getCateData", method = {RequestMethod.GET, RequestMethod.POST})
	public int[] getCateData(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getCategory");
		return coService.getCateData(courseNo);
	}
	
	
	//난이도 차트 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "/getDiffiData", method = {RequestMethod.GET, RequestMethod.POST})
	public int[] getDiffiData(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getDiffiData");
		return coService.getDiffiData(courseNo);
	}
}
