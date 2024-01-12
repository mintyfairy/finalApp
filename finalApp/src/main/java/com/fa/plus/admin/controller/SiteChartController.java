package com.fa.plus.admin.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/siteChart/*")
public class SiteChartController {

	@RequestMapping("list")
	public String list() {
		
		
		return ".campsite.room";
	}
	@RequestMapping("places/{num}")
	public String sitelist(@PathVariable int num) {
		
		
		return ".campsite.roomDetail";
	}
	

}
