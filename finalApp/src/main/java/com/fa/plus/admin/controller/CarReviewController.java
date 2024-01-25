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

import com.fa.plus.admin.domain.car.CarQna;
import com.fa.plus.admin.service.car.CarQnaManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.car.CarQnaService;

@Controller
@RequestMapping("/admin/carQna/*")
public class CarReviewController {
	@Autowired 
	private MyUtil myUtil;
	
	@Autowired
	private CarQnaManageService service;
	
	@Autowired
	private CarQnaService qnaService;
	
	/*
	@RequestMapping("review")
	public String review() {
		return ".admin.carReview.review";
	}
	*/
	
	@RequestMapping("qna")
	public String qna(@RequestParam(value = "page", defaultValue = "1") int current_page, 
			@RequestParam(defaultValue = "1") int mode, 
			@RequestParam(defaultValue = "question_date") String col, 
			HttpServletRequest req, 
			HttpSession session, 
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			int tab = 2;
			
			map.put("mode", mode);
			map.put("col", col);
			
			map.put("memberIdx", info.getMemberIdx());
			dataCount = service.qnaCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<CarQna> list = service.listQna(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/carQna/qna";
			
			if(mode != 1) {
				listUrl += "?mode=" + mode + "&col=" + col;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
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
		
		return ".admin.carReview.qna";
	}
	
	@PostMapping("qna/answer")
	public String qnaAnswer(com.fa.plus.domain.car.CarQna dto,  @RequestParam String page, 
			@RequestParam int mode,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setAnswerId(info.getUserId());
			qnaService.updateQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/carQna/qna?";
		if(mode == 1) {
			url += "page=" + page;
		} else {
			url += "mode=" + mode + "&page=" + page;
		}
		return url;
	}
	
	@GetMapping("qna/delete")
	public String questionDelete(@RequestParam long qnaNum,
			@RequestParam String page,
			@RequestParam int mode,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		
		try {
			qnaService.deleteQuestion(qnaNum, pathname);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/carQna/qna?";
		if(mode == 1) {
			url += "page=" + page;
		} else {
			url += "mode=" + mode + "&page=" + page;
		}
		return url;
	}
	
}

