package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FavoriteCourseVo;

@Repository
public class FavoriteCourseDao {

	@Autowired
	private SqlSession sqlSession;

	//즐겨찾기 추가
	public int insertFav(FavoriteCourseVo fcVo) {
		System.out.println("FavoriteCourseDao->insertFav");
		return sqlSession.insert("favcourse.insert", fcVo);
	}
}
