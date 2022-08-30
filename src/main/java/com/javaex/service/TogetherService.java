package com.javaex.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.EventCommentDao;
import com.javaex.dao.EventDao;
import com.javaex.dao.EventJoinedDao;
import com.javaex.dao.EventTaggedDao;
import com.javaex.dao.PointDao;
import com.javaex.dao.UserDao;
import com.javaex.utl.LocalApiComponent;
import com.javaex.vo.CourseVo;
import com.javaex.vo.EventCommentVo;
import com.javaex.vo.EventVo;
import com.javaex.vo.PointVo;

@Service
public class TogetherService {
	
	//필드
	@Autowired
	private EventDao eventDao;
	@Autowired
	private CourseDao coDao;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private EventJoinedDao eventJoinedDao;
	@Autowired
	private EventCommentDao eventCommentDao;
	@Autowired
	private LocalApiComponent localApiComponent;
	@Autowired
	private EventTaggedDao eventTaggedDao;
	
	//생성자
	
	
	//메소드-gs
	
	
	//메소드-일반
	//함꼐하기 리스트 + 페이징
	public Map<String, Object> together(int crtPage, int userNo) {
		
		System.out.println("TogetherService > together");
		
		//////////////////////////////////////////////
		//                 리스트 가져오기               //
		//////////////////////////////////////////////
		
		//페이지당 글 갯수
		int listCnt = 15;
		
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
		
		List<Map<String, Object>> togetherList = eventDao.together(startRnum, endRnum, userNo);
		
		//반복문으로 좌표 이용해서 위치 가져오기
		for(int i=0; i<togetherList.size(); i++) {
			
			double x1 = ((BigDecimal)togetherList.get(i).get("X1")).doubleValue();
			double y1 = ((BigDecimal)togetherList.get(i).get("Y1")).doubleValue();
			
			String START = localApiComponent.getLocation(x1, y1);
			togetherList.get(i).put("START", START);
			
			double x2 = ((BigDecimal)togetherList.get(i).get("X2")).doubleValue();
			double y2 = ((BigDecimal)togetherList.get(i).get("Y2")).doubleValue();
			
			String END = localApiComponent.getLocation(x2, y2);
			togetherList.get(i).put("END", END);
			
		}
		
		//System.out.println(togetherList);
		
		//////////////////////////////////////////////
		//                  페이징 계산                 //
		//////////////////////////////////////////////
		
		//전체 글갯수
		int totalCnt = eventDao.selectTotalCnt();
		System.out.println("service 글갯수 = " + totalCnt);
		
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
		
		Map<String, String> courseCate = new HashMap<String, String>();
		courseCate.put("walk", "산책");
		courseCate.put("jogging", "조깅");
		courseCate.put("running", "러닝");
		courseCate.put("marathon", "마라톤");
		courseCate.put("draw", "그림");
		
		Map<String, Object> xMap = new HashMap<String, Object>();
		xMap.put("togetherList", togetherList);
		xMap.put("prev", prev);
		xMap.put("next", next);
		xMap.put("endPageBtnNo", endPageBtnNo);
		xMap.put("startPageBtnNo", startPageBtnNo);
		xMap.put("courseCate", courseCate);
		xMap.put("userNo", userNo);
		
		
		return xMap;
		
	}
	
	//글쓰기
	public int write(List<Double> xList, List<Double> yList, int hour, int minute, CourseVo coVo, EventVo eventVo) {
		
		System.out.println("TogetherService > write");
		
		//줄바꿈
		eventVo.setContent(eventVo.getContent().replace("\n", "<br>"));
		
		//코스 시간 계산해서 Vo에 넣음
		coVo.setCourseTime((hour*60)+minute);
		System.out.println(coVo);
		
		//코스Vo db에 추가
		coDao.insertCourse(coVo);
		int courseNo = coVo.getCourseNo();
		
		//x, y값 리스트에서 하나씩 꺼내서 db에 추가
		for(int i=0; i<xList.size(); i++) {
			PointVo pointVo = new PointVo();
			pointVo.setCourseNo(courseNo);
			pointVo.setOrderNo(i);
			pointVo.setX(xList.get(i));
			pointVo.setY(yList.get(i));
			System.out.println("["+i+"]"+pointVo);
			pointDao.insertPoint(pointVo);
		}
		
		eventVo.setCourseNo(courseNo);	
		
			
		//이벤트 정보
		eventDao.write(eventVo);
		System.out.println(eventVo);
		
		
		//이벤트 참여
		int event = eventJoinedDao.join(eventVo);	
		
		return event;
		
	}
	
	//내용 읽기 + 조회수
	public Map<String, Object> read(int no) {
		
		System.out.println("TogetherService > read");
		
		//내용 읽기
		Map<String, Object> tMap = eventDao.read(no);
		
		//지명 가져오기
		double x1 = ((BigDecimal)tMap.get("X1")).doubleValue();
		double y1 = ((BigDecimal)tMap.get("Y1")).doubleValue();
		
		String START = localApiComponent.getLocation(x1, y1);
		tMap.put("START", START);
		
		double x2 = ((BigDecimal)tMap.get("X2")).doubleValue();
		double y2 = ((BigDecimal)tMap.get("Y2")).doubleValue();
		
		String END = localApiComponent.getLocation(x2, y2);
		tMap.put("END", END);
		
		//댓글
		List<EventCommentVo> eventCommentList = eventCommentDao.comment(no);
		
		tMap.put("eventCommentList", eventCommentList);
		
		System.out.println(no);
		System.out.println(tMap);
		
		return tMap;
	}
	
	//함께하기 지도 불러오기
	public List<PointVo> map(int no) {
		
		System.out.println("TogetherService > map");
		
		//코스 불러오기
		List<PointVo> getTogetherCourse = pointDao.getTogetherCourse(no);
		
		return getTogetherCourse;
		
	}
	
	//댓글 쓰기
	public int commentWrite(EventCommentVo eventCommentVo) {
		
		System.out.println("TogetherService > commentWrite");
		
		System.out.println(eventCommentVo);
		
		String content = eventCommentVo.getContent();
		
		if(content.charAt(0) == '@' && content.contains(" ")) {
			String mention = content.substring(1, content.indexOf(" "));
			
			int mentionUser = userDao.getUserNo(mention);
			
			if(mentionUser != 0) {
				eventCommentVo.setMentionUser(mentionUser);
				eventCommentVo.setContent(content.substring(content.indexOf(" ") + 1));
			}
		}
		
		return eventCommentDao.commentWrite(eventCommentVo);
	}
	
	//태그
	public int bookmark(Map<String, Object> map) {
		
		System.out.println("TogetherService > bookmark");

		if((boolean)map.get("tagged") == false) {
			return eventTaggedDao.bookmark(map);
		}else {
			return eventTaggedDao.bookmarkDelete(map);
		}
		
	}
	
	public int join(Map<String, Object> map) {
		System.out.println("TogetherService>join");
		
		int result = 0;
		
		EventVo eventVo = new EventVo();
		int userNo = (int)map.get("userNo");
		int eventNo = (int)map.get("eventNo");
		int count = (int)map.get("count");
		int joinMax = (int)map.get("joinMax");
		boolean joined = ((boolean)map.get("joined"));
		
		eventVo.setUserNo(userNo);
		eventVo.setEventNo(eventNo);
		
		if(joined == true) {
			eventJoinedDao.unjoin(eventVo);
			result = 2;
		} else if(count == joinMax) {
			result = -1;
		} else {
			result = eventJoinedDao.join(eventVo);
		}
		
		return result;
	}

}
