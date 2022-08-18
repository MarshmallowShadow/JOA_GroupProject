package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteCategoryDao {

	@Autowired
	private SqlSession sqlSession;

	//즐겨찾기 리스트 가져오기
	public void getFavCate(int userNo) {
		System.out.println("FavoriteCategoryDao->getFavCate");
		//return sqlSession.selectList("favcate.getFavCate", userNo);
		
	}
}
