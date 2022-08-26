package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.CourseService;
import com.javaex.vo.PointVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "apiCo")
public class ApiCourseController {
	
	@Autowired
	private CourseService coService;
	
	
	//코스 좌표 가져오기
	@ResponseBody
	@RequestMapping(value = "/getPoint", method = {RequestMethod.GET, RequestMethod.POST})
	public List<PointVo> getPoint(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getPoint");
		return coService.getPoint(courseNo);
	}
	

	//종목 차트 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "/getCateData", method = {RequestMethod.GET, RequestMethod.POST})
	public int[] getCateData(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getCategory");
		return coService.getCateData(courseNo);
	}
	
	
	//난이도 차트 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "/getDiffiData", method = {RequestMethod.GET, RequestMethod.POST})
	public int[] getDiffiData(@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getDiffiData");
		return coService.getDiffiData(courseNo);
	}
	
	
	//코스 제목 수정
	@ResponseBody
	@RequestMapping(value = "/modifyTitle", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyTitle(@RequestParam(value = "modTitle", required = false) String title,
							@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->modifyTitle");
		return coService.modifyTitle(title, courseNo);
	}
	
	//코스 공개설정 수정
	@ResponseBody
	@RequestMapping(value = "/modifyOpen", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyOpen(@RequestParam(value = "openStatus", required = false) String openStatus,
							@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->modifyOpen");
		return coService.modifyOpen(openStatus, courseNo);
	}
	
	//좋아요 버튼 클릭
	@ResponseBody
	@RequestMapping(value="/likeBtnClick", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> likeBtnClick(HttpSession session,
							@RequestParam(value = "courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->likeBtnClick");
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		if(userVo != null) {
			int userNo = userVo.getUserNo();
			return coService.likeBtnClick(courseNo, userNo);
		}
		return null;
	}
	

}
