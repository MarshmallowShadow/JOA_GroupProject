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
	//페이징 (페이징 + 검색) 
	// crtPage : 현재페이지
	public Map<String, Object> getListPage(int crtPage) {
		System.out.println("ListService>page");
		
		//////////////////////////////////////////////
		// 리스트 가져오기
		//////////////////////////////////////////////

		// 페이지당 글 개수(총 10페이지 기준)		
		int listCnt = 10;
		
		// 현재 페이지(crtPage) -> 페이지가 -1 페이지 될 수 없음 (즉 0보다 작으면 무조건 1페이지로 돌아가라~)
		// 아래와 같은 코드 => if(crtPage>0) { }else{crtPage=1;}
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
		
		// 시작글 번호 ->(listCnt)에 따라 startRnum가 변함
		int startRnum = (crtPage - 1) * listCnt + 1;
		
		// 마지막글 번호
		int endRnum = (startRnum + listCnt) - 1;		
		
		System.out.println(listCnt);
		
		return null;
		//return pMap;
	}
	
	//삭제
	public int delete(int no) {
		System.out.println("ListService>delete");
		
		int count = listDao.delete(no);
		
		return count;
	}
	
	//조회수 (hitUpdate)
	/*public int hitUpdate(int no) {
		System.out.println("ListService>hitUpdate");
		
		int count = listDao.hitUpdate(no);
		
		return count;
	}*/
	
	
	//읽기 (한 명 정보 가져오기)
	public Map<String, Object> getList(int no) {
		System.out.println("ListService>read");
		
		Map<String, Object> rMap = listDao.getList(no);
		//System.out.println(rMap);
		
		return rMap;
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
