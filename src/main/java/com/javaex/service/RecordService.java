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

	
	//기록 등록
	public String recordWrite(RecordVo recVo, List<MultipartFile> fileList) {
		System.out.println("RecordService->recWrite");
		recDao.insertRecord(recVo);
		
		int recNo = recVo.getRecordNo();
		
		String saveDir = "C:\\javaStudy\\upload";
		
		//기록 이미지 번호가 있는지 찾음
		int index = imgDao.getOrderNo(recNo)+1;
		System.out.println(index);
		
		for(MultipartFile file : fileList) {
			
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
				imgVo.setFilePath("/upload/"+saveName);
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
	
	//(기록등록) 코스 정보 가져오기
	public Map<String, Object> getCourseInfo(int courseNo) {
		System.out.println("RecordService->getCourseInfo");
		
		//코스 정보
		CourseVo coVo = coDao.selectCourse(courseNo);
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("coVo", coVo);

		return coMap;
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
	public Map<String, Object> getRecord(int courseNo, int recordNo) {
		System.out.println("RecordService->getRecord");

		CourseVo coVo = coDao.selectCourse(courseNo); //코스정보
		RecordVo recVo = recDao.getRecord(recordNo); //기록정보
		
		Map<String, Object> recMap = new HashMap<String, Object>();
		recMap.put("coVo", coVo);
		recMap.put("recVo", recVo);
		
		return recMap;

	}
	
	//(기록수정) 기록사진 가져오기
	public List<RecordImgVo> getImgs(int recordNo) {
		System.out.println("RecordService->getImgs");
		return imgDao.getRecImg(recordNo);
	}

	//(기록수정) 기록 수정하기
	public String recordModify(RecordVo recVo) {
		System.out.println("RecordService->recordModify");
		int cnt = recDao.updateRecord(recVo);
		
		if(cnt > 0) {
			return "success";
		}
		
		return "fail";
	}

	//(기록수정) 기록 이미지 삭제
	public String deleteImgs(List<Integer> deleteFiles) {
		System.out.println("RecordService->deleteImgs");
		
		int cnt = 0;
		for(int i=0; i<deleteFiles.size(); i++) {
			cnt += imgDao.deleteImgs(deleteFiles.get(i));
		}
		
		if(cnt > 0) {
			return "success";
		}
		
		return "fail";
		
	}


	

	

}
