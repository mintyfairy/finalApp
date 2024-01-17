package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.car.CarReservation;
import com.fa.plus.admin.service.car.CarReservationService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/carReservation/")
public class CarReservationController {
	@Autowired
	private CarReservationService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("chart")
	public String chart(Model model) throws Exception {
		Map<String, Object> today = service.todayReservation();
		Map<String, Object> thisMonthsales = service.monthSales();
		Map<String, Object> thisyearsales = service.yearSales();
		
		
		model.addAttribute("today", today);
		model.addAttribute("thisMonthsales", thisMonthsales);
		model.addAttribute("thisyearsales", thisyearsales);
		
		return ".admin.carReservation.chart";
	}
	
	@GetMapping("bar")
	@ResponseBody
	public Map<String, Object> bar() throws Exception {
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		String month = String.format("%04d%02d", y, m);
		
		List<Map<String, Object>> months = service.monthTotalMoney(month);
		
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			month = String.format("%04d%02d", y, m);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("months", months);
		
		return model;
	}
	
	
	@RequestMapping("list")
	public String list(@RequestParam(defaultValue = "0") String orderNum,
			@RequestParam(defaultValue = "1") int orderState,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,		
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		
		int size = 10;
		int total_page;
		int dataCount;
		
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNum", orderNum);
		map.put("orderState", orderState);
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
	
		
		List<CarReservation> list = service.listReservation(map);
		
		String listUrl = cp + "/admin/carReservation/list";
		String articleUrl = cp + "/admin/carReservation/detail?page=" + current_page;
		
		String query = "";
		if(kwd.length() != 0) {
			query += "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("orderState", orderState);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".admin.carReservation.list";
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam String orderNum,
			HttpServletRequest req,
			Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNum", orderNum);
		
		CarReservation dto = service.listDetail(map);
		
		model.addAttribute("dto", dto);
		
		return "admin/carReservation/detail"; 
	}
	
	
}

