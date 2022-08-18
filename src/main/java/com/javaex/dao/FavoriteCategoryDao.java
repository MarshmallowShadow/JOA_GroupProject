package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FavoriteCategoryVo;

@Repository
public class FavoriteCategoryDao {

	@Autowired
	private SqlSession sqlSession;

	//즐겨찾기 리스트 가져오기
	public List<FavoriteCategoryVo> getFavCate(int userNo) {
		System.out.println("FavoriteCategoryDao->getFavCate");
		return sqlSession.selectList("favcate.getFavCate", userNo);
	}
}
