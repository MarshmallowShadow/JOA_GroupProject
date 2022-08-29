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

	//(코스상세보기) 기록수 가져오기
	public int getRecCnt(int courseNo) {
		//System.out.println("RecordDao->getRecCnt");
		return sqlSession.selectOne("record.recCnt", courseNo);
	}
	
	//(기록상세보기) 기록 리스트 가져오기
	public List<Map<String, Object>> getRecordList(Map<String, Object> map) {
		System.out.println("RecordDao->getRecordList");
		return sqlSession.selectList("record.getRecList", map);
	}
	
	//(기록수정) 기록 가져오기
	public RecordVo getRecord(int recordNo) {
		System.out.println("RecordDao->getRecord");
		return sqlSession.selectOne("record.getRec", recordNo);
	}
	
	//기록 수정하기
	public int updateRecord(RecordVo recVo) {
		System.out.println("RecordDao->updateRecord");
		return sqlSession.update("record.update", recVo);
	}
	
	//종목 차트 데이터 가져오기
	public List<Map<String, Object>> getCateCnt(int courseNo) {
		System.out.println("RecordDao->getCateCnt");
		return sqlSession.selectList("record.getCateCnt", courseNo);
	}
	
	//난이도 차트 데이터 가져오기
	public List<Map<String, Object>> getDiffiCnt(int courseNo) {
		System.out.println("RecordDao->getDiffiCnt");
		return sqlSession.selectList("record.getDiffiCnt", courseNo);
	}
	

	//////////////////////////////////////// 수빈 ////////////////////////////////////////
	//기록 가져오기
	public List<String> getBestRecord(int course_no) {
		System.out.println("getBestRecord");
		return sqlSession.selectList("record.getBestRecord", course_no);
	}
}
