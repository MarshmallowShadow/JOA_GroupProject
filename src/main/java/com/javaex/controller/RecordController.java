package com.javaex.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.RecordService;

@Controller
@RequestMapping(value="/record")
public class RecordController {
	
	@Autowired
	private RecordService recService;
	
	
	//기록 등록폼
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWriteForm(Model model, @RequestParam int courseNo) {
		System.out.println("RecordController->recordWriteForm");
		Map<String, Object> coMap = recService.getCourseInfo(courseNo);
		model.addAttribute("coMap", coMap);
		return "course/write-record";
	}
	
	
	//기록 상세보기
	@RequestMapping(value="/view", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordViewForm() {
		System.out.println("RecordController->recordViewForm");
		return "course/view-record";
	}
}
