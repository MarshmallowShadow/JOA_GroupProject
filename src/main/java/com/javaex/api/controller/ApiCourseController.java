package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.CourseService;

@Controller
public class ApiCourseController {
	
	@Autowired
	CourseService coService;

	@RequestMapping(value = "/getCategory", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Integer> getCategory(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getCategory");
		return coService.getCategory(courseNo);
	}
}
