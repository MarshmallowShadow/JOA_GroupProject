package com.javaex.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.RecordService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/record")
public class RecordController {
	
	@Autowired
	private RecordService recService;
	
	
	//기록 등록폼
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordWriteForm(Model model, HttpSession session, @RequestParam int courseNo) {
		System.out.println("RecordController->recordWriteForm");
		if(session.getAttribute("authUser") != null) {
			Map<String, Object> coMap = recService.getCourseInfo(courseNo);
			model.addAttribute("coMap", coMap);
			return "course/write-record";
		}
		return "redirect:/user/loginForm";
	}
	
	
	//기록 상세보기
	@RequestMapping(value="/view", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordViewForm(HttpSession session, Model model, @RequestParam int courseNo) {
		System.out.println("RecordController->recordViewForm");
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		int userNo = 0;
		if(userVo != null) {
			userNo = userVo.getUserNo();
		}
		Map<String, Object> coMap = recService.recordViewForm(courseNo, userNo);
		model.addAttribute("coMap", coMap);
		return "course/view-record";
	}
	
	
	//기록 수정폼
	@RequestMapping(value="/modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String recordModifyForm(Model model, HttpSession session,
								@RequestParam(value = "courseNo", required = false) int courseNo,
								@RequestParam(value = "recordNo", required = false) int recordNo) {
		System.out.println("RecordController->recordWriteForm");
		if(session.getAttribute("authUser") != null) {
			Map<String, Object> recMap = recService.getRecord(courseNo, recordNo);
			model.addAttribute("recMap", recMap);
			return "course/modify-record";
		}
		return "redirect:/user/loginForm";
		
	}
}
