package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;

@Repository
public class BoardDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
		
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//리스트 불러오기 + 검색(페이징)
	public List<BoardVo> board(int startRnum, int endRnum) {
		
		System.out.println("BoardDao > board");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<BoardVo> boardList = sqlSession.selectList("board.board", map);
		
		System.out.println(boardList);
		
		return boardList;
		
	}
	
	//전체 글갯수
	public int selectTotalCnt() {
		
		System.out.println("BoardDao > selectTotalCnt");
	      
		int totalCount = sqlSession.selectOne("board.selectTotalCnt");
		
		System.out.println(totalCount);
	      
		return totalCount;
	      
	}

}
