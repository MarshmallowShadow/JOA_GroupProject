package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FavoriteCourseVo;

@Repository
public class FavoriteCourseDao {

	@Autowired
	private SqlSession sqlSession;
	
	//즐겨찾기 리스트 가져오기
	public List<HashMap<String, Object>> getFavCate(Map<String, Object> map) {
		System.out.println("FavoriteCategoryDao->getFavCate");
		return sqlSession.selectList("favcourse.getFavCate", map);
	}

	//즐겨찾기 추가
	public int insertFav(FavoriteCourseVo fcVo) {
		System.out.println("FavoriteCourseDao->insertFav");
		return sqlSession.insert("favcourse.insert", fcVo);
	}
}
