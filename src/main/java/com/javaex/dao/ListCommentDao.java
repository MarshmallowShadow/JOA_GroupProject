package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ListCommentVo;

@Repository
public class ListCommentDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
	
	//생성자
	
	//메소드
	
	//메소드 일반
	
	
	/***************** 댓글 기능 ****************/
	//댓글 쓰기
	public int commentWrite(ListCommentVo listCommentVo) {
		System.out.println("ListCommentDao>commentWrite");
		
		int count = sqlSession.insert("listComment.listcomment",listCommentVo);
		
		return count;
	}
	
	public List<ListCommentVo> getComment(int no) {
		System.out.println("ListDao>getComment");
		
		return sqlSession.selectList("listComment.selectComment", no);
	}

}
