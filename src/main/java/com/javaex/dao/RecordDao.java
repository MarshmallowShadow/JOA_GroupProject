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
	
//////차트 통계////////////////////////////////////////////////////////////////////////////////
	//종목-산책
	public int getWalkCnt(int courseNo) {
		System.out.println("RecordDao->getWalkCnt");
		return sqlSession.selectOne("record.getWalkCnt", courseNo);
	}
	
	//종목-조깅
	public int getJogCnt(int courseNo) {
		System.out.println("RecordDao->getJogCnt");
		return sqlSession.selectOne("record.getJogCnt", courseNo);
	}
	
	//종목-러닝
	public int getRunCnt(int courseNo) {
		System.out.println("RecordDao->getRunCnt");
		return sqlSession.selectOne("record.getRunCnt", courseNo);
	}
	
	//종목-마라톤
	public int getMaraCnt(int courseNo) {
		System.out.println("RecordDao->getMaraCnt");
		return sqlSession.selectOne("record.getMaraCnt", courseNo);
	}
	
	//종목-자전거
	public int getBicCnt(int courseNo) {
		System.out.println("RecordDao->getBicCnt");
		return sqlSession.selectOne("record.getBicCnt", courseNo);
	}
	
	//종목-그림
	public int getDrawCnt(int courseNo) {
		System.out.println("RecordDao->getDrawCnt");
		return sqlSession.selectOne("record.getDrawCnt", courseNo);
	}
	
	//난이도-쉬움
	public int getEasyCnt(int courseNo) {
		System.out.println("RecordDao->getEasyCnt");
		return sqlSession.selectOne("record.getEasyCnt", courseNo);
	}
	
	//난이도-보통
	public int getNormalCnt(int courseNo) {
		System.out.println("RecordDao->getNormalCnt");
		return sqlSession.selectOne("record.getNormalCnt", courseNo);
	}
	
	//난이도-어려움
	public int getHardCnt(int courseNo) {
		System.out.println("RecordDao->getHardCnt");
		return sqlSession.selectOne("record.getHardCnt", courseNo);
	}

}
