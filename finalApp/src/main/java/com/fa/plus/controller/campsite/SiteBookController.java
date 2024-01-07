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
		Map<String, Object> map = new HashMap<String, Object>();
		if(dto!=null) {

			map.put("offset", 0);
			map.put("size", 4);
			map.put("siteLocal",dto.getSiteLocal() );
			map.put("siteEnvironment",dto.getSiteEnvironment() );
			map.put("siteCategory", dto.getSiteCategory());
			map.put("siteOption",dto.getSiteOption() );
			map.put("maxFee", dto.getMinFee());
			map.put("maxFee", dto.getMaxFee());
		}
		System.out.println(dto.getSiteLocal() );
		System.out.println(dto.getSiteEnvironment() );
		System.out.println( dto.getSiteCategory());
		System.out.println(dto.getSiteOption() );
		System.out.println( dto.getMinFee());
		System.out.println(dto.getMaxFee());
		List<Site> list = adminService.listSearchSite(map);
		
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
		if(dto!=null) {
			map.put("startDate",dto.getStartDate());
			map.put("endDate",dto.getEndDate() );
			map.put("siteLocal",dto.getSiteLocal() );
			map.put("siteEnvironment",dto.getSiteEnvironment() );
			map.put("siteCategory", dto.getSiteCategory());
			map.put("siteOption",dto.getSiteOption() );
			map.put("maxFee", dto.getMinFee());
			map.put("maxFee", dto.getMaxFee());
		}
		if (dto.getSiteKwd() != null) {
			dto.setSiteKwd(URLDecoder.decode(dto.getSiteKwd(), "utf-8"));
			map.put("siteKwd", dto.getSiteKwd());
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
		
		List<Site> list = adminService.listSearchSite(map);

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
