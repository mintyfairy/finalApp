package com.fa.plus.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.service.SiteChartService;

@Controller
@RequestMapping("/admin/siteChart/*")
public class SiteChartController {
	@Autowired
	private SiteChartService service;

	//지역,업체,환경,카테고리, 
	@GetMapping("main")
	public String chartPage( Model model) {
		Map<String, Object> previousYear = service.previousYearBook();
		Map<String, Object> previousMonth = service.previousMonthBook();
		Map<String, Object> adEfect = service.adEfect();
		
		model.addAttribute("adEfect", adEfect);
		model.addAttribute("previousYear", previousYear);
		model.addAttribute("previousMonth", previousMonth);
		
		return ".admin.siteChart.siteChart";
	}

}
