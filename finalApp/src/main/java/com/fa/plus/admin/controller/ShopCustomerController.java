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

import com.fa.plus.admin.domain.shop.Review;
import com.fa.plus.admin.service.shop.ShopCustomerManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/shopCustomer/*")
public class ShopCustomerController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private ShopCustomerManageService reviewService;

	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			@RequestParam(defaultValue = "1") int mode, 
			@RequestParam(defaultValue = "review") String tab, 
			HttpServletRequest req, 
			Model model) throws Exception {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("mode", mode);
			dataCount = reviewService.dataCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Review> list = reviewService.listReview(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/shopCustomer/list";
			if(mode != 1) {
				listUrl += "?mode=" + mode + "&tab=" + tab;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			model.addAttribute("mode", mode);
			model.addAttribute("tab", tab);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".admin.shopCustomer.list";
	}
}
