package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.EventCommentVo;

@Repository
public class EventCommentDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
	
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//댓글 쓰기
	public int commentWrite(EventCommentVo eventCommentVo) {
		
		System.out.println("EventCommentDao > commentWrite");
		
		return sqlSession.insert("eventComment.commentWrite", eventCommentVo);
		
	}
	
	//댓글 읽기
	public List<EventCommentVo> comment(int no) {
		
		System.out.println("EventCommentDao > comment");
		
		return sqlSession.selectList("eventComment.comment", no);
		
	}

}
