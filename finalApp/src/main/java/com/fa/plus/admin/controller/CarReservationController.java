package com.fa.plus.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.car.CarReservationService;

@Controller
@RequestMapping("/admin/carReservation/")
public class CarReservationController {
	@Autowired
	private CarReservationService service;
	
	@RequestMapping("chart")
	public String chart(Model model) throws Exception {
		
		Map<String, Object> today = service.todayReservation();
		
		model.addAttribute("today", today);
	
		return ".admin.carReservation.chart";
	}
	
	@GetMapping("bar")
	@ResponseBody
	public Map<String, Object> bar() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		
		map = new HashMap<>();
		map.put("name", "중소형차");
		map.put("type", "bar");
		map.put("data", new double[]{-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "모터홈");
		map.put("type", "bar");
		map.put("data", new double[]{4.7,5.4,9.5,13.9,18.8,21.0,23.9,26.1,22.1,18.1,13.6,7.9});
		list.add(map);
	
		
		model.put("year", "2023");
		model.put("legend", new String[] {"중소형차", "모터홈"});
		model.put("series", list);
		
		return model;
	}
	
	
	@GetMapping("list")
	public String list() {
		return ".admin.carReservation.list";
	}
	
	
	
}

