package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CourseDao;
import com.javaex.dao.FavoriteCourseDao;
import com.javaex.dao.LikedCourseDao;
import com.javaex.dao.PointDao;
import com.javaex.dao.RecordDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.CourseVo;
import com.javaex.vo.PointVo;
import com.javaex.vo.UserVo;

@Service
public class CourseService {

	@Autowired
	private CourseDao coDao;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private RecordDao recDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private LikedCourseDao likeDao;
	@Autowired
	private FavoriteCourseDao fcDao;

	
	
	//코스 좌표 가져오기
	public List<PointVo> getPoint(int courseNo) {
		System.out.println("CourseService->getPoint");
		return pointDao.getPoint(courseNo);
	}
	
	
	//코스 등록하기
	public int courseWrite(List<Double> xList, List<Double> yList, int hour, int minute, CourseVo coVo) {
		System.out.println("CourseService->courseWrite");
		
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
		
		return courseNo;
	}
	
	
	
	//종목 차트 데이터 가져오기
	public int[] getCateData(int courseNo) {
		System.out.println("CourseService->getCategory");
		
		int walk = recDao.getWalkCnt(courseNo);
		int jogging = recDao.getJogCnt(courseNo);
		int running = recDao.getRunCnt(courseNo);
		int marathon = recDao.getMaraCnt(courseNo);
		int bicycle = recDao.getBicCnt(courseNo);
		int draw = recDao.getDrawCnt(courseNo);
		
		int[] cateData = {walk, jogging, running, marathon, bicycle, draw};		
		
		return cateData;
	}
	
	//난이도 차트 데이터 가져오기
	public int[] getDiffiData(int courseNo) {
		System.out.println("CourseService->getDiffiData");
		
		int easy = recDao.getEasyCnt(courseNo);
		int normal = recDao.getNormalCnt(courseNo);
		int hard = recDao.getHardCnt(courseNo);
		
		int[] diffiData = {easy, normal, hard};
		
		return diffiData;
	}

	
	//(코스상세보기) 코스 정보 가져오기
	public Map<String, Object> getCourseInfo(int courseNo, int userNo) {
		System.out.println("CourseService->getCourseInfo");
		
		CourseVo coVo = coDao.selectCourse(courseNo); //코스정보
		UserVo userVo = userDao.getUserName(coVo.getUserNo()); //유저이름
		int recCnt = recDao.getRecCnt(courseNo); //총 기록수
		int likeCnt = likeDao.getLikeCnt(courseNo);//좋아요 갯수
		
		//좋아요, 즐겨찾기 여부
		String liked = "heart-off";
		String star = "star-off";
		if(userNo != 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("courseNo", courseNo);
			map.put("userNo", userNo);
			
			if(likeDao.getLiked(map) > 0) {
				liked = "heart";
			}
			
			if(fcDao.getFavChk(map) > 0) {
				star = "star";
			}

		}
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("coVo", coVo); //코스정보
		coMap.put("userName", userVo.getName()); //유저이름
		coMap.put("recCnt", recCnt); //총 기록수
		coMap.put("likeCnt", likeCnt); //좋아요 갯수
		coMap.put("liked", liked); //좋아요 여부
		coMap.put("star", star); //즐겨찾기 여부
		return coMap;
	}
	
	
	//코스 제목 수정
	public String modifyTitle(String title, int courseNo) {
		System.out.println("CourseService->modifyTitle");
		CourseVo coVo = new CourseVo();
		coVo.setTitle(title);
		coVo.setCourseNo(courseNo);
		int count = coDao.updateTitle(coVo);
		if(count > 0) {
			return "success";
		}
		
		return "fail";
	}
	
	
	//코스 공개설정 수정
	public String modifyOpen(String openStatus, int courseNo) {
		System.out.println("CourseService->modifyOpen");
		CourseVo coVo = new CourseVo();
		coVo.setOpenStatus(openStatus);
		coVo.setCourseNo(courseNo);
		int count = coDao.updateOpenStatus(coVo);
		if(count > 0) {
			return "success";
		}
		
		return "fail";
	}

	
	//좋아요 버튼 클릭
	public Map<String, Object> likeBtnClick(int courseNo, int userNo) {
		System.out.println("CourseService->getCourseInfo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("userNo", userNo);
		
		System.out.println(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//좋아요가 있는지 확인
		int count = likeDao.getLiked(map);
		
		if(count == 0) {
			likeDao.insertLiked(map); //추가
			resultMap.put("heart", "heart");
		} else {
			likeDao.deleteLiked(map); //삭제
			resultMap.put("heart", "heart-off");
		}
		
		int cnt = likeDao.getLikeCnt(courseNo);//좋아요 갯수
		resultMap.put("cnt", cnt);
		
		return resultMap;
	}


	




	
}
