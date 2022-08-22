package com.javaex.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.EventVo;

@Repository
public class TogetherDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
		
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//리스트 불러오기 + 페이징
	public List<EventVo> together(int startRnum, int endRnum) {
		
		System.out.println("TogetherDao > together");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<EventVo> togetherList = sqlSession.selectList("together.together", map);
		
		System.out.println(togetherList);
		
		return togetherList;
		
	}
	
	//전체 글갯수
	public int selectTotalCnt() {
		
		System.out.println("TogetherDao > selectTotalCnt");
	      
		int totalCount = sqlSession.selectOne("together.selectTotalCnt");
		
		System.out.println(totalCount);
	      
		return totalCount;
	      
	}
	
	//전체 글갯수
	public int write(EventVo eventVo) {
		
		System.out.println("TogetherDao > write");
	      
		return sqlSession.insert("together.write", eventVo);
	      
	}
	
	//내용 읽기
	public Map<String, Object> read(int no) {
		
		System.out.println("TogetherDao > read");
		
		Map<String, Object> tMap = sqlSession.selectOne("board.read", no);
		
		return tMap;
		
	}

}
