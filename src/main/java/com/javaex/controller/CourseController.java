package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CourseController {

	//코스 등록폼
	@RequestMapping(value="/course-write", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWriteForm() {
		
		return "course/write-course";
	}
}
