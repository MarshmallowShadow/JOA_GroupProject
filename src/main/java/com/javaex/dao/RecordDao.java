package com.javaex.dao;

import java.util.List;
import java.util.Map;

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
	
	//(코스상세보기) 기록통계-종목 가져오기
	public List<Map<String, Object>> getCateCnt(int courseNo) {
		System.out.println("RecordDao->getCateCnt");
		 return sqlSession.selectList("record.getCateCnt", courseNo);
	}
	
	//(코스상세보기) 기록통계-난이도 가져오기
		public List<Map<String, Object>> getDiffiCnt(int courseNo) {
			System.out.println("RecordDao->getDiffiCnt");
			return sqlSession.selectList("record.getDiffiCnt", courseNo);
		}

}
