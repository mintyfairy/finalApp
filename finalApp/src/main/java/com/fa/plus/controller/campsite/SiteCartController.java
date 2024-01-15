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

	
	
	@PostMapping("deleteListCart")  //좌측상단선택삭제를 누르면 선택한 내역이 삭제됨
	public String deleteListCart(
			@RequestParam("detailNum") Long detailNum,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("gubun", "items"); //gubun은 item, list를 가진다. item이라면 detailNum, list면 detailNum필요
			map.put("memberIdx", info.getMemberIdx());  
			map.put("detailNum", detailNum);
			   
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/campsite/cart"; 
	}
	
	/*
	@GetMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "all");
			map.put("memberIdx", info.getMemberIdx());
			
			service.deleteCart(map);
		} catch (Exception e) {			
		}
		return "redirect:/campsite/cart";
		
	}
	
	*/
	
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
