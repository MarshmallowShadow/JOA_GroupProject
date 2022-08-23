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
	
	
	//나의 기록 보기////////////////////////////////////////////////////////////////////////////
	//나의 기록보기 - 기록 list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-record-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getRecordList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>record-list()");
		List<Map<String,Object>> calendarList = mypageService.getRecordList(userNo);
	 	System.out.println(calendarList);
	 return calendarList; 
	}
	
	
	
	//나의 기록보기 - 나의 기록 삭제하기
	@ResponseBody
	@RequestMapping(value="/api/my-page/delete-record", method= {RequestMethod.GET, RequestMethod.POST}) 
	public int deleteRecord(@RequestBody int recordNo) {
		System.out.println("ApiMypageController>update-cate()");
		int delRec = mypageService.deleteRecord(recordNo);
		return delRec;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//나의 코스 보기////////////////////////////////////////////////////////////////////////////
	//나의 코스보기 - 코스 list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-course-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getCourseList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>course-list()");
		List<Map<String,Object>> myCourseList = mypageService.getCourseList(userNo);
		System.out.println(myCourseList);
	 return myCourseList; 
	}
	
	
	//즐겨찾기////////////////////////////////////////////////////////////////////////////
	//나의 즐겨찾기 - 즐겨찾기 메인(전체) list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-fav-all-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getFavAllList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>all-fav-list()");
		List<Map<String,Object>> myFavoriteList = mypageService.getFavAllList(userNo);
		System.out.println(myFavoriteList);
	 return myFavoriteList; 
	}
	
	//나의 즐겨찾기 - 즐겨찾기 개별(카테고리별) list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-Fav-Course-List", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <Map<String,Object>> getFavCourseList(@RequestBody Map<String, Object> fcVo) {
		System.out.println("ApiMypageController>get-Fav-Course-List()");
		List<Map<String,Object>> myFavCourseList = mypageService.getFavCourseList(fcVo);
		System.out.println(myFavCourseList);
	 return myFavCourseList; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//메뉴탭///////////////////////////////////////////////////////////
	//즐겨찾기 카테고리 1- 카테고리 list 가져오기
	@ResponseBody
	@RequestMapping(value="/api/my-page/get-category-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public List <CategoryVo> getCategoryList(@RequestBody int userNo) {
		System.out.println("ApiMypageController>cate-list()");
		List<CategoryVo> categoryList = mypageService.getCategoryList(userNo);
	 	System.out.println(categoryList);
	 	return categoryList; 
	}
	
	//즐겨찾기 카테고리 2- 카테고리 추가하기
	@ResponseBody
	@RequestMapping(value="/api/my-page/add-category-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public CategoryVo insertCategory(@RequestBody CategoryVo categoryVo) {
		System.out.println("ApiMypageController>insert-cate()");
		int cVo = mypageService.insertCategory(categoryVo);
	 	System.out.println(categoryVo);
	 	return categoryVo;
	}
	
	//즐겨찾기 카테고리 3- 카테고리 삭제하기
	@ResponseBody
	@RequestMapping(value="/api/my-page/del-category-list", method= {RequestMethod.GET, RequestMethod.POST}) 
	public int deleteCategory(@RequestBody int cateNo) {
		System.out.println("ApiMypageController>delete-cate()");
		int delCate = mypageService.deleteCategory(cateNo);
		return delCate;
	}
	
	//즐겨찾기 카테고리 4- 카테고리 수정폼
	@ResponseBody
	@RequestMapping(value="/api/my-page/edit-category-list", method = {RequestMethod.GET, RequestMethod.POST}) 
	public List <CategoryVo> modifyCategory(@RequestBody int cateNo) {
		System.out.println("ApiMypageController>modify-cate()");
		List <CategoryVo> editCate = mypageService.modifyCategory(cateNo);
		return editCate; 
	}
	
	//즐겨찾기 카테고리 5- 카테고리 수정
	@ResponseBody
	@RequestMapping(value="/api/my-page/modify-category", method= {RequestMethod.GET, RequestMethod.POST}) 
	public int updateCategory(@RequestBody CategoryVo categoryVo) {
		System.out.println("ApiMypageController>update-cate()");
		int modifyCate = mypageService.updateCategory(categoryVo);
		return modifyCate;
	}
	
	
}
