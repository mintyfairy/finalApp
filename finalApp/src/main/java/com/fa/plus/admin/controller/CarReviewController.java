package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CarReviewController {
	 
	@RequestMapping(value="/admin/carReview/*", method=RequestMethod.GET)
	public String method() {
		return ".admin.carReview.review";
	}
}

