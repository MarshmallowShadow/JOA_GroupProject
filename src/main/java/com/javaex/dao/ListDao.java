package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ListCommentVo;
import com.javaex.vo.ListVo;

@Repository
public class ListDao {

	//필드
	@Autowired
	SqlSession sqlSession;
	
	//생성자
	
	//메소드
	
	//메소드 일반
	
	/***************** 댓글 기능 ****************/
	//댓글 쓰기
	public int commentWrite(ListCommentVo listCommentVo) {
		System.out.println("ListService>commentWrite");
		
		int count = sqlSession.insert("list.listcomment",listCommentVo);
		
		return count;
	}
	/**********************************************************************************************************/
	
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
	
	//메소드 일반
	//조회수 (hitUpdate)
	/*public int hitUpdate(int no) {
		System.out.println("ListDao>hitUpdate");
		
		int count = sqlSession.update("list.hitUpdate", no);
		
		return count;
	}*/
	
	
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