package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.RecordVo;

@Repository
public class RecordDao {
	
	@Autowired
	private SqlSession sqlSession;
	

	//기록 추가하기
	public int insertRecord(RecordVo recVo) {
		System.out.println("RecordDao->insertRecord");
		return sqlSession.insert("record.insert", recVo);
	}

	//(이미지추가) 기록번호 가져오기
	public int getrecNo() {
		System.out.println("RecordDao->getrecNo");
		return sqlSession.selectOne("record.getrecNo");
	}

	//(코스상세보기) 기록수 가져오기
	public int getRecCnt(int courseNo) {
		System.out.println("RecordDao->getRecCnt");
		return sqlSession.selectOne("record.recCnt", courseNo);
	}

}
