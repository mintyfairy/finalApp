package com.fa.plus.controller.car;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.service.MemberService;
import com.fa.plus.service.car.CarReservationService;

@Controller
@RequestMapping("/car/*")
public class CarReservationsController {
	@Autowired
	private CarReservationService service;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("orderPage")
	public String paymentForm(
			@RequestParam long carNum,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			com.fa.plus.domain.SessionInfo info = (com.fa.plus.domain.SessionInfo)session.getAttribute("member");
			com.fa.plus.domain.Member orderUser = memberService.findById(info.getMemberIdx());
			
			String OrderNum = null; // 주문번호
			int totalMoney = 0; // 상품합
			int payment = 0;  // 결제할 금액(상품합 + 배송비)
			int discount = 0; // 총 할인액
			
			
			
			model.addAttribute("carNum", carNum);
			model.addAttribute("orderUser", orderUser);
			
			return ".car.orderPage";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
}
