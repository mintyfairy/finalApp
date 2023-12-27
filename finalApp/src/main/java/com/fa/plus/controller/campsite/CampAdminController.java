package com.fa.plus.controller.campsite;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/siteManage/*")
public class CampAdminController {

	@RequestMapping("main")
	public String main() {
		
		return ".campsite.admin.main";
	}
	//이거 트렌젝션처리 이름ㅇ시작잇엇는데 머더라
	@GetMapping("writeSite")
	public String WriteSite() {
		
		
		return ".campsite.siteWrite";
	}
	@GetMapping("writeRoom/{num}")
	public String WriteRoom(@PathVariable int num) {
		
		
		return ".campsite.roomWrite";
	}
	

}
