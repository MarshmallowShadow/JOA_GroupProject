package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CourseVo;
import com.javaex.vo.FavoriteCategoryVo;

@Repository
public class MyFavoriteDao {
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//즐겨찾기 메인(전체) list 가져오기
	public List<Map<String, Object>> getFavAllList(int userNo){
		System.out.println("MyFavoriteDao>getFavAllList"); 
		return sqlSession.selectList("mypage.getFavAllList", userNo); 
	}
	
	
	//즐겨찾기 카테고리별 list 가져오기
	public List<Map<String, Object>> getFavCourseList(Map<String, Object> fcVo) {/* Map<String, Object> fcMap */
		System.out.println("MyFavoriteDao>getFavCourseList"); 
		return sqlSession.selectList("mypage.getFavCourseList", fcVo); 
	}
	
	//게시판 코스 불러오기에 즐겨찾기 항목 가져오기
	public List<FavoriteCategoryVo> getFavList(int userNo) {
		
		System.out.println("MyFavoriteDao > getFavList");
		
		return sqlSession.selectList("favcate.getFavList", userNo);
		
	}
	
	//게시판 코스 불러오기에 코스 리스트 가져오기
	public List<CourseVo> getCourses(int cateNo) {
		
		System.out.println("MyFavoriteDao > getFavCourses");
		
		return sqlSession.selectList("favcate.getCourses", cateNo);
		
	}
	
}
