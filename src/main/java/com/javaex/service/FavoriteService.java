package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FavoriteCategoryDao;
import com.javaex.dao.FavoriteCourseDao;
import com.javaex.vo.FavoriteCategoryVo;
import com.javaex.vo.FavoriteCourseVo;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteCategoryDao favCateDao;
	@Autowired
	private FavoriteCourseDao favCoDao;
	
	//즐겨찾기 리스트 가져오기
	public List<FavoriteCategoryVo> getFavCate(int userNo) {
		System.out.println("FavoriteService->getFavCate");
		return favCateDao.getFavCate(userNo);
	}

	//즐겨찾기 추가
	public String addFav(int courseNo, List<Integer> bmkList) {
		System.out.println("FavoriteService->addFav");
		
		int count = 0;
		for(int i=0; i<bmkList.size(); i++) {
			FavoriteCourseVo fcVo = new FavoriteCourseVo();
			fcVo.setCourseNo(courseNo);
			fcVo.setCateNo(bmkList.get(i));
			
			count += favCoDao.insertFav(fcVo);
		}
		
		if(count > 0) {
			return "success";
		}
		
		return "fail";
		
		
	}
}
