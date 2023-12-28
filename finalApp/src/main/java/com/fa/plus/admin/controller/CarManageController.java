package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/carManage/*")
public class CarManageController {

	
	@RequestMapping("car")
	public String carlist() {
		return ".admin.carManage.car";
	}
	
	@GetMapping("insert")
	public String carInsert() {
		
		return ".admin.carManage.insert";
	}
	

	
}

