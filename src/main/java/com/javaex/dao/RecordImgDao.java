package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.RecordImgVo;

@Repository
public class RecordImgDao {
	
	@Autowired
	private SqlSession sqlSession;

	//기록 이미지 추가
	public int insertImg(RecordImgVo imgVo) {
		System.out.println("RecordImgDao->insertImg");
		return sqlSession.insert("recordimg.insert", imgVo);
	}

}
