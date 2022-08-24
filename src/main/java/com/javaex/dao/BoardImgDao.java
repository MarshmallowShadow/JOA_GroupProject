package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardImgVo;

@Repository
public class BoardImgDao {
	
	//필드
	@Autowired
	SqlSession sqlSession;
		
	//생성자
	
	//메소드-gs
	
	
	//메소드-일반
	//이미지 추가
	public int boardImg(BoardImgVo boardImgVo) {
		
		System.out.println("BoardImgDao > boardImg");
		
		return sqlSession.insert("boardImg.insert", boardImgVo);
		
	}
	
	//이미지 가져오기
	public List<BoardImgVo> getImage(int boardNo) {
		
		System.out.println("BoardImgDao > getImage");
		
		List<BoardImgVo> imgList = sqlSession.selectList("boardImg.getImage", boardNo);
		
		return imgList;
		
	}

}
