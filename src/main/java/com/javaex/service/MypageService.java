package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.MyReportDao;
import com.javaex.vo.CategoryVo;

@Service
public class MypageService {
	
	@Autowired private MyReportDao myReportDao;
	@Autowired private CategoryDao categoryDao;
	
	//나의기록 list 가져오기
	public List <Map<String,Object>> getRecordList(int userNo){
		System.out.println("MypageService>calendarList"); 
		return myReportDao.getRecordList(userNo); 
	}
	
	
	
	//즐겨찾기 카테고리 list 가져오기1
	public List <CategoryVo> getCategoryList(int userNo){
		System.out.println("MypageService>CateList"); 
		return categoryDao.getCategoryList(userNo); 
	}
	
	//즐겨찾기 카테고리 list 가져오기2
	public List <CategoryVo> categoryList(){
		System.out.println("MypageService>CateList"); 
		return categoryDao.categoryList(); 
	}
	
	//즐겨찾기 카테고리 추가 insert
	public int insertCategory(CategoryVo categoryVo) {
		System.out.println("MypageService>insertCategory()");
		return categoryDao.insertCategory(categoryVo);
	}
	
}
