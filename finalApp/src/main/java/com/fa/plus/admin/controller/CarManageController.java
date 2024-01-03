package com.fa.plus.admin.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.car.CampingCar;
import com.fa.plus.admin.service.car.CarManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/carManage/*")
public class CarManageController {
	@Autowired
	private CarManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("car")
	public String carlist() {
		
		return ".admin.carManage.car";
	}
	
	@GetMapping("insert")
	public String carInsert(Model model) {
		
		model.addAttribute("mode", "insert");
		
		return ".admin.carManage.insert";
	}
	
	@PostMapping("insert")
	public String insertSubmit(CampingCar dto, Model model, HttpSession session) {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "caravan";
			
			service.insertCar(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/carManage/car";
		return url;
	}
	

	
}

