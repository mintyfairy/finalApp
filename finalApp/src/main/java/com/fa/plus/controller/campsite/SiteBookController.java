package com.fa.plus.controller.campsite;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.SiteAdminService;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;
import com.fa.plus.domain.site.SiteReview;
import com.fa.plus.domain.site.SiteSearch;
import com.fa.plus.service.site.SiteService;

@Controller
@RequestMapping("/site/*")
public class SiteBookController {
	@Autowired
	private SiteAdminService adminService;

	@Autowired
	private SiteService siteservice;
	// @Autowired
	// private siteCampAdminServiceImpl adminService;

	@RequestMapping("list")
	public String main(
			SiteSearch dto,
			Model model) {
		
		
		List<Site> Adlist = adminService.listAdvertiseSite();
		model.addAttribute("Adlist", Adlist);
		
		if (dto != null) {
			model.addAttribute("dto", dto);
			model.addAttribute("dataCount",adminService.searchCountSite(dto));
		}
		return ".campsite.room";
	}

	// AJAX-JSON
	@RequestMapping(value = "scroll")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			SiteSearch dto) throws Exception {

		int size = 6;
		int total_page;
		int dataCount;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (dto.getSiteKwd() != null) {
			dto.setSiteKwd(URLDecoder.decode(dto.getSiteKwd(), "utf-8"));
			map.put("siteKwd", dto.getSiteKwd());
		}
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		
		dto.setSize(Integer.toString(size));
		dto.setOffset(Integer.toString(offset));
		List<Site> list = adminService.listSearchSite(dto);

		// 전체 페이지 수
		dataCount = adminService.searchCountSite(dto);
		total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);

		if (total_page < current_page) {
			current_page = total_page;
		}


		Map<String, Object> model = new HashMap<String, Object>();
		
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("size", size);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("dto", dto);
		
		return model;
	}

	@RequestMapping("places/{num}")
	public String sitelist(@PathVariable int num,SiteSearch dto,Model model) throws Exception {
		
		int dataCount;
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> mapForRoomReview = new HashMap<String, Object>();
	
		map.put("siteNum",num);
		Site Sitedto=adminService.findByIdSite(num);
		dto.setSiteNum(num);
		List<SiteDetail> list = adminService.listSearchRoom(dto);
		for(int n=0;n<list.size();n++) {
			List<String> filelist = new ArrayList<String>();
			for(SiteDetail vo2:adminService.listRoomFile(list.get(n).getDetailNum())){
				filelist.add(vo2.getFileName());
			}
			if (filelist!=null&&filelist.size() != 0) list.get(n).setListFile(filelist);
			
			long a=list.get(n).getFloor();
			if (a==1) list.get(n).setFloorString("데크");
			else if (a==2) list.get(n).setFloorString("잔디");  
			else if (a==3) list.get(n).setFloorString("자갈");
			else if (a==4) list.get(n).setFloorString("흙");
			else if (a==5) list.get(n).setFloorString("기타");
			
			mapForRoomReview.put("detailNum", list.get(n).getDetailNum());
			
			list.get(n).setRoomsiteReviewList(siteservice.listSiteReivew(mapForRoomReview));
		}
		List<Site> listSiteFile=adminService.listSiteFile(num);
		// 전체 페이지 수
		int reviewCount=siteservice.dataCountReview(map);
		dataCount = adminService.dataCountRoom(map);
		model.addAttribute("reviewCount", reviewCount);
		List<SiteReview> siteReviewList=siteservice.listSiteReivew(map);
		model.addAttribute("siteReviewList", siteReviewList);
		model.addAttribute("list", list);
		model.addAttribute("listSiteFile", listSiteFile);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("Sitedto",Sitedto);
		model.addAttribute("dto", dto);
		
		return ".campsite.roomDetail";
	}

	
	
	
}
