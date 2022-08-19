package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.FavoriteService;
import com.javaex.vo.FavoriteCategoryVo;

@Controller
@RequestMapping(value = "/apiFav")
public class ApiFavoriteController {

	@Autowired
	private FavoriteService favService;
	
	//즐겨찾기 목록 가져오기
	@ResponseBody
	@RequestMapping(value="/getFavCate", method = {RequestMethod.GET, RequestMethod.POST})
	public List<FavoriteCategoryVo> getFavCate(@RequestParam(value="authUserNo", required = false) int userNo) {
		System.out.println("ApiCourseController->getFavCate"); 
		System.out.println(userNo);
		return favService.getFavCate(userNo);
	}
	
	//즐겨찾기 추가
	@ResponseBody
	@RequestMapping(value = "/addFav", method = {RequestMethod.GET, RequestMethod.POST})
	public String addFav(@RequestParam(value = "courseNo", required = false) int courseNo,
						@RequestParam(value = "bmkList", required = false) List<Integer> bmkList) {
		System.out.println("ApiFavoriteController->addFav");
		System.out.println(courseNo);
		System.out.println(bmkList);
		return "";
	}
}
