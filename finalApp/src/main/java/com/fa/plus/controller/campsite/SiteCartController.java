package com.fa.plus.controller.campsite;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.service.site.SiteService;


@Controller
@RequestMapping("/campsite/*")
public class SiteCartController {
	@Autowired
	private SiteService service;
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("cart")
	public String listCart(HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");

			List<SiteCart> list = service.listCart(info.getMemberIdx());
			
			model.addAttribute("list", list);
		
		return ".campsite.cart";
	}

	//ㅏㅈ작동안됨
	@GetMapping("deleteCart")
	public String deleteCart(
			HttpSession session, Model model)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberIdx", info.getMemberIdx());
			
		} catch (Exception e) {			
		}		
		return "redirect:/campsite/cart";
		
		
	}
	
	@PostMapping("deleteListCart")
	public String deleteListCart(
			@RequestParam List<Long> nums,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("memberIdx", info.getMemberIdx());   //map초기화
			map.put("list", nums);
			
			//향상된  for문 구현   list를 돌려서 안의 nums를 map.put으로 돌리자.. ????
			
			   for (Long num : nums) {
		            map.put("num", num);
		        }
			   
			   
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/campsite/cart"; 
	}
	
	@PostMapping("saveCart")
	public String saveCart(
			SiteCart dto,
			HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			service.insertCart(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/campsite/cart";
		
	}
	/*
	
	//예약캠핑장 하나 지우기
	@GetMapping("deleteCart")
	public String deleteCart(SiteCart dto,
			HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
	
		try {
			dto.setMemberIdx(info.getMemberIdx());
		//	dto.setDetailNum(info.get);      //detailnum 이 안넘어옴
		} catch (Exception e) {	
		}	
			
		return "redirect:/campsite/cart";
		
	}
		*/
}
