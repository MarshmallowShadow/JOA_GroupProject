package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecordController {
	
	//기록 등록폼
	@RequestMapping(value="/record-write", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWriteForm() {
		System.out.println("RecordController->recordWriteForm");
		return "course/write-record";
	}
	
	//기록 상세보기
	@RequestMapping(value="/record-view", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordViewForm() {
		System.out.println("RecordController->recordViewForm");
		return "course/view-record";
	}
}
