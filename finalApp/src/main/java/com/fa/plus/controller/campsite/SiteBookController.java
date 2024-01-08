package com.fa.plus.controller.campsite;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.SiteAdminServiceImpl;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteSearch;

@Controller
@RequestMapping("/site/*")
public class SiteBookController {
	@Autowired
	private SiteAdminServiceImpl adminService;

	// @Autowired
	// private siteCampAdminServiceImpl adminService;

	@RequestMapping("list")
	public String main(
			SiteSearch dto,
			Model model) {
		
		
		if (dto != null)model.addAttribute("dto", dto);
		return ".campsite.room";
	}

	// AJAX-JSON
	@GetMapping(value = "scroll")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			SiteSearch dto) throws Exception {

		int size = 4;
		int total_page;
		int dataCount;
		Map<String, Object> map = new HashMap<String, Object>();
		if (dto.getSiteKwd() != null) {
			dto.setSiteKwd(URLDecoder.decode(dto.getSiteKwd(), "utf-8"));
			map.put("kwd", dto.getSiteKwd());
		}

		// 전체 페이지 수
		dataCount = adminService.dataCountSite(map);
		total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Site> list = adminService.listSite(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("size", size);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);

		return model;
	}

	@RequestMapping("places/{num}")
	public String sitelist(@PathVariable int num) {

		return ".campsite.roomDetail";
	}

}
