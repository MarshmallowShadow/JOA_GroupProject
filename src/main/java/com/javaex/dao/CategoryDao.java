package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired 
	private SqlSession sqlSession;
		
	
	//즐겨찾기 카테고리 list 가져오기
	public List <CategoryVo> getCategoryList(int userNo){
		System.out.println("CategoryDao>CateList"); 
		return sqlSession.selectList("mypage.getCategoryList", userNo);
	}
	
	
	
	//
	
	
	
}
