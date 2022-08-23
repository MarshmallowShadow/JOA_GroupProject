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
	

	
	
	
//////차트 통계////////////////////////////////////////////////////////////////////////////////
	//종목-산책
	public int getWalkCnt(int courseNo) {
		System.out.println("RecordDao->getWalkCnt");
		Integer walk = sqlSession.selectOne("record.getWalkCnt", courseNo);
		if (walk == null) {
			return 0;
		} else {
			return walk;
		}
	}
	
	//종목-조깅
	public int getJogCnt(int courseNo) {
		System.out.println("RecordDao->getJogCnt");
		Integer jogging = sqlSession.selectOne("record.getJogCnt", courseNo);
		if (jogging == null) {
			return 0;
		} else {
			return jogging;
		}
	}
	
	//종목-러닝
	public int getRunCnt(int courseNo) {
		System.out.println("RecordDao->getRunCnt");
		Integer running = sqlSession.selectOne("record.getRunCnt", courseNo);
		if (running == null) {
			return 0;
		} else {
			return running;
		}
	}
	
	//종목-마라톤
	public int getMaraCnt(int courseNo) {
		System.out.println("RecordDao->getMaraCnt");
		Integer marathon = sqlSession.selectOne("record.getMaraCnt", courseNo);
		if (marathon == null) {
			return 0;
		} else {
			return marathon;
		}
	}
	
	//종목-자전거
	public int getBicCnt(int courseNo) {
		System.out.println("RecordDao->getBicCnt");
		Integer bicycle = sqlSession.selectOne("record.getBicCnt", courseNo);
		if (bicycle == null) {
			return 0;
		} else {
			return bicycle;
		}
	}
	
	//종목-그림
	public int getDrawCnt(int courseNo) {
		System.out.println("RecordDao->getDrawCnt");
		Integer draw = sqlSession.selectOne("record.getDrawCnt", courseNo);
		if (draw == null) {
			return 0;
		} else {
			return draw;
		}
	}
	
	//난이도-쉬움
	public int getEasyCnt(int courseNo) {
		System.out.println("RecordDao->getEasyCnt");
		Integer easy = sqlSession.selectOne("record.getEasyCnt", courseNo);
		if (easy == null) {
			return 0;
		} else {
			return easy;
		}
	}
	
	//난이도-보통
	public int getNormalCnt(int courseNo) {
		System.out.println("RecordDao->getNormalCnt");
		Integer normal = sqlSession.selectOne("record.getNormalCnt", courseNo);
		if (normal == null) {
			return 0;
		} else {
			return normal;
		}
	}
	
	//난이도-어려움
	public int getHardCnt(int courseNo) {
		System.out.println("RecordDao->getHardCnt");
		Integer hard = sqlSession.selectOne("record.getHardCnt", courseNo);
		if (hard == null) {
			return 0;
		} else {
			return hard;
		}
	}


	//////////////////////////////////////// 수빈 ////////////////////////////////////////
	//기록 가져오기
	public List<String> getBestRecord(int course_no) {
		System.out.println("getBestRecord");
		return sqlSession.selectList("record.getBestRecord", course_no);
	}
}
