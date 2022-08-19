package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.ListDao;
import com.javaex.vo.ListVo;

@Service
public class ListService {
	
	//필드
	@Autowired
	ListDao listDao;
	
	//생성자
	
	//메소드
	
	//메소드 일반

	//조회수 (hitUpdate)
	/*public int hitUpdate(int no) {
		System.out.println("ListService>hitUpdate");
		
		int count = listDao.hitUpdate(no);
		
		return count;
	}*/
	
	
	//읽기 (한 명 정보 가져오기)
	public Map<String, Object> getList(int no) {
		System.out.println("ListService>read");
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		//ListVo lVo = listDao.getList(no);

		return rmap;
	}
	
	//글쓰기 등록
	public int write(ListVo listVo) {
		System.out.println("ListService>write");
		
		int count = listDao.write(listVo);
		
		return count;
	}
	
	//리스트 출력
	public List<ListVo> getlist(String keyword) {
		System.out.println("ListService>getlist");
		
		List<ListVo> lList = listDao.getList(keyword);
		
		return lList;
	}
}
