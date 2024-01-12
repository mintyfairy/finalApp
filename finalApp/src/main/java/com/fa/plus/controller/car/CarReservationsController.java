package com.fa.plus.controller.car;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			CarReservation SearchDto,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}

			Member orderUser = memberService.findById(info.getMemberIdx());

			CarReservation dto = service.findById(SearchDto.getCarNum());
			
			dto.setStart_date(SearchDto.getStart_date());
			dto.setEnd_date(SearchDto.getEnd_date());
			
			List<Map<String, Long>> list = new ArrayList<Map<String,Long>>();
			List<CarReservation> listSelectCar = service.listSelectCar(list);
			
			String orderNum = null; // 주문번호
			int totalMoney = 0; // 상품합
			int payment = 0;  // 결제할 금액(상품합 + 배송비)
			int discount = 0; // 총 할인액
			
			orderNum = service.carReservationOrderNumber();
			
			// String start_date = dto.getStart_date();
			// String end_date = dto.getEnd_date();
			
			
			model.addAttribute("carReservationOrderNumber", orderNum);
			model.addAttribute("listSelectCar", listSelectCar);
			model.addAttribute("dto", dto);
			model.addAttribute("carNum", SearchDto.getCarNum());
			model.addAttribute("orderUser", orderUser);
			// model.addAttribute("start_date", start_date);
			// model.addAttribute("end_date", end_date);
			// model.addAttribute("userName", info.getUserName());
			
			return ".car.reservation.orderPage";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
}
