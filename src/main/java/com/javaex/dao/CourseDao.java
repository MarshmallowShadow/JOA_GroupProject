package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CourseVo;

@Repository
public class CourseDao {
	
	@Autowired
	private SqlSession sqlSession;
	

	//코스 추가
	public int insertCourse(CourseVo coVo) {
		System.out.println("CourseDao->insertCourse");
		return sqlSession.insert("course.insert", coVo);		
	}
	

	//코스 가져오기
	public CourseVo selectCourse(int courseNo) {
		System.out.println("CourseDao->selectCourse");
		return sqlSession.selectOne("course.selectCourse", courseNo);
	}


	//(코스상세보기) 기록작성자 번호 가져오기
	public int getCoUserNo(int courseNo) {
		System.out.println("CourseDao->getCoUserNo");
		return sqlSession.selectOne("course.getUserNo", courseNo);
	}
	
	
	//코스 제목 수정
	public int updateTitle(CourseVo coVo) {
		System.out.println("CourseDao->updateTitle");
		return sqlSession.update("course.updateTitle", coVo);
	}
	
	//코스 공개설정 수정
	public int updateOpenStatus(CourseVo coVo) {
		System.out.println("CourseDao->updateOpenStatus");
		return sqlSession.update("course.updateOpen", coVo);
	}
	
	//베스트
	public List<Map<String,Object>> getBest(Map<String, String> map){
		System.out.println("CourseDao>getBest");
		return sqlSession.selectList("course.getBest", map);
	}
	
	//지역별 검색
	public List<Map<String, Object>> locationList(Map<String, Object> kMap){
		System.out.println("CourseDao>locationList");
		
		return sqlSession.selectList("course.locationList", kMap);
	}
	
	//키워드별 검색
	public List<Map<String, Object>> titleList(Map<String, Object> kMap){
		System.out.println("CourseDao>titleList");
		return sqlSession.selectList("course.titleList", kMap);
	}

	
}
