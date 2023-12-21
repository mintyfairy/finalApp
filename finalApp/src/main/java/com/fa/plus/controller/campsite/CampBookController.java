package com.fa.plus.controller.campsite;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/site/*")
public class CampBookController {

	@RequestMapping("list")
	public String list() {
		
		
		return ".campsite.room";
	}
	@RequestMapping("places/{num}")
	public String sitelist(@PathVariable int num) {
		
		
		return ".campsite.roomDetail";
	}
}
