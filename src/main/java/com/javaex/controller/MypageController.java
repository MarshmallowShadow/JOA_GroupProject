package com.javaex.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.MypageService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/my-page")
public class MypageController {
	
	@Autowired private MypageService mypageService;
	
	//마이페이지-메인
	@RequestMapping(value="", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage() { 
		System.out.println("MypageController>mypage");
		
		return "my-page/main";
	}
	
	//마이페이지-내 코스
	@RequestMapping(value="/my-course", method = {RequestMethod.GET, RequestMethod.POST})
	public String mycourse() {
		System.out.println("MypageController>mycourse");
		
		return "my-page/my-course";
	}
	
	//마이페이지-내 기록
	@RequestMapping(value="/my-report", method = {RequestMethod.GET, RequestMethod.POST})
	public String myreport() {
		System.out.println("MypageController>myreport");
		return "my-page/my-report";
	}
	
	//즐겨찾기////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/bookmark/main", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmarkMain() {
		System.out.println("MypageController>bookmark");
		
		return "my-page/bookmark-main";
	}
	
	//즐겨찾기-예시
	@RequestMapping(value="/bookmark", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookmarks(Model model, HttpSession session,
							@RequestParam(value = "cateNo") int cateNo) {
		System.out.println("MypageController>bookmarks-category");
		
		return "my-page/bookmark-ex";
	}
	
	
	
	/*
	 * @RequestMapping(value="/view", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String courseViewForm(Model model, HttpSession
	 * session,
	 * 
	 * @RequestParam(value = "courseNo") int courseNo) {
	 * System.out.println("CourseController->courseViewForm()"); UserVo userVo =
	 * (UserVo) session.getAttribute("authUser"); int userNo = 0; if(userVo != null)
	 * { userNo = userVo.getUserNo(); } Map<String, Object> coMap =
	 * coService.getCourseInfo(courseNo, userNo); model.addAttribute("coMap",
	 * coMap); return "course/view-course"; }
	 */
	
}
