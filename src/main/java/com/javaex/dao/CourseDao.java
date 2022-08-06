package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CourseVo;

@Repository
public class CourseDao {
	
	@Autowired
	SqlSession sqlSession;
	

	//코스 추가
	public int insertCourse(CourseVo coVo) {
		System.out.println("CourseDao->insertCourse");
		return sqlSession.insert("course.insert", coVo);		
	}

}
