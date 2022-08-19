package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FavoriteCourseDao;
import com.javaex.vo.FavoriteCourseVo;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteCourseDao favCoDao;
	
	//즐겨찾기 리스트 가져오기
	public List<HashMap<String, Object>> getFavCate(int userNo, int courseNo) {
		System.out.println("FavoriteService->getFavCate");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("courseNo", courseNo);
		
		return favCoDao.getFavCate(map);
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
