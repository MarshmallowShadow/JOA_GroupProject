package com.javaex.dao;

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
	
	//코스 제목 수정
	public int updateTitle(Map<String, Object> map) {
		System.out.println("CourseDao->updateTitle");
		return sqlSession.update("course.updateTitle", map);
	}


	//(기록등록, 코스상세보기) 코스 가져오기
	public CourseVo selectCourse(int courseNo) {
		System.out.println("CourseDao->selectCourse");
		return sqlSession.selectOne("course.selectCourse", courseNo);
	}


	//(코스상세보기) 기록작성자 번호 가져오기
	public int getCoUserNo(int courseNo) {
		System.out.println("CourseDao->getCoUserNo");
		return sqlSession.selectOne("course.getUserNo", courseNo);
	}


	

}
