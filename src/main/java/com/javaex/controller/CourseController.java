package com.javaex.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CourseController {

	//코스 등록폼
	@RequestMapping(value="/course-write", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWriteForm() {
		System.out.println("CourseController->courseWriteForm()");
		return "course/write-course";
	}
	
	//코스 정보 등록
	@ResponseBody
	@RequestMapping(value="/courseWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWrite(@RequestBody HashMap<String, Object> courseMap) {
		System.out.println("CourseController->courseWrite()");
		System.out.println(courseMap);
		return "";
	}
	
	//코스 상세보기
	@RequestMapping(value="/course-view", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseViewForm() {
		System.out.println("CourseController->courseViewForm()");
		return "course/view-course";
	}
	
}
