package com.javaex.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardCommentVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	//필드
	@Autowired
	private BoardService boardService;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//게시판 리스트
	@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
	public String board(Model model
						, @RequestParam(value="boardCategory", required=false, defaultValue="") String boardCategory
						, @RequestParam(value="keyword", required=false, defaultValue="")String keyword
						, @RequestParam(value="crtPage", required = false, defaultValue = "1")int crtPage) {
		
		System.out.println("BoardController > board");
		 
		Map<String, Object> pMap = boardService.board(boardCategory, keyword, crtPage);
		model.addAttribute("boardList", pMap.get("boardList"));
		model.addAttribute("prev", pMap.get("prev"));
		model.addAttribute("next", pMap.get("next"));
		model.addAttribute("startPageBtnNo", pMap.get("startPageBtnNo"));
		model.addAttribute("endPageBtnNo", pMap.get("endPageBtnNo"));
		model.addAttribute("categoryMap", pMap.get("categoryMap"));
		model.addAttribute("boardCategory", pMap.get("boardCategory"));
		
		return "board/board";
		
	}
	
	//게시판 글쓰기폼
	@RequestMapping(value="/writeform", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeform(HttpSession session, Model model
							, @RequestParam(value="filCate", required=false, defaultValue="1") int filCate) {
		
		 System.out.println("BoardController > writeform");
		 
		 UserVo authUser = (UserVo)session.getAttribute("authUser");
		 
		 int userNo = authUser.getUserNo();
		 
		 Map<String, Object> bMap =  boardService.getInfo(userNo, filCate);		 
		 model.addAttribute("fList", bMap.get("fList"));
		 model.addAttribute("cList", bMap.get("cList"));
		 model.addAttribute("eList", bMap.get("eList"));
		
		return "board/writeform";
		
	}
	
	//게시판 상세페이지 + 조회수
	@RequestMapping(value="/read/{no}", method= {RequestMethod.GET, RequestMethod.POST})
	public String read(Model model, @PathVariable int no) {
		
		System.out.println("BoardController > read");
				
		//내용 읽기
		Map<String, Object> rMap = boardService.read(no);
		model.addAttribute("bMap", rMap.get("bMap"));
		model.addAttribute("categoryMap", rMap.get("categoryMap"));
		model.addAttribute("boardCommentList", rMap.get("boardCommentList"));
		model.addAttribute("imgList", rMap.get("imgList"));
		model.addAttribute("courseCateMap", rMap.get("courseCateMap"));
		model.addAttribute("courseDifiMap", rMap.get("courseDifiMap"));
		
		System.out.println(rMap);
		
		return "board/read";
		
	}
	
	//댓글 쓰기
	@RequestMapping(value = "/comment", method = {RequestMethod.GET, RequestMethod.POST})
	public String comment(@ModelAttribute BoardCommentVo boardCommentVo, HttpSession session) {
		
		System.out.println("BoardController > comment");
		
		boardService.commentWrite(boardCommentVo);
		
		return "redirect:/board/read/" + boardCommentVo.getBoardNo();
		
	}
	
	//게시판 수정폼
	@RequestMapping(value="/modifyform", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyform() {
		
		System.out.println("BoardController > modifyform");
		
		return "board/modifyform";
		
	}

}
