package com.fa.plus.admin.controller.shop;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.service.shop.ShopProductManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/shop/admin/product/*")
public class ShopProductManageController {
	@Autowired
	private ShopProductManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("write")
	public String writeForm(
			@RequestParam(defaultValue = "0") int special, 
			@RequestParam(defaultValue = "0") int md, 
			@RequestParam(defaultValue = "0") int starter, 
			Model model) {
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = null;
		long parentNum = 0;
		if(listCategory.size() != 0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		
		
		model.addAttribute("mode", "write");
		model.addAttribute("special", special);
		model.addAttribute("md", md);
		model.addAttribute("starter", starter);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		
		return ".shop.product.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(
			ShopProductManage dto, 
			@RequestParam(defaultValue = "0") int special, 
			HttpSession session, 
			Model model) {
		
		 String root = session.getServletContext().getRealPath("/");
		 String path = root + "uploads" + File.separator + "product";
		 
		 try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		 
		 String url = "redirect:/shop/admin/product/main?parentNum=" + dto.getParentNum() 
		 				+ "&categoryNum=" + dto.getCategoryNum();
		 if(special != 0) {
			 url += "&special" + special;
		 }
		 
		 return url;
	}
	
	
}
