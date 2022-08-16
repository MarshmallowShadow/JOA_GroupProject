package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.CourseDao;
import com.javaex.dao.LikedCourseDao;
import com.javaex.dao.RecordDao;
import com.javaex.dao.RecordImgDao;
import com.javaex.vo.CourseVo;
import com.javaex.vo.RecordImgVo;
import com.javaex.vo.RecordVo;

@Service
public class RecordService {
	
	@Autowired
	private RecordDao recDao;
	@Autowired
	private CourseDao coDao;
	@Autowired
	private RecordImgDao imgDao;
	@Autowired
	private LikedCourseDao likeDao;

	
	//(기록등록) 코스 정보 가져오기
	public Map<String, Object> getCourseInfo(int courseNo) {
		System.out.println("RecordService->getCourseInfo");
		
		//코스 정보
		CourseVo coVo = coDao.selectCourse(courseNo);
		System.out.println(coVo);
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("coVo", coVo);

		return coMap;
	}
	
	
	//코스기록 등록하기
	public String recordWrite(RecordVo recVo) {
		System.out.println("RecordService->recordWrite");
		System.out.println(recVo);
		int count = recDao.insertRecord(recVo);
		if(count > 0) {
			return "success";
		} else {
			return "false";
		}
	}
	
	
	//코스기록 이미지 등록
	public String recordImgWrite(List<MultipartFile> fileList) {
		System.out.println("RecordService->recordImgWrite");
		
		String saveDir = "C:\\javaStudy\\upload";
		
		int index = 0;
		
		for(MultipartFile file : fileList) {
			
			//기록번호 가져오기
			int recNo = recDao.getrecNo()-1;
			System.out.println(recNo);
			
			if(file.getSize() > 0) {
				//오리지날 파일명
				String orgName = file.getOriginalFilename();
				//확장자
				String exName = orgName.substring(orgName.lastIndexOf("."));
				//현재시간+랜덤UUID+확장자
				String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
				
				//파일경로(디렉토리+저장파일명)
				String filePath = saveDir + "\\" + saveName;
				
				//DB 저장
				RecordImgVo imgVo = new RecordImgVo();
				imgVo.setRecordNo(recNo);
				imgVo.setSaveName(saveName);
				imgVo.setFilePath(filePath);
				imgVo.setOrderNo(index);
				imgDao.insertImg(imgVo);
				
				//파일 저장
				try {
					
					byte[] fileData = file.getBytes();
					OutputStream os = new FileOutputStream(filePath);
					BufferedOutputStream bos = new BufferedOutputStream(os);
					
					bos.write(fileData);
					bos.close();
					
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "false";
				}
			}
			
			index++;
		}
		
		return "success";
		
	}
	
	
	//(기록상세보기) 기록 리스트 가져오기
	public Map<String, Object> getRecordList(int courseNo, int authUserNo) {
		System.out.println("RecordService->getRecordList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("authUserNo", authUserNo);
		System.out.println(map);
		
		//기록 리스트 가져오기
		List<Map<String, Object>> recList = recDao.getRecordList(map);
		System.out.println(recList);
		
		//기록 이미지 가져오기
		List<Map<String, Object>> recImgs = imgDao.getImg(map);
		
		Map<String, Object> recMap = new HashMap<String, Object>();
		recMap.put("recList", recList);
		recMap.put("recImgs", recImgs);
		System.out.println(recMap);
		
		return recMap;
		
		
	}
	

	//(기록상세보기) 코스작성자 번호 가져오기
	public int getCoUserNo(int courseNo) {
		//System.out.println("RecordService->getCoUserNo");
		return coDao.getCoUserNo(courseNo);
	}

	
	//(기록상세보기) 좋아요 가져오기
	public Map<String, Object> recordViewForm(int courseNo, int userNo) {
		System.out.println("RecordService->recordViewForm");
		int likeCnt = likeDao.getLikeCnt(courseNo); //좋아요 갯수
		//좋아요 여부
		String liked = "heart-off";
		if(userNo != 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("courseNo", courseNo);
			map.put("userNo", userNo);
			
			if(likeDao.getLiked(map) > 0) {
				liked = "heart";
			}
		}
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("likeCnt", likeCnt); //좋아요 갯수
		coMap.put("liked", liked); //좋아요 여부
		
		return coMap;
	}

	//(기록수정) 기록 가져오기
	public Map<String, Object> getRecord(int recordNo) {
		System.out.println("RecordService->getRecord");
		//기록 가져오기
		RecordVo recVo = recDao.getRecord(recordNo);
		//기록 이미지 가져오기
		//List<RecordImgVo> recImgs = imgDao.getRecImg(recordNo);
		
		Map<String, Object> recMap = new HashMap<String, Object>();
		recMap.put("recVo", recVo);
		return recMap;
	}

}
