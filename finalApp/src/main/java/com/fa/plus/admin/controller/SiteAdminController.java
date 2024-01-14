package com.fa.plus.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.SiteAdminService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.site.Site;
import com.fa.plus.domain.site.SiteDetail;

@Controller
@RequestMapping("/admin/siteManage/*")
public class SiteAdminController {

	@Autowired
	private SiteAdminService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,HttpSession session,
			Model model) {
		String cp= req.getContextPath();
		int size = 10;
		int total_page;
		int dataCount;
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			map.put("memberIdx", info.getmemberIdx());
			
			dataCount = service.dataCountSite(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Site> list= service.listSite(map);
			
			String listUrl = cp + "/admin/siteManage/main";
			
			String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
			System.out.println(paging);
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);

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
			
			map.put("siteNum", num);
			map.put("offset", offset);
			map.put("size", size);
			
			List<SiteDetail> list= service.listRoom(map);
			
			String listUrl = cp + "/admin/siteManage/main";
			
			String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
			
			model.addAttribute("num", num);
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			
			
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
		String path = root + "uploads" + File.separator + "site";
		
		try {
			dto.setMemberIdx(info.getmemberIdx());
			service.insertSite(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		
		
		return "redirect:/admin/siteManage/main";
	}
	
	@GetMapping("site/update")
	public String updateSiteForm(@RequestParam long siteNum,
			@RequestParam(value = "page",defaultValue = "1") String page, Model model) {
		Site dto=null;
		List<Site> listFile =service.listSiteFile(siteNum);
		try {
			dto=service.findByIdSite(siteNum);
			listFile=service.listSiteFile(siteNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("listFile", listFile);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".campsite.siteWrite";
	}
	
	@PostMapping("site/update")
	public String updateSiteSubmit(Site dto,HttpSession session,
			@RequestParam(value = "page",defaultValue = "1") String page,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "site";
		
		try {
			service.updateSite(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/siteManage/main?page=" + page;
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
			dto.setSiteNum(num);//캠핑장 번호
			service.insertRoom(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return "redirect:/admin/siteManage/site/"+num;
	}
	
	@GetMapping("site/{num}/update")
	public String updateroomForm(@PathVariable int num,Model model
			,@RequestParam long detailNum
			,@RequestParam(defaultValue = "1") int page) {
		
		SiteDetail dto=null;
		List<SiteDetail> listFile=null;
		try {
			dto = service.findByIdRoom(detailNum);
			listFile=service.listRoomFile(detailNum);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("listFile", listFile);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		return ".campsite.roomWrite";
	}
	
	@PostMapping("site/{num}/update")
	public String updateroomSubmit(@PathVariable int num,SiteDetail dto,HttpSession session,
			Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";
		
		try {
			service.updateRoom(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/siteManage/site/"+num;
	}
	

	@GetMapping("deleteSite")
	public String deleteSite(@RequestParam long siteNum,Model model,HttpSession session) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "site";
		
		try {
			service.deleteSite(siteNum, path);
			service.deleteSiteFile(siteNum, path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "redirect:/admin/siteManage/main";
	}
	@GetMapping("site/{num}/delete")
	public String deleteRoom(@PathVariable long num,@RequestParam long detailNum,Model model,HttpSession session) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";
		
		try {
			service.deleteRoom(detailNum, path);
			service.deleteRoomFile(detailNum, path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/admin/siteManage/site/"+num;
	}
	
	@PostMapping("deleteFile/{where}")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, @PathVariable String where,
			@RequestParam String fileName,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			if(where.equals("site")) {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "site" + File.separator + fileName;
				
				service.deleteSiteFile(fileNum, pathname);
				
			}else if(where.equals("room")) {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "room" + File.separator + fileName;
				
				service.deleteRoomFile(fileNum, pathname);
				
			}else {
				state = "false";
			}
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}

