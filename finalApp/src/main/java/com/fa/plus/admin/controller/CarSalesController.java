package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CarSalesController {
	 
	@RequestMapping(value="/admin/carSales/*", method=RequestMethod.GET)
	public String method() {
		return ".admin.carSales.sales";
	}

}

