package com.javaex.api.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVo;
import com.javaex.vo.CourseVo;
import com.javaex.vo.EventVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/apiBoard")
public class ApiBoardController {
	
	//필드
	@Autowired
	private BoardService boardService;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//게시판 글쓰기
	@ResponseBody
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public int write(@RequestBody BoardVo boardVo, HttpSession session) {
		
		System.out.println("ApiBoardController > write");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		boardVo.setUserNo(authUser.getUserNo());
		
		System.out.println(authUser.getUserNo());
		
		//줄바꿈
		boardVo.setContent(boardVo.getContent().replace("\n", "<br>"));
		
		boardService.write(boardVo);
		
		return boardVo.getBoardNo();
		
	}
	
	//게시판 사진 등록
	@ResponseBody
	@RequestMapping(value = "/boardImgWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardImgWrite(@RequestPart(value = "file", required = false) List<MultipartFile> fileList
							  	, @RequestParam(value = "boardNo", required = false) int boardNo) {
		
		System.out.println("ApiBoardController > boardImgWrite");
		
		return boardService.boardImgWrite(fileList, boardNo);
		
	}
	
	//모달 코스 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getCourseList", method= {RequestMethod.GET, RequestMethod.POST})
	public List<CourseVo> getCourseList(@RequestBody int cateNo){
		System.out.println("apiBoardController>getCourseList");
		
		List<CourseVo> cList = boardService.getCourseList(cateNo);
		
		return cList;
	}
	
	//함께하기 모달 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getEventList", method= {RequestMethod.GET, RequestMethod.POST})
	public List<EventVo> getEventList(@RequestParam("filCate") int filCate, @RequestParam("userNo") int userNo){
		System.out.println("apiBoardController>getCourseList");
		
		System.out.println(filCate);
		System.out.println(userNo);
		
		List<EventVo> eList = boardService.getEventList(filCate, userNo);
		
		return eList;
	}

}
