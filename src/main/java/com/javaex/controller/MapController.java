package com.javaex.controller;

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
}
