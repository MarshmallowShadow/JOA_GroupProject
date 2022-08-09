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
import com.javaex.dao.PointDao;
import com.javaex.dao.RecordDao;
import com.javaex.dao.RecordImgDao;
import com.javaex.vo.CourseVo;
import com.javaex.vo.PointVo;
import com.javaex.vo.RecordImgVo;
import com.javaex.vo.RecordVo;

@Service
public class RecordService {
	
	@Autowired
	private RecordDao recDao;
	@Autowired
	private CourseDao coDao;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private RecordImgDao imgDao;

	
	//코스기록 등록하기
	public void recordWrite(RecordVo recVo, int hour, int minute) {
		System.out.println("RecordService->recordWrite");
		
		recVo.setCourseTime((hour*60)+minute);
		System.out.println(recVo);
		recDao.insertRecord(recVo);
		System.out.println(recVo.getRecordNo());
		
	}
	
	//코스기록 이미지 등록
	public String recordImgWrite(List<MultipartFile> fileList) {
		System.out.println("RecordService->recordImgWrite");
		
		String saveDir = "C:\\javaStudy\\upload";
		
		int index = 0;
		
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
				imgVo.setRecordNo(2); //기록번호 어케하징
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
		System.out.println(coVo);
		//코스 좌표
		List<PointVo> pointVo = pointDao.selectPoint(courseNo);
		System.out.println(pointVo);
		
		Map<String, Object> coMap = new HashMap<String, Object>();
		coMap.put("coVo", coVo);
		coMap.put("pointVo", pointVo);
		
		return coMap;
		
	}


	

}
