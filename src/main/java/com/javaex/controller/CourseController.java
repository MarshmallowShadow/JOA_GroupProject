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
	
	//코스 정보 등록
	@RequestMapping(value="/courseWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWrite() {
		
		return "";
	}
	
	
	//기록 등록폼
	@RequestMapping(value="/record-write", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWriteForm() {
		
		return "course/write-record";
	}
}
