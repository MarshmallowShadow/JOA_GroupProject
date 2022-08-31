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
	private SqlSession sqlSession;
		
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//리스트 불러오기 + 페이징
	public List<BoardVo> board(String boardCategory, String keyword, int startRnum, int endRnum) {
		
		System.out.println("BoardDao > board");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		map.put("keyword", keyword);
		map.put("boardCategory", boardCategory);
		
		List<BoardVo> boardList = sqlSession.selectList("board.board", map);
		
		System.out.println(boardList);
		
		return boardList;
		
	}
	
	//전체 글갯수
	public int selectTotalCnt(String boardCategory, String keyword) {
		
		System.out.println("BoardDao > selectTotalCnt");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCategory", boardCategory);
		map.put("keyword", keyword);
	      
		return sqlSession.selectOne("board.selectTotalCnt", map);
	      
	}
	
	//게시판 글쓰기
	public int write(BoardVo boardVo) {
		
		System.out.println("BoardDao > write");
		
		System.out.println(boardVo);
		
		return	sqlSession.insert("board.insertAll", boardVo);
		
	}
	
	//게시판 내용 읽기
	public Map<String, Object> read(int no) {
		
		System.out.println("BoardDao > read");
		
		Map<String, Object> rMap = sqlSession.selectOne("board.read", no);
		
		return rMap;
		
	}
	
	//게시판 조회수
	public int boardHit(int no) {
		
		System.out.println("BoardDao > boardHit");
		
		return sqlSession.update("board.boardHit", no);
		
	}

}
