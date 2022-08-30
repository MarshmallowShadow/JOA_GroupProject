package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardCommentVo;
import com.javaex.vo.EventCommentVo;

@Repository
public class BoardCommentDao {
	
	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//댓글 쓰기
	public int commentWrite(BoardCommentVo boardCommentVo) {
		
		System.out.println("BoardCommentDao > commentWrite");
		
		return sqlSession.insert("boardComment.commentWrite", boardCommentVo);
		
	}
	
	//댓글 읽기
	public List<BoardCommentVo> comment(int no) {
		
		System.out.println("BoardCommentDao > comment");
		
		return sqlSession.selectList("boardComment.comment", no);
		
	}

}
