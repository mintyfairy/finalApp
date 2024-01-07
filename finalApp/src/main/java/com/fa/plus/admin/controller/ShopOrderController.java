package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.shop.ShopOrderManage;
import com.fa.plus.admin.service.shop.ShopOrderManageService;

@Controller
@RequestMapping("/admin/shopOrder/*")
public class ShopOrderController {
	@Autowired
	private ShopOrderManageService service;
	
	@RequestMapping("main")
	public String list(
			@RequestParam(defaultValue = "99") int state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderNum") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		//String cp = req.getContextPath();
		
		int size = 10;
		//int total_page;
		//int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ShopOrderManage> list = service.listOrder(map);
		
		model.addAttribute("list", list);
		model.addAttribute("state", state);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		
		return ".admin.shopOrder.order";
	}
}
