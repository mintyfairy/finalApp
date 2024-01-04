package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cs/*")
public class CsFaqController {
	
	@RequestMapping("faq")
	public String faq() {
		return ".admin.csFaq.faq";
	}

}
