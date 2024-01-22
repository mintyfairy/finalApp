package com.fa.plus.controller.shop;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.service.shop.ShopProductManageService;

@Controller
@RequestMapping(value = "/shop/*")
public class MainShoppingController {
	@Autowired
	private ShopProductManageService service;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	String shoppingHome(Locale locale, Model model) {
		
		List<ShopProductManage> listHot = new ArrayList<ShopProductManage>();
		
		try {
			listHot = service.findByHotId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("!@#!####:" + listHot);
		
		model.addAttribute("listHot", listHot);
		
		return ".shop.main";
	}
	
}
