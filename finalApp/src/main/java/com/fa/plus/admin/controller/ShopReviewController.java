package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopReviewController {
	
	@RequestMapping(value="/admin/shopReview/*", method=RequestMethod.GET)
	public String method() {
		return ".admin.shopReview.review";
	}
}
