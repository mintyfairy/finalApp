package com.fa.plus.controller.car;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.car.CarReservation;
import com.fa.plus.service.MemberService;
import com.fa.plus.service.car.CarReservationService;

@Controller
@RequestMapping("/car/reservation/*")
public class CarReservationsController {
	@Autowired
	private CarReservationService service;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("orderPage")
	public String paymentForm(
			CarReservation searchDto,
			@RequestParam int fee,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			Member orderUser = memberService.findById(info.getMemberIdx());
			
			String carReservationOrderNumber = null;
			carReservationOrderNumber = service.carReservationOrderNumber();
			

			CarReservation dto = service.findById(searchDto.getCarNum());
			
			dto.setStart_date(searchDto.getStart_date());
			dto.setEnd_date(searchDto.getEnd_date());
			dto.setTotMoney(searchDto.getTotMoney());
			dto.setDiscount(searchDto.getTotMoney() - searchDto.getFee());
			dto.setFee(searchDto.getFee());
			dto.setDiscountRate(searchDto.getDiscountRate());
			dto.setPayment(searchDto.getFee());
			
			List<Map<String, Long>> list = new ArrayList<Map<String,Long>>();
			List<CarReservation> listSelectCar = service.listSelectCar(list);
			
			
			model.addAttribute("carReservationOrderNumber", carReservationOrderNumber);
			model.addAttribute("listSelectCar", listSelectCar);
			model.addAttribute("dto", dto);
			model.addAttribute("orderUser", orderUser);

			// model.addAttribute("userName", info.getUserName());
			
			return ".car.reservation.orderPage";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
	@PostMapping("paymentOk")
	public String paymentSubmit(
			CarReservation dto,
			RedirectAttributes reAttr,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		try {
			dto.setMemberIdx(info.getMemberIdx());
			
			service.insertCarReservation(dto);
			
			
			String p = String.format("%,d", dto.getPayment());
			
			StringBuilder sb = new StringBuilder();
			sb.append(info.getUserName() + "님 캠핑카가 예약되었습니다.<br>");
			sb.append("기간 : "+dto.getStart_date()+"~"+dto.getEnd_date()+"<br>");
			sb.append("결제 금액 : <label class='fs-5 fw-bold text-primary'>" +  p + "</label>원");

			reAttr.addFlashAttribute("title", "결제 완료");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/car/reservation/complete";
					
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message
			) throws Exception {
		// F5를 누른 경우
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		return ".car.reservation.complete";
	}
}
