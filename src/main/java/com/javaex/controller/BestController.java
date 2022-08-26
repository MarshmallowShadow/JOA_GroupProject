package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BestService;

@RequestMapping(value="/best")
@Controller
public class BestController {
	
	//필드
	@Autowired
	BestService bestService;
	
	//생성자
	
	//메소드 g/s
	
	//메소드 일반
	//좋아요
		
	//게시글 불러오기
	@RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
	public String best(Model model,
			@RequestParam(value="course_cate", defaultValue="") String course_cate,
		    @RequestParam(value="count_cate", required=true, defaultValue="l_count") String count_cate) {
		System.out.println("BestController");
		
		List<Map<String, Object>> bList = bestService.getBest(course_cate, count_cate);
		
		model.addAttribute("bList", bList);
		
		return "best/best";
	}
}
