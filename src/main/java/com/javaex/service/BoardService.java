package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BoardCommentDao;
import com.javaex.dao.BoardDao;
import com.javaex.dao.BoardImgDao;
import com.javaex.dao.EventDao;
import com.javaex.dao.MyFavoriteDao;
import com.javaex.dao.UserDao;
import com.javaex.utl.LocalApiComponent;
import com.javaex.vo.BoardCommentVo;
import com.javaex.vo.BoardImgVo;
import com.javaex.vo.BoardVo;
import com.javaex.vo.CourseVo;
import com.javaex.vo.EventVo;
import com.javaex.vo.FavoriteCategoryVo;

@Service
public class BoardService {
	
	//필드
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardCommentDao boardCommentDao;
	@Autowired
	private LocalApiComponent localApiComponent;
	@Autowired
	private BoardImgDao boardImgDao;
	@Autowired
	private MyFavoriteDao myFavoriteDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private EventDao eventDao;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//게시판 리스트 + 페이징 + 검색
	public Map<String, Object> board(String boardCategory, String keyword, int crtPage) {
		
		System.out.println("BoardService > board");
		
		//////////////////////////////////////////////
		//                 리스트 가져오기               //
		//////////////////////////////////////////////
		
		//페이지당 글 갯수
		int listCnt = 10;
		
		//현재 페이지
		//             조건문       true일 때 : false일 때
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
		
		/*
		if(crtPage>0) {
			
		}else {
			crtPage = 1;
		}
		*/
		
		//시작글 번호
		int startRnum = (crtPage-1)*listCnt + 1;
		
		//끝글 번호
		int endRnum = (startRnum + listCnt) - 1;
		
		//System.out.println("글갯수" + listCnt + ",페이지" + crtPage + ",시작글" + startRnum + ",끝글" + endRnum);
		if(boardCategory == null) {
			boardCategory = "";
		}
		
		if(keyword == null) {	
			keyword = "";
		}
		
		boardCategory = "%" + boardCategory + "%";
		keyword = "%" + keyword + "%";
		
		System.out.println(boardCategory);
		
		List<BoardVo> boardList = boardDao.board(boardCategory, keyword, startRnum, endRnum);
		
		//System.out.println(boardList);
		
		//////////////////////////////////////////////
		//                  페이징 계산                 //
		//////////////////////////////////////////////
		
		//전체 글갯수
		int totalCnt = boardDao.selectTotalCnt(boardCategory, keyword);
		System.out.println("service = " + totalCnt);
		
		//페이지당 버튼 갯수
		int pageBtnCount = 10;
		
		//마지막 버튼 번호
		int endPageBtnNo = (int)Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
		
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo-pageBtnCount)+1;
		
		//다음 페이지 화살표 유무
		boolean next = false;
		
		if((listCnt*endPageBtnNo) < totalCnt) {
			next = true;
		}else {
			endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
		}
		
		//이전 페이지 화살표 유무
		boolean prev = false;
		
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		System.out.println("페이지" + crtPage + ", 시작 버튼 번호" + startPageBtnNo + ", 마지막 버튼 번호" + endPageBtnNo + ", 이전" + prev + ", 다음" + next);
		
		Map<String, String> categoryMap = new HashMap<String, String>();
		categoryMap.put("commute", "소통");
		categoryMap.put("question", "질문");
		categoryMap.put("post", "후기");
		categoryMap.put("together", "함께");
		categoryMap.put("map", "코스");
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("boardList", boardList);
		pMap.put("prev", prev);
		pMap.put("next", next);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("categoryMap", categoryMap);
		
