package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.RecordService;
import com.javaex.vo.RecordVo;
import com.javaex.vo.UserVo;

@Controller
public class ApiRecordController {
	
	@Autowired
	private RecordService recService;
	
	
	//기록 등록
	@ResponseBody
	@RequestMapping(value="/recordWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWrite(@ModelAttribute RecordVo recVo) {
		System.out.println("RecordController->recordWrite");
		return recService.recordWrite(recVo);
	}
	
	//기록사진 등록
	@ResponseBody
	@RequestMapping(value = "/recordImgWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWrite(@RequestPart(value = "file", required = false) List<MultipartFile> fileList) {
		System.out.println("ApiRecordController->recordWrite");
		System.out.println(fileList);
		return recService.recordImgWrite(fileList);
	}
	
	//기록 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getRecord", method = {RequestMethod.GET, RequestMethod.POST})
	public List<RecordVo> getRecord(@RequestParam(value = "courseNo", required = false) int courseNo,
									@RequestParam(value = "authUserNo", required = false, defaultValue = "0") int authUserNo) {
		System.out.println("ApiRecordController->getRecord");
		return recService.getRecord(courseNo, authUserNo);
	}
	
	
	//코스 작성자 번호 가져오기
	@ResponseBody
	@RequestMapping(value = "/getCoUserNo", method = {RequestMethod.GET, RequestMethod.POST})
	public int getCoUserNo(@RequestParam(value = "courseNo", required = false) int courseNo) {
		//System.out.println("ApiRecordController->getCoUserNo");
		return recService.getCoUserNo(courseNo);
	}
	
	//기록 작성자 이름 가져오기
	@ResponseBody
	@RequestMapping(value = "/getUserName", method = {RequestMethod.GET, RequestMethod.POST})
	public String getUserName(@RequestParam(value = "userNo", required = false) int userNo) {
		//System.out.println("ApiRecordController->getUserName");
		UserVo userVo = recService.getUserName(userNo);
		return userVo.getName();
	}
}
