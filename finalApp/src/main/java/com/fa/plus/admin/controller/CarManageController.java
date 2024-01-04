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

import com.fa.plus.admin.domain.car.CampingCar;
import com.fa.plus.admin.service.car.CarManageService;
import com.fa.plus.common.FileManager;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/carManage/*")
public class CarManageController {
	@Autowired
	private CarManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("car")
	public String carlist(@RequestParam(defaultValue = "0") long carNum,
			@RequestParam(defaultValue = "1") int carShow,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,		
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carNum", carNum);
		map.put("carShow", carShow);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page -1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<CampingCar> list = service.listCar(map);
		
		String listUrl = cp + "/admin/carManage/car";
		String articleUrl = cp + "/admin/carManage/detail?page=" + current_page;
		
		String query = "";
		if(carShow != -1) {
			query += "&carShow=" + carShow;
		}
		
		if(kwd.length() != 0) {
			query += "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("carShow", carShow);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".admin.carManage.car";
	}
	
	@GetMapping("insert")
	public String carInsert(Model model) {
		
		model.addAttribute("mode", "insert");
		
		return ".admin.carManage.insert";
	}
	
	@PostMapping("insert")
	public String insertSubmit(CampingCar dto, Model model, HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "caravan";
		
		try {
			service.insertCar(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/carManage/car";
		return url;
	}
	

	
}

