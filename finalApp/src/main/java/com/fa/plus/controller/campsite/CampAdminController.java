package com.fa.plus.controller.campsite;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;

@Controller
@RequestMapping("/siteManage/*")
public class CampAdminController {

	@RequestMapping("main")
	public String main() {
		
		return ".campsite.admin.main";
	}
	//이거 트렌젝션처리 이름ㅇ시작잇엇는데 머더라
	@GetMapping("site/write")
	public String siteForm(Model model) {
		
		Site dto=null;
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "write");
		return ".campsite.siteWrite";
	}
	@PostMapping("site/write")
	public String siteSubmit(Site dto,HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
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
		
		return ".admin.siteManage.roomList.1";
	}
	@GetMapping("room/{num}/write")
	public String roomForm(@PathVariable int num,Model model) {
		
		SiteDetail dto=null;
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "write");
		return ".campsite.";
	}
	@PostMapping("room/{num}/write")
	public String roomSubmit(@PathVariable int num,SiteDetail dto,HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
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
		
		
		return ".admin.siteManage.siteManage";
	}
	

}
