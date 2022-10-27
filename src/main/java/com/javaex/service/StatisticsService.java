package com.javaex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.StatisticsDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class StatisticsService {
	
	@Autowired
	StatisticsDao statDao;
	@Autowired
	UserDao userDao;

	//통계 가져오기
	public List<Map<String, Object>> getStat(String month) {
		
		if(!month.equals("all")) {
			month = "2022-"+month;
		}
		
		//회원 번호 전체 가져오기
		List<UserVo> userList = userDao.getAllUserNo();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(UserVo userVo : userList) {
			
			Map<String, Object> parammap = new HashMap<String, Object>();
			parammap.put("month", month);
			parammap.put("userNo", userVo.getUserNo());
			
			//통계 데이터 가져오기
			List<Map<String, Object>> data = statDao.getStat(parammap);

			//총합계
			int total = 0;
			for(int i=0; i<data.size(); i++) {
				total += Integer.parseInt(data.get(i).get("CNT").toString());
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", userVo.getName());
			map.put("dataList", data);
			map.put("total", total);
			
			list.add(map);
		}
		
		return list;
	}

}
