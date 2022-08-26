package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.EventVo;

@Repository
public class EventDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
	
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//리스트 불러오기 + 페이징
	public List<Map<String, Object>> together(int startRnum, int endRnum, int userNo) {
		
		System.out.println("EventDao > together");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		map.put("userNo", userNo);
		
		List<Map<String, Object>> togetherList = sqlSession.selectList("together.together", map);
		
		System.out.println(togetherList);
		
		return togetherList;
		
	}
	
	//전체 글갯수
	public int selectTotalCnt() {
		
		System.out.println("EventDao > selectTotalCnt");
	      
		int totalCount = sqlSession.selectOne("together.selectTotalCnt");
		
		System.out.println(totalCount);
	      
		return totalCount;
	      
	}
	
	//전체 글갯수
	public int write(EventVo eventVo) {
		
		System.out.println("EventDao > write");
	      
		return sqlSession.insert("together.write", eventVo);
	      
	}
	
	//내용 읽기
	public Map<String, Object> read(int no) {
		
		System.out.println("EventDao > read");
		
		Map<String, Object> tMap = sqlSession.selectOne("together.read", no);
		
		return tMap;
		
	}

}
