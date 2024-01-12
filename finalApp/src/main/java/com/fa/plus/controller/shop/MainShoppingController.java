package com.fa.plus.controller.shop;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/shop/*")
public class MainShoppingController {
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	String shoppingHome(Locale locale, Model model) {
		
		return ".shop.main";
	}
	
}
