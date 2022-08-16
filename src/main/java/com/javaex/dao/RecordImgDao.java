package com.javaex.dao;

import java.util.List;
import java.util.Map;

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
	
	//(기록상세보기) 기록 이미지 가져오기
	public List<Map<String, Object>> getImg(Map<String, Object> map) {
		System.out.println("RecordDao->getImg");
		return sqlSession.selectList("recordimg.getImg", map);
	}
	
	//(기록수정) 기록 이미지 가져오기
	public List<RecordImgVo> getRecImg(int recordNo) {
		System.out.println("RecordDao->getRecImg");
		return sqlSession.selectList("recordimg.getRecImg", recordNo);
	}
}
