package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

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
import com.javaex.vo.RecordImgVo;
import com.javaex.vo.RecordVo;

@Controller
@RequestMapping(value = "apiRec")
public class ApiRecordController {
	
	@Autowired
	private RecordService recService;
	
	
	//기록 등록
	@ResponseBody
	@RequestMapping(value="/recordWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public int recordWrite(@ModelAttribute RecordVo recVo) {
		System.out.println("RecordController->recordWrite");
		return recService.recordWrite(recVo);
	}
	
	//기록사진 등록
	@ResponseBody
	@RequestMapping(value = "/recordImgWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWrite(@RequestPart(value = "file", required = false) List<MultipartFile> fileList,
					@RequestParam(value = "recNo", required = false) int recNo) {
		System.out.println("ApiRecordController->recordWrite");
		System.out.println(fileList);
		System.out.println(recNo);
		return recService.recordImgWrite(fileList, recNo);
	}
	
	//기록 이미지 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteImgs", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteImgs(@RequestParam(value = "deleteFiles[]", required = false) List<Integer> deleteFiles) {
		System.out.println("ApiRecordController->recordModify");
		System.out.println(deleteFiles);
		return recService.deleteImgs(deleteFiles);
	}
	
	//기록 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getRecord", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getRecord(@RequestParam(value = "courseNo", required = false) int courseNo,
									@RequestParam(value = "authUserNo", required = false, defaultValue = "0") int authUserNo) {
		System.out.println("ApiRecordController->getRecord");
		return recService.getRecordList(courseNo, authUserNo);
	}
	
	//코스 작성자 번호 가져오기
	@ResponseBody
	@RequestMapping(value = "/getCoUserNo", method = {RequestMethod.GET, RequestMethod.POST})
	public int getCoUserNo(@RequestParam(value = "courseNo", required = false) int courseNo) {
		//System.out.println("ApiRecordController->getCoUserNo");
		return recService.getCoUserNo(courseNo);
	}
	
	//(기록수정) 기록사진 가져오기
	@ResponseBody
	@RequestMapping(value = "/getImgs", method = {RequestMethod.GET, RequestMethod.POST})
	public List<RecordImgVo> getImgs(@RequestParam(value = "recordNo", required = false) int recordNo) {
		System.out.println("ApiRecordController->getImgs");
		return recService.getImgs(recordNo);
	}
	
	//기록 수정
	@ResponseBody
	@RequestMapping(value = "/recordModify", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordModify(@ModelAttribute RecordVo recVo) {
		System.out.println("ApiRecordController->recordModify");
		return recService.recordModify(recVo);
	}
	
}
