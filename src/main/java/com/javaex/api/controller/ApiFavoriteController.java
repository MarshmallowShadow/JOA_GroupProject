package com.javaex.api.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.FavoriteService;

@Controller
@RequestMapping(value = "/apiFav")
public class ApiFavoriteController {

	@Autowired
	private FavoriteService favService;
	
	//즐겨찾기 목록 가져오기
	@ResponseBody
	@RequestMapping(value="/getFavCate", method = {RequestMethod.GET, RequestMethod.POST})
	public List<HashMap<String, Object>> getFavCate(@RequestParam(value="authUserNo", required = false) int userNo,
												@RequestParam(value="courseNo", required = false) int courseNo) {
		System.out.println("ApiCourseController->getFavCate"); 
		return favService.getFavCate(userNo, courseNo);
	}
	
	
	//즐겨찾기 추가
	@ResponseBody
	@RequestMapping(value = "/addFav", method = {RequestMethod.GET, RequestMethod.POST})
	public int addFav(@RequestParam(value = "authUserNo") int userNo,
						@RequestParam(value = "courseNo") int courseNo,
						@RequestParam(value = "bmkList[]", required = false) List<Integer> bmkList,
						@RequestParam(value = "notBmkList[]", required = false) List<Integer> notBmkList) {
		System.out.println("ApiFavoriteController->addFav");
		return favService.addFav(userNo, courseNo, bmkList, notBmkList);
	}
}
