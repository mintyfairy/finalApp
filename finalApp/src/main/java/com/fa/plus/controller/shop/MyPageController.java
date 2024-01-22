package com.fa.plus.controller.shop;

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

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.shop.Order;
import com.fa.plus.domain.shop.Payment;
import com.fa.plus.service.shop.MyPageService;

@Controller
@RequestMapping("/shop/myPage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// 결제 내역 
	@GetMapping("main")
	public String main(
			@RequestParam(value= "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int buyQtys,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.countPayment(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Payment> list = service.listPayment(map);
		
		String listUrl = cp + "/shop/myPage/main";
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("buyQtys", buyQtys);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);	
		
		return ".shop.myPage.main";
	}
	
	// 구매 확정
	@RequestMapping("confirmation")
	public String confirmation(@RequestParam Map<String, Object> paramMap,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			paramMap.put("detailState", 1);
			paramMap.put("stateMemo", "구매확정완료");
			paramMap.put("memberIdx", info.getMemberIdx());
			
			service.updateOrderDetailState(paramMap);
		} catch (Exception e) {
		}
		
		return "redirect:/shop/myPage/main?page="+page;
	}
	
	// 주문취소/반품/교환요청
	@PostMapping("orderDetailUpdate")
	public String orderDetailUpdate(@RequestParam Map<String, Object> paramMap,
				@RequestParam String page,
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			paramMap.put("memberIdx", info.getMemberIdx());
			
			service.updateOrderDetailState(paramMap);
		} catch (Exception e) {
		}
		return "redirect:/shop/myPage/main?page="+page;
	}
	
	@GetMapping("updateOrderHistory")
	public String updateOrderHistory(@RequestParam long orderDetailNum,
				@RequestParam String page,
				HttpSession session) throws Exception {
		
		try {
			service.updateOrderHistory(orderDetailNum);
		} catch (Exception e) {
		}
		
			return "redirect:/shop/myPage/main?page="+page;	
	}
	
	// 장바구니 리스트
	@GetMapping("cart")
	public String listCart(HttpSession session,
				Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<Order> list = service.listCart(info.getUserId());
		
		model.addAttribute("list", list);
		
		return ".shop.myPage.cart";
	}
	
	// 장바구니 저장
	@PostMapping("saveCart")
	public String saveCart(Order dto,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			try {
				dto.setUserId(info.getUserId());
				dto.setMemberIdx(info.getMemberIdx());
				
				service.insertCart(dto);
				
			} catch (Exception e) {
			}
		
			return "redirect:/shop/myPage/cart";
	}
	
	// 하나 상품 장바구니 구하기
	@GetMapping("deleteCart")
	public String deleteCart(@RequestParam long detailNum2,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "item");
				map.put("userId", info.getUserId());
				map.put("detailNum2", detailNum2);
				
				service.deleteCart(map);
				
			} catch (Exception e) {
			}
			
			return "redirect:/shop/myPage/cart";
	}
	
	// 선택상품 장바구니 비우기
	@PostMapping("deleteListCart")
	public String deleteListCart(@RequestParam List<Long> nums,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "list");
				map.put("userId", info.getUserId());
				map.put("list", nums);
				
				service.deleteCart(map);
				
			} catch (Exception e) {
			}
				return "redirect:/shop/myPage/cart";
	}
	
	// 장바구니 모두 비우기
	@GetMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "all");
				map.put("userId", info.getUserId());
				
				service.deleteCart(map);
				
			} catch (Exception e) {
			}
			
			return "redirect:/shop/myPage/cart";
	}
	
	// 마이페이지 - 리뷰/Q&A
	@GetMapping("review")
	public String review(@RequestParam(defaultValue = "review") String mode,
				Model model) throws Exception {
		
			model.addAttribute("mode", mode);
			return ".shop.myPage.review";
	}
}
