package com.fa.plus.admin.controller;  


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.CsEventManage;
import com.fa.plus.admin.service.CsEventService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/cs/event/*")
public class CsEventController {
	@Autowired
	private CsEventService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("{category}/list")
	public String list(@PathVariable String category,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<CsEventManage> list = service.listEvent(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/cs/event/"+category+"/list";   
		String articleUrl = cp + "/admin/cs/event/"+category+"/article?page=" + current_page;

		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.cs.csEventManage.list";
	}
	
	@GetMapping("{category}/write")
	public String writeForm(
			@PathVariable String category, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.cs.csEventManage.write";
	}

	@PostMapping("{category}/write")
	public String writeSubmit(
			@PathVariable String category,
			CsEventManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertEvent(dto);
		} catch (Exception e) {
		}

		
		 return "redirect:/admin/cs/event/all/list";   
		 // return "redirect:/admin/cs/event/" + category + "list";   
	}
	
	@GetMapping("{category}/article")
	public String article(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		CsEventManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/admin/cs/event/" + category + "/list?" + query;
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		CsEventManage prevDto = service.findByPrev(map);
		CsEventManage nextDto = service.findByNext(map);
		
		// 이벤트 참여자
		List<CsEventManage> listEventTakers = service.listEventTakers(num);
		// 이벤트 당첨자
		List<CsEventManage> listEventWinner = service.listEventWinner(num);

		model.addAttribute("category", category);
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("listEventTakers", listEventTakers);
		model.addAttribute("listEventWinner", listEventWinner);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.cs.csEventManage.article";
	}
	
	@GetMapping("{category}/update")
	public String updateForm(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		CsEventManage dto = service.findById(num);
		
		if (dto == null) {
			return "redirect:/admin/cs/event/" + category + "/list?page=" + page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin.cs.csEventManage.write";
	}

	@PostMapping("{category}/update")
	public String updateSubmit(CsEventManage dto,
			@PathVariable String category,
			@RequestParam String page,
			HttpSession session) throws Exception {

		try {
			service.updateEvent(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/cs/event/" + category + "/list?page=" + page;
	}

	@GetMapping("{category}/delete")
	public String delete(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		try {
			service.deleteEvent(num);
		} catch (Exception e) {
			
		}

		return "redirect:/admin/cs/event/" + category + "/list?" + query;
	}
	
	@PostMapping("{category}/win")
	public String winner(
			@PathVariable String category,
			CsEventManage dto,
			@RequestParam String page) throws Exception {
		
		try {
			service.insertEventWinner(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/cs/event/winner/list?page=" + page;
	}
	
	
	
	
}
