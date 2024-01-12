package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cs/*")
public class CsEventController {

	@RequestMapping("event")
	public String event() {
		return ".admin.csEvent.event";
	}
	
}
