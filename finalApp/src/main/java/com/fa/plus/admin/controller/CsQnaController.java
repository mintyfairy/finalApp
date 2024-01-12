package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cs/*")
public class CsQnaController {
	
	@RequestMapping("qna")
	public String qna() {
		return ".admin.csQna.qna";
	}

}
