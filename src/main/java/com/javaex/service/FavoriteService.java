package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FavoriteCategoryDao;
import com.javaex.vo.FavoriteCategoryVo;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteCategoryDao favCateDao;
	
	//즐겨찾기 리스트 가져오기
	public List<FavoriteCategoryVo> getFavCate(int userNo) {
		System.out.println("CourseService->getFavCate");
		return favCateDao.getFavCate(userNo);
	}
}
