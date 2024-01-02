package com.fa.plus.controller.campsite;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.service.CampAdminService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;

@Controller
@RequestMapping("/siteManage/*")
public class CampAdminController {

	@Autowired
	private CampAdminService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) {
		String cp= req.getContextPath();
		int size = 10;
		int total_page;
		int dataCount;
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			
			dataCount = 0;//service.dataCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Site> list= service.listSite(map);
			
			String listUrl = cp + "/siteManage/main";
			String articleUrl = cp + "/siteManage/article?page=" + current_page;
			
			String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);

			model.addAttribute("articleUrl", articleUrl);
			
			model.addAttribute("page", current_page);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return ".admin.siteManage.siteManage";
	}
	
	@RequestMapping("site/{num}")
	public String listRoom(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, @PathVariable int num,
			Model model) {
		String cp= req.getContextPath();
		int size = 10;
		int total_page;
		int dataCount;
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("siteNum", num);
			dataCount = service.dataCountRoom(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Site> list= null;//service.listCategory();
			
			String listUrl = cp + "/siteManage/main";
			String articleUrl = cp + "/siteManage/article?page=" + current_page;
			
			String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			
			model.addAttribute("articleUrl", articleUrl);
			
			model.addAttribute("page", current_page);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return ".admin.siteManage.roomManage";
	}
	
	
	
	//이거 트렌젝션처리 이름ㅇ시작잇엇는데 머더라
	
	@GetMapping("site/write")
	public String writeSiteForm(Model model) {
		
		model.addAttribute("mode", "write");
		return ".campsite.siteWrite";
	}
	
	@PostMapping("site/write")
	public String writeSiteSubmit(Site dto,HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "camp";
		
		try {
			dto.setMemberidx((int)info.getMemberIdx());
			service.insertSite(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		
		
		return "redirect:/siteManage/main";
	}
	
	@GetMapping("site/update")
	public String updateSiteForm(Model model) {
		Public Site=null;
		
		model.addAttribute("mode", "write");
		return ".campsite.siteWrite";
	}
	
	@PostMapping("site/update")
	public String updateSiteSubmit(Site dto,HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "camp";
		/*
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/product/main?parentNum=" + dto.getParentNum()
						+ "&categoryNum=" + dto.getCategoryNum();
		if(special != 0) {
			url += "&special=" + special;
		}
		 */
		
		return "redirect:/siteManage/main";
	}
	
	@GetMapping("site/{num}/write")
	
	public String writeroomForm(@PathVariable int num,Model model) {
		
		model.addAttribute("mode", "write");
		return ".campsite.roomWrite";
	}
	
	@PostMapping("site/{num}/write")
	public String writeroomSubmit(@PathVariable int num,SiteDetail dto,HttpSession session,
			Model model) throws Exception {
		
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		//이걸로 본인  검증하자
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";
		
		try {
			dto.setSitenum(num);//캠핑장 번호
			service.insertRoom(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return "redirect:/siteManage/site/1";
	}
	
	@GetMapping("site/{num}/update")
	public String updateroomForm(@PathVariable int num,Model model) {
		
		SiteDetail dto=null;
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "write");
		return ".campsite.roomWrite";
	}
	
	@PostMapping("site/{num}/update")
	public String updateroomSubmit(@PathVariable int num,SiteDetail dto,HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";
		/*
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/product/main?parentNum=" + dto.getParentNum()
						+ "&categoryNum=" + dto.getCategoryNum();
		if(special != 0) {
			url += "&special=" + special;
		}
		 */
		
		
		return "redirect:/siteManage/site/1";
	}
	

}
