package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MapService {
	//@Autowired
	//private CourseDao cDao;
	
	public List<Map<String, Object>> getList(Map<String, Object> kMap){
		List<Map<String, Object>> cMap = null;
		
		if(((String)kMap.get("searchCate")).equals("location")) {
			
		} else {
			cMap = ;
		}
		
		return cMap;
	}
}
