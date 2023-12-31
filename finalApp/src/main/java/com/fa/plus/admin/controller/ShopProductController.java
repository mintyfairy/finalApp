package com.fa.plus.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.service.shop.ShopProductManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/shopProduct/*")
public class ShopProductController {
	@Autowired
	private ShopProductManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
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
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
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
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset  = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ShopProductManage> list = service.listProduct(map);
		
		String listUrl = cp + "/admin/shopProduct/main";
		String articleUrl = cp + "/admin/shopProduct/article?page=" + current_page;
		
		String query = "parentNum=" + parentNum + "&categoryNum="+categoryNum;
		if (special != 0) {
			query = "&special=" + special;
		}
		if(brandNum != 0) {
			query = "&brandNum=" + brandNum;
		}
		if(md != 0) {
			query = "&md=" + md;
		}
		if(starter != 0) {
			query = "&starter" + starter;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("special", special);
		model.addAttribute("productShow", productShow);
		model.addAttribute("parentNum", parentNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("brandNum", brandNum);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("tab", tab);
		
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".admin.shopProduct.main";
	}

	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam long parentNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ShopProductManage> listSubCategory = service.listSubCategory(parentNum);
		
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}
	
	@GetMapping("listBrand")
	@ResponseBody
	public Map<String, Object> listBrand() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ShopProductManage> listBrand = service.listBrand();
		
		model.put("listBrand", listBrand);
		
		return model;
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
	
	@PostMapping("write")
	public String writeSubmit(
			ShopProductManage dto,  
			HttpSession session, 
			Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
		
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/shopProduct/main?parentNum=" + dto.getParentNum()
						+ "&categoryNum=" + dto.getCategoryNum() + "&brandNum=" + dto.getBrandNum();
		
		return url;
	}
}
