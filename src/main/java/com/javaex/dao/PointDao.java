package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PointVo;

@Repository
public class PointDao {

	@Autowired
	private SqlSession sqlSession;

	
	//코스 좌표 추가
	public int insertPoint(PointVo pointVo) {
		System.out.println("PointDao->insertPoint");
		return sqlSession.insert("point.insert", pointVo);
	}


	//(기록등록, 코스상세보기) 코스 좌표 가져오기
	public List<PointVo> getPoint(int courseNo) {
		System.out.println("PointDao->getPoint");
		return sqlSession.selectList("point.getPoint", courseNo);
	}
	
	
	
}
