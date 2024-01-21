package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("charts")
	@ResponseBody
	public Map<String, Object> things(@RequestParam(name = "keyword",defaultValue = "floor") String keyword) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("state", "true");
		model.put("keyword", keyword);

		try {

			List<Map<String, Object>> siteRankYear = service.siteRankYear();
			List<Map<String, Object>> monthsRankYear = service.monthsRankYear();
			List<Map<String, Object>> daysRankYear = service.daysRankYear();
			List<Map<String, Object>> thingsRankYear =service.thingsRankYear(keyword);

			model.put("siteRankYear", siteRankYear);
			model.put("monthsRankYear", monthsRankYear);
			model.put("daysRankYear", daysRankYear);
			model.put("thingsRankYear", thingsRankYear);
			model.put("thingsRankYear", "thingsRankYear");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}

}