		return pMap;
		
	}
	
	//게시판 글쓰기
	public int write(BoardVo boardVo) {
		
		System.out.println("BoardService > write");
		
		//줄바꿈
		boardVo.setContent(boardVo.getContent().replace("\n", "<br>"));
		
		int count = boardDao.write(boardVo);

		int no = boardVo.getBoardNo();
		
		System.out.println(no);
		
		return no;
		
	}
	
	//코스기록 이미지 등록
	public String boardImgWrite(List<MultipartFile> fileList, int boardNo) {
		
		System.out.println("boardImgWrite > boardImgWrite");
		
		String saveDir = "C:\\javaStudy\\upload";
		
		//이미지 번호가 있는지 찾음
		int index = 0;
		
		for(MultipartFile file : fileList) {
			
			if(file.getSize() > 0) {
				
				//오리지널 파일명
				String orgName = file.getOriginalFilename();
				
				//확장자
				String exName = orgName.substring(orgName.lastIndexOf("."));
				
				//현재시간 + 랜덤UUID + 확장자
				String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
				
				//파일경로(디렉토리 + 저장파일명)
				String filePath = saveDir + "\\" + saveName;
				
				//DB 저장
				BoardImgVo boardImgVo = new BoardImgVo();
				boardImgVo.setBoardNo(boardNo);
				boardImgVo.setSaveName(saveName);
				boardImgVo.setFilePath("/upload/" + saveName);
				boardImgVo.setOrderNo(index);
				
				System.out.println(boardImgVo);
				boardImgDao.boardImg(boardImgVo);
				
				//파일 저장
				try {
					
					byte[] fileData = file.getBytes();
					OutputStream os = new FileOutputStream(filePath);
					BufferedOutputStream bos = new BufferedOutputStream(os);
					
					bos.write(fileData);
					bos.close();
					
					
				} catch (IOException e) {
					e.printStackTrace();
					return "false";
				}
			}
			
			index++;
		}
		
		return "success";
		
	}
	
	//게시판 내용 읽기 + 조회수
	public Map<String, Object> read(int no) {
		
		System.out.println("BoardService > read");
		
		//조회수 올리기
		boardDao.boardHit(no);
		
		//게시판 항목 해석
		Map<String, String> categoryMap = new HashMap<String, String>();
		categoryMap.put("commute", "소통");
		categoryMap.put("question", "질문");
		categoryMap.put("post", "후기");
		categoryMap.put("together", "함께");
		categoryMap.put("map", "코스");
		
		//게시판 코스 종목 해석
		Map<String, String> courseCateMap = new HashMap<String, String>();
		courseCateMap.put("walk", "산책");
		courseCateMap.put("jogging", "조깅");
		courseCateMap.put("bike", "자전거");
		courseCateMap.put("running", "러닝");
		courseCateMap.put("marathon", "마라톤");
		courseCateMap.put("draw", "그림");
		
		//게시판 코스 난이도 해석
		Map<String, String> courseDifiMap = new HashMap<String, String>();
		courseDifiMap.put("easy", "쉬움");
		courseDifiMap.put("normal", "보통");
		courseDifiMap.put("hard", "어려움");
		
		//게시판 내용 읽기
		Map<String, Object> bMap = boardDao.read(no);
		
		Integer eventNo = (Integer)bMap.get("eventNo");
		
		//지명 가져오기
		Map<String, String> mapName = new HashMap<String, String>();
		
		if(eventNo != null) {
			double x1 = ((BigDecimal)bMap.get("X1")).doubleValue();
			double y1 = ((BigDecimal)bMap.get("Y1")).doubleValue();
			
			String START = localApiComponent.getLocation(x1, y1);
			mapName.put("START", START);
			
			double x2 = ((BigDecimal)bMap.get("X2")).doubleValue();
			double y2 = ((BigDecimal)bMap.get("Y2")).doubleValue();
			
			String END = localApiComponent.getLocation(x2, y2);
			mapName.put("END", END);
		}
		
		System.out.println("c"+mapName);
		
		//댓글
		List<BoardCommentVo> boardCommentList = boardCommentDao.comment(no);
		
		//사진
		List<BoardImgVo> imgList = boardImgDao.getImage(no);
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("bMap", bMap);
		rMap.put("categoryMap", categoryMap);
		rMap.put("boardCommentList", boardCommentList);
		rMap.put("imgList", imgList);
		rMap.put("courseCateMap", courseCateMap);
		rMap.put("courseDifiMap", courseDifiMap);
		rMap.put("mapName", mapName);
		
		System.out.println(rMap);
		
		return rMap;
	}
	
	//댓글 쓰기
	public int commentWrite(BoardCommentVo boardCommentVo) {
		
		System.out.println("BoardService > commentWrite");
		
		System.out.println(boardCommentVo);
		
		String content = boardCommentVo.getContent();
		
		if(content.charAt(0) == '@' && content.contains(" ")) {
			String mention = content.substring(1, content.indexOf(" "));
			
			Integer mentionUser = userDao.getUserNo(mention);
			
			if(mentionUser != null) {
				boardCommentVo.setMentionUser(mentionUser);
				boardCommentVo.setContent(content.substring(content.indexOf(" ") + 1));
			}
		}
		
		return boardCommentDao.commentWrite(boardCommentVo);
		
	}
	
	//게시판 글쓰기에 코스 즐겨찾기 목록 가져오기
	public Map<String, Object> getInfo(int userNo, int filCate) {
		
		System.out.println("BoardService > favorite");
		
		Map<String, Object> pMap = new HashMap<>();
		
		List<FavoriteCategoryVo> fList = myFavoriteDao.getFavList(userNo);
		pMap.put("fList", fList);
		
		if(fList.size() > 0) {
			
			int cateNo = fList.get(0).getCateNo();
			
			List<CourseVo> cList = myFavoriteDao.getCourses(cateNo);
			pMap.put("cList", cList);
			
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("filCate", filCate);
		
		List<EventVo> eList = eventDao.getEvents(map);
		pMap.put("eList", eList);
		
		System.out.println(eList);
		
		return pMap;
		
	}
	
	
	//게시판 글쓰기 코스 리스트 가져오기
	public List<CourseVo> getCourseList(int cateNo){
		
		System.out.println("BoardService > getCourseList");
		
		return myFavoriteDao.getCourses(cateNo);
		
	}
	
	//게시판 글쓰기 함께하기 리스트 가져오기
	public List<EventVo> getEventList(int filCate, int userNo) {
		
		System.out.println("BoardService > getCourseList");
		
		Map<String, Integer> map = new HashMap<>();
		map.put("filCate", filCate);
		map.put("userNo", userNo);
		
		return eventDao.getEvents(map);
	}
	
	//게시판 삭제
	public int delete(int no) {
		
		System.out.println("BoardService > delete");
		
		return  boardDao.delete(no);
		
	}

}
