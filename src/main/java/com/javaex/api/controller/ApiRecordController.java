package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.RecordService;

@Controller
public class ApiRecordController {
	
	@Autowired
	private RecordService recService;
	
	
	//기록 등록
	@ResponseBody
	@RequestMapping(value = "/recordImgWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWrite(@RequestPart(value = "file", required = false) List<MultipartFile> fileList) {
		System.out.println("ApiRecordController->recordWrite");
		System.out.println(fileList);
		//return recService.recordImgWrite(fileList);
		return "success";
	}
}
