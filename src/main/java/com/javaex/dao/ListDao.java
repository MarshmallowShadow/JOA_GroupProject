package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//수정
	public int modify(ListVo listVo) {
		System.out.println("ListService>modify");
		
		int count = sqlSession.update("list.modify",listVo);
		
		return count;
	}

	//수정폼 정보 불러오기
	public ListVo getModify(int no) {
		System.out.println("ListDao>getList");
		
		ListVo lVo = sqlSession.selectOne("list.getList2",no);
		
		return lVo;
	}
	
	//페이징 (페이징 + 검색) 
	public List<ListVo> getListPage(int startRnum, int endRnum, String keyword, String boardCategory){
		System.out.println("ListDao>List/Page/Search");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		map.put("keyword", keyword);
		map.put("boardCategory", boardCategory);
		//System.out.println(map);
		
		List<ListVo> lList = sqlSession.selectList("list.getListPage", map);
		//System.out.println(lList);
		
		return lList;
	}
	
	
	// 전체글 갯수
	public int selectTotalCnt(String keyword, String boardCategory) {
		System.out.println("ListDao>selectTotalCnt");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("boardCategory", boardCategory);
		
		int totalCnt = sqlSession.selectOne("list.selectTotalCnt", map);
		
		return totalCnt;
		
	}
	
	
	//삭제
	public int delete(int no) {
		System.out.println("ListDao>delete");
		
		int count = sqlSession.delete("list.listDelete",no);
		
		return count;
	}
	
	
	//조회수 (view_counts)
	public int hitUpdate(int no) {
		System.out.println("ListDao>view_counts");
		
		int count = sqlSession.update("list.hitUpdate", no);
		
		return count;
	}	
	
	
	//읽기 (한 명 정보 가져오기)
	public Map<String,Object> getList(int no) {
		System.out.println("ListDao>read");
		
		return sqlSession.selectOne("list.getList", no);
	}
	
	
	//글쓰기 등록
	public int write(ListVo listVo) {
		System.out.println("ListDao>write");
		
		int count = sqlSession.insert("list.listWrite", listVo);
		
		return count;
	}
}