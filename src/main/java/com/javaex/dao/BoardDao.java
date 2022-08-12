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
	//리스트 불러오기 + 페이징
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
	
	//검색
	public List<Map<String, Object>> getList(String keyword) {
		
		System.out.println("BoardDao > getList");
		
		if(keyword == null) {
			keyword = "";
		}
		
		keyword = "%" + keyword + "%";
		List<Map<String, Object>> bList = sqlSession.selectList("board.getList", keyword);
		
		System.out.println(bList);
		
		return bList;
		
	}
	
	//게시판 글쓰기
	public int write(BoardVo boardVo) {
		
		System.out.println("BoardDao > write");
		
		int all = boardVo.getCourseNo() + boardVo.getEventNo();
		int course = boardVo.getCourseNo();
		int together = boardVo.getEventNo();
		
		if(all > '0') {
			sqlSession.insert("board.insertAll", boardVo);
		}else if(together =='0') {
			sqlSession.insert("board.insertTogether", boardVo);
		}else if(course == '0') {
			sqlSession.insert("board.insertCourse", boardVo);
		}
		
		int count = sqlSession.insert("board.insertBoth", boardVo);
		
		return count;
		
	}

}
