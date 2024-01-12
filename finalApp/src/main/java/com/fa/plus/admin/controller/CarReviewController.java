package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/admin/carReview/*")
public class CarReviewController {
	 
	@RequestMapping("review")
	public String review() {
		return ".admin.carReview.review";
	}
	
	@RequestMapping("ask")
	public String ask() {
		return ".admin.carReview.ask";
	}
}

