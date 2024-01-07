package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/shopReview/*")
public class ShopReviewController {
	
	@RequestMapping("main")
	public String list() {
		return ".admin.shopReview.review";
	}
}
