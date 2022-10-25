package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.CourseService;
import com.javaex.vo.CourseVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/course")
public class CourseController {
	
	@Autowired
	private CourseService coService;

	//코스 등록폼
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWriteForm(HttpSession session) {
		System.out.println("CourseController->courseWriteForm()");
		if(session.getAttribute("authUser") != null) {
			return "course/write-course";
		}
		return "redirect:/user/loginForm";
	}
	
	//코스 정보 등록
	@RequestMapping(value="/courseWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseWrite(@RequestParam(value="x", required=true) List<Double> xList,
							@RequestParam(value="y", required=true) List<Double> yList,
							@RequestParam(value="hour", required = true) int hour,
							@RequestParam(value="minute", required = true) int minute,
							@ModelAttribute CourseVo coVo) {
		System.out.println("CourseController->courseWrite()");
		int courseNo = coService.courseWrite(xList, yList, hour, minute, coVo);
		return "redirect:/course/view?courseNo="+courseNo;
	}
	
	//코스 상세보기
	@RequestMapping(value="/view", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseViewForm(Model model, HttpSession session,
								@RequestParam(value = "courseNo") int courseNo) {
		System.out.println("CourseController->courseViewForm()");
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		int userNo = 0;
		if(userVo != null) {
			userNo = userVo.getUserNo();
		}
		Map<String, Object> coMap = coService.getCourseInfo(courseNo, userNo);
		model.addAttribute("coMap", coMap);		
		return "course/view-course";
	}
	
}
