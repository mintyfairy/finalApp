package com.fa.plus.controller.campsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/siteManage/*")
public class CampAdminController {

	@RequestMapping("main")
	public String main() {
		
		return ".campsite.admin.main";
	}
	//이거 트렌젝션처리 이름ㅇ시작잇엇는데 머더라
	@GetMapping("site/write")
	public String siteForm(Model model) {
		
		model.addAttribute("mode", "write");
		return ".campsite.siteWrite";
	}
	@PostMapping("site/write")
	public String siteSubmit() {
		
		
		return ".campsite.siteWrite";
	}
	@GetMapping("room/{num}/write")
	public String roomForm(@PathVariable int num,Model model) {
		
		model.addAttribute("mode", "write");
		return ".campsite.roomWrite";
	}
	@PostMapping("room/{num}/write")
	public String roomSubmit(@PathVariable int num) {
		
		
		return ".campsite.roomWrite";
	}
	

}
