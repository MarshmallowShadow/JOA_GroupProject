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
	public int addFav(int userNo, int courseNo, List<Integer> bmkList, List<Integer> notBmkList) {
		System.out.println("FavoriteService->addFav");
		
		//즐겨찾기 추가
		if(bmkList != null) {
			for(int i=0; i<bmkList.size(); i++) {
				FavoriteCourseVo fcVo = new FavoriteCourseVo();
				fcVo.setCourseNo(courseNo);
				fcVo.setCateNo(bmkList.get(i));
				
				int ck = favCoDao.chkFav(fcVo);
				if(ck == 0) {
					favCoDao.insertFav(fcVo);
				}
			}
		}
		
		//체크 안된것 즐겨찾기에서 삭제
		if(notBmkList != null) {
			for(int i=0; i<notBmkList.size(); i++) {
				FavoriteCourseVo fcVo = new FavoriteCourseVo();
				fcVo.setCourseNo(courseNo);
				fcVo.setCateNo(notBmkList.get(i));
				
				favCoDao.deleteFav(fcVo);
			}
		}
		
		//즐겨찾기 되어있는지 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("courseNo", courseNo);
		return favCoDao.getFavChk(map);
	}
}
