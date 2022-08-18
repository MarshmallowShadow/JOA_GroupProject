package com.javaex.service;

import java.util.List;

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
	
	
	
	//읽기 (한 명 정보 가져오기)
	public ListVo getList(int no) {
		System.out.println("ListService>read");
		
		ListVo lVo = listDao.getList(no);
		
		return lVo;
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
