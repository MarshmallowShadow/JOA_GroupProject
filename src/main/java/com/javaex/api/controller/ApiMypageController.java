package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MypageService;
import com.javaex.vo.CategoryVo;

@Controller
public class ApiMypageController {
	@Autowired
	private MypageService mypageService;
	
	
	//나의 기록보기 - 기록 list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-record-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getRecordList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>record-list()");
		List<Map<String,Object>> calendarList = mypageService.getRecordList(userNo);
	 	System.out.println(calendarList);
	 return calendarList; 
	}
	
	
	
	//나의 기록보기 - 기록 list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-category-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <CategoryVo> getCategoryList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>cate-list()");
		List<CategoryVo> categoryList = mypageService.getCategoryList(userNo);
	 	System.out.println(categoryList);
	 return categoryList; 
	}
	
}
