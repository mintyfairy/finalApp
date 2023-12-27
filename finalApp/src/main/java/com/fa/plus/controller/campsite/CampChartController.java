package com.fa.plus.controller.campsite;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/siteChart/*")
public class CampChartController {

	@RequestMapping("list")
	public String list() {
		
		
		return ".campsite.room";
	}
	@RequestMapping("places/{num}")
	public String sitelist(@PathVariable int num) {
		
		
		return ".campsite.roomDetail";
	}
	

}
