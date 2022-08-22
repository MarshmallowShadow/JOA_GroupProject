package com.javaex.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.TogetherService;
import com.javaex.vo.CourseVo;
import com.javaex.vo.EventVo;

@Controller
@RequestMapping(value="/together")
public class TogetherController {
	
	//필드
	@Autowired
	TogetherService togetherService;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	
	//함께하기 리스트
	@RequestMapping(value="/together", method = {RequestMethod.GET, RequestMethod.POST})
	public String together(Model model
						   , @RequestParam(value="crtPage", required = false, defaultValue = "1")int crtPage) {
		
		 System.out.println("TogetherController > together");			
		
		return "together/together";
		
	}
	
	//함께하기 글쓰기폼
	@RequestMapping(value="/writeform", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeform() {
		
		 System.out.println("TogetherController > writeform");
		
		return "together/writeform";
		
	}
	
	//함께하기 글쓰기
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@RequestParam(value="x", required=true) List<Double> xList
						, @RequestParam(value="y", required=true) List<Double> yList
						, @RequestParam(value="hour", required = true) int hour
						, @RequestParam(value="minute", required = true) int minute
						, @ModelAttribute CourseVo coVo
						, @ModelAttribute EventVo eventVo) {
		
		 System.out.println("TogetherController > write");
		 
		 int courseNo = togetherService.write(xList, yList, hour, minute, coVo, eventVo);
		
		 return "redirect:together";
		
	}
	
	//함께하기 상세페이지
	@RequestMapping(value="/read/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String read(Model model, @PathVariable int no) {
		
		 System.out.println("TogetherController > read");
		 
		//내용 읽기
		Map<String, Object> tMap = togetherService.read(no);
		model.addAttribute("tMap", tMap);
		
		return "together/read";
		
	}
	
}
