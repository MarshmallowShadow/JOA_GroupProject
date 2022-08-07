package com.javaex.dao;

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


	//(기록등록) 코스 가져오기
	public CourseVo selectCourse(int courseNo) {
		System.out.println("CourseDao->selectCourse");
		return sqlSession.selectOne("course.selectCourse", courseNo);
	}

}
