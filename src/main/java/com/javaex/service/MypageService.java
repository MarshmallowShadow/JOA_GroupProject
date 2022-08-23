package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.MyCourseDao;
import com.javaex.dao.MyFavoriteDao;
import com.javaex.dao.MyReportDao;
import com.javaex.vo.CategoryVo;

@Service
public class MypageService {
	
	@Autowired private MyReportDao myReportDao;
	@Autowired private MyCourseDao myCourseDao;
	@Autowired private CategoryDao categoryDao;
	@Autowired private MyFavoriteDao myFavoriteDao;
	
	
	//나의코스 list 가져오기
	public List <Map<String,Object>> getCourseList(int userNo){
		System.out.println("MypageService>MyCourseList"); 
		return myCourseDao.getCourseList(userNo); 
	}
	
	//즐겨찾기 전체 리스트 가져오기
	public List <Map<String, Object>> getFavAllList(int userNo){
		System.out.println("MypageService>getFav-All"); 
		return myFavoriteDao.getFavAllList(userNo); 
	}

	//즐겨찾기 카테고리별 리스트 가져오기
	public List<Map<String, Object>> getFavCourseList(int userNo, int cateNo){
		System.out.println("MypageService>getFav-cate");
		
		Map<String, Object> fcMap = new HashMap<String, Object>();
		fcMap.put("userNo", userNo); //코스정보
		fcMap.put("cateNo", cateNo); //유저이름
		
		return myFavoriteDao.getFavCourseList(fcMap);
	}
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////
	//나의기록 list 가져오기
	public List <Map<String,Object>> getRecordList(int userNo){
		System.out.println("MypageService>calendarList"); 
		return myReportDao.getRecordList(userNo); 
	}
	
	//나의기록 - 나의 기록 삭제하기
	public int deleteRecord(int recordNo) {
		System.out.println("MypageService>del-rec()");
		return myReportDao.deleteRecord(recordNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////
	//즐겨찾기 카테고리 list 가져오기1
	public List <CategoryVo> getCategoryList(int userNo){
		System.out.println("MypageService>CateList"); 
		return categoryDao.getCategoryList(userNo); 
	}
		
	//즐겨찾기 카테고리 추가 insert
	public int insertCategory(CategoryVo categoryVo) {
		System.out.println("MypageService>insertCategory()");
		return categoryDao.insertCategory(categoryVo);
	}
	
	//즐겨찾기 카테고리 추가 delete
	public int deleteCategory(int cateNo) {
		System.out.println("MypageService>deleteCategory()");
		return categoryDao.deleteCategory(cateNo);
	}
	
	
	//즐겨찾기 카테고리 4- 카테고리 수정폼
	public List <CategoryVo> modifyCategory(int cateNo) {
		System.out.println("MypageService>modify-cate()");
		return categoryDao.modifyCategory(cateNo);
	}
	
	//즐겨찾기 카테고리 5- 카테고리 수정
	public int updateCategory(CategoryVo categoryVo) {
		System.out.println("MypageService>update-cate()");
		return categoryDao.updateCategory(categoryVo);
	}

	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////
	
	
	
}
