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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.shop.ShopQuestion;
import com.fa.plus.admin.domain.shop.ShopReview;
import com.fa.plus.admin.service.shop.ShopCustomerManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/shopCustomer/*")
public class ShopCustomerController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private ShopCustomerManageService service;

	@RequestMapping("review")
	public String review(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			@RequestParam(defaultValue = "1") int mode, 
			@RequestParam(defaultValue = "reviewDate") String col, 
			HttpServletRequest req, 
			HttpSession session, 
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			int tab = 1;
		
			map.put("mode", mode);
			map.put("col", col);
			map.put("memberIdx", info.getMemberIdx());
			dataCount = service.reviewCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<ShopReview> list = service.listReview(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/shopCustomer/review";
			if(mode != 1) {
				listUrl += "?mode=" + mode + "&col=" + col;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			
			System.out.println("!!!!!!!!!!!!@@@@@@@@@@@@@@ review" + list);
			
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			model.addAttribute("mode", mode);
			model.addAttribute("tab", tab);
			model.addAttribute("col", col);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".admin.shopCustomer.review";
	}
	
	@PostMapping("review/answer")
	@ResponseBody
	public Map<String, Object> reviewAnswer(
			@RequestParam Map<String, Object> paramMap, 
			HttpSession session) {
		String state = "true";
		System.out.println("!!!!@@@@####$%%" + paramMap.get("showReview"));
		
		try {
			service.updateReview(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("review/delete")
	public String reviewDelete(@RequestParam long orderDetailNum, 
			@RequestParam String page, 
			@RequestParam int mode, 
			@RequestParam String col, 
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		try {
			service.deleteReview(orderDetailNum, pathname);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/shopCustomer/review?";
		if(mode == 1) {
			url += "page=" + page + "&col=" + col;
		} else {
			url += "mode=" + mode + "&page=" + page + "&col=" + col;
		}
		
		return url;
	}
	
	@RequestMapping("question")
	public String question(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			@RequestParam(defaultValue = "1") int mode, 
			@RequestParam(defaultValue = "questionDate") String col, 
			HttpServletRequest req, 
			HttpSession session, 
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			int tab = 2;
			
			map.put("mode", mode);
			map.put("col", col);
			map.put("questionIdx", info.getMemberIdx());
			dataCount = service.questionCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<ShopQuestion> list = service.listQuestion(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/shopCustomer/question";
			if(mode != 1) {
				listUrl += "?mode=" + mode + "&col=" + col;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			System.out.println("!!!!!!!!!!!!@@@@@@@@@@@@@@ question" + list);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			model.addAttribute("mode", mode);
			model.addAttribute("tab", tab);
			model.addAttribute("col", col);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".admin.shopCustomer.question";
	}
	
	@PostMapping("question/answer")
	@ResponseBody
	public Map<String, Object> questionAnswer(
			@RequestParam Map<String, Object> paramMap, 
			HttpSession session) {
		String state = "true";
		System.out.println("!!!!@@@@####$%%" + paramMap.get("showQuestion"));
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			paramMap.put("answerIdx", info.getMemberIdx());
			service.updateQuestion(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("question/delete")
	public String questionDelete(@RequestParam long qnaNum, 
			@RequestParam String page, 
			@RequestParam int mode, 
			@RequestParam String col, 
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		try {
			service.deleteQuestion(qnaNum, pathname);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/shopCustomer/question?";
		if(mode == 1) {
			url += "page=" + page + "&col=" + col;
		} else {
			url += "mode=" + mode + "&page=" + page + "&col=" + col;
		}
		
		return url;
	}
}
