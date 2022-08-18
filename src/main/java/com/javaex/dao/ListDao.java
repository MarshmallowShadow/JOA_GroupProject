package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ListVo;

@Repository
public class ListDao {

	//필드
	@Autowired
	SqlSession sqlSession;
	
	//생성자
	
	//메소드
	
	//메소드 일반
	
	//읽기 (한 명 정보 가져오기)
	public ListVo getList(int no) {
		System.out.println("ListDao>read");
		
		ListVo lVo = sqlSession.selectOne("list.getList", no);
		
		return lVo;
	}
	
	
	//글쓰기 등록
	public int write(ListVo listVo) {
		System.out.println("ListDao>write");
		
		int count = sqlSession.insert("list.listWrite", listVo);
		
		return count;
	}
	
	
	//리스트 출력
	public List<ListVo> getList(String keyword) {
		System.out.println("ListDao>getlist");
		
		List<ListVo> lList = sqlSession.selectList("list.selectList",keyword);
		System.out.println(lList);
		return lList;
	}
}