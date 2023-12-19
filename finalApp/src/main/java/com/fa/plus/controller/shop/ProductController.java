package com.fa.plus.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/shop/product/*")
public class ProductController {
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	String productList() throws Exception {
		
		return ".shop.product.list";
	}
	
}
