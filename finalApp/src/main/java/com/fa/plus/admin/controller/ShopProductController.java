package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.service.shop.ShopProductManageService;

@Controller
@RequestMapping("/admin/shopProduct/*")
public class ShopProductController {
	@Autowired
	private ShopProductManageService service;
	
	@RequestMapping("main")
	public String list(@RequestParam(defaultValue = "0") int special, 
			@RequestParam(defaultValue = "0") int md, 
			@RequestParam(defaultValue = "0") int starter, 
			@RequestParam(defaultValue = "0") long parentNum, 
			@RequestParam(defaultValue = "0") long categoryNum, 
			@RequestParam(defaultValue = "0") long brandNum, 
			@RequestParam(defaultValue = "1") int productShow, 
			@RequestParam(defaultValue = "1") int tab, 
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd, 
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int size = 10;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = null;
		if(parentNum == 0 && listCategory.size() != 0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		List<ShopProductManage> listBrand = service.listBrand();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("special", special);
		map.put("parentNum", parentNum);
		map.put("md", md);
		map.put("starter", starter);
		map.put("productShow", productShow);
		map.put("categoryNum", categoryNum);
		map.put("brandNum", brandNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset  = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ShopProductManage> list = service.listProduct(map);
		
		model.addAttribute("list", list);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("special", special);
		model.addAttribute("productShow", productShow);
		model.addAttribute("parentNum", parentNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("brandNum", brandNum);
		model.addAttribute("tab", tab);
		
		return ".admin.shopProduct.main";
	}
	
	@GetMapping("write")
	public String writeForm(
			@RequestParam(defaultValue = "0") int special, 
			@RequestParam(defaultValue = "0") long parentNum, 
			Model model) {
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = null;
		List<ShopProductManage> listBrand = service.listBrand();
		if(listCategory.size() !=0 ) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		
		model.addAttribute("mode", "write");
		model.addAttribute("special", special);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		
		return ".admin.shopProduct.write";
	}
}
