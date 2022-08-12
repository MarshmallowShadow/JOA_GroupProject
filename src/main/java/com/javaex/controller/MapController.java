package com.javaex.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/map")
@Controller
public class MapController {
	@RequestMapping(value="", method={RequestMethod.POST, RequestMethod.GET})
	public String map() {
		System.out.println("MapController>map");
		
		
		return "map/map";
	}
	
	public static void main(String[] args) {
		Map<String, String> cateMap = new HashMap<>();
		cateMap.put("commute", "소통");
		cateMap.put("review", "후기");
	}
}
