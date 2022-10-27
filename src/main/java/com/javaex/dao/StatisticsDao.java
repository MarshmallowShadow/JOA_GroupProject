package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDao {

	@Autowired
	SqlSession sqlSession;
	
	//기록 통계 가져오기
	public List<Map<String, Object>> getStat(Map<String, Object> map) {
		return sqlSession.selectList("record.getStat", map);
	}
}
