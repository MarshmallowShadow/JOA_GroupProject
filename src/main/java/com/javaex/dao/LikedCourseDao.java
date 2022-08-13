package com.javaex.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikedCourseDao {

	@Autowired
	private SqlSession sqlSession;

	
	//(코스상세보기) 코스 좋아요 갯수 가져오기
	public int getLikeCnt(int courseNo) {
		System.out.println("LikedCourseDao->getLikeCnt");
		return sqlSession.selectOne("liked.getLikeCnt", courseNo);
	}

	//(코스상세보기) 좋아요 여부 가져오기
	public int getLiked(Map<String, Object> map) {
		System.out.println("LikedCourseDao->getLiked");
		return sqlSession.selectOne("liked.getLiked", map);
	}

	//(코스상세보기) 좋아요 추가
	public int insertLiked(Map<String, Object> map) {
		System.out.println("LikedCourseDao->insertLiked");
		return sqlSession.insert("liked.insert", map);
	}

	//(코스상세보기) 좋아요 삭제
	public int deleteLiked(Map<String, Object> map) {
		System.out.println("LikedCourseDao->deleteLiked");
		return sqlSession.delete("liked.delete", map);
	}
}
