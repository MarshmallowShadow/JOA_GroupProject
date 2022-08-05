package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PointVo;

@Repository
public class PointDao {

	@Autowired
	SqlSession sqlSession;

	
	//코스 좌표 추가
	public int insertPoint(PointVo pointVo) {
		System.out.println("PointDao->insertPoint");
		return sqlSession.insert("point.insert", pointVo);
	}
	
	
	
}
