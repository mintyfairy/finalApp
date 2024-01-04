package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cs/*")
public class CsController {
	 
	@RequestMapping("notice")
	public String notice() {
		return ".admin.cs.notice";
	}
	
	@RequestMapping("faq")
	public String faq() {
		return ".admin.cs.faq";
	}
	
	@RequestMapping("event")
	public String event() {
		return ".admin.cs.event";
	}
	
	@RequestMapping("qna")
	public String qna() {
		return ".admin.cs.qna";
	}
}

