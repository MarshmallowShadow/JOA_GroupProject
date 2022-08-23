package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BestService;

@Controller
@RequestMapping(value="/api/best")
public class ApiBestController {
	
	//필드
	@Autowired
	BestService bestService;

	//생성자
	
	//메소드
	
	//메소드 일반
	//지도 api 가져오기
	@ResponseBody
	@RequestMapping(value="/apiBest", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Map<String, Object>> apiBest(@RequestParam(value="course_cate", defaultValue="") String course_cate,
		    @RequestParam(value="count_cate", required=true, defaultValue="l_count") String count_cate) {
		System.out.println("apiBest");
		
		List<Map<String, Object>> bList = bestService.getBest(course_cate, count_cate);
		
		//데이터 저장후 출력해보기
		System.out.println(bList);
		
		return bList;
	}
	
}
