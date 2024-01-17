package com.fa.plus.controller.car;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.service.MemberService;
import com.fa.plus.service.car.CarMyPageService;

@Controller
@RequestMapping("/car/mypage/*")
public class CarMypageController {
	@Autowired
	private CarMyPageService service;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("zzim")
	public String zzim() throws Exception {
		
		return ".car.zzim";
	}
	
	@RequestMapping("rider")
	public String rider(
			CarMyPage dto,
			HttpSession session,
			Model model) throws Exception {	
		
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			Member orderUser = memberService.findById(info.getMemberIdx());
			
			model.addAttribute("dto", dto);
			model.addAttribute("orderUser", orderUser);
		
		return ".car.mypage.rider";
		
		
	}
	
	@GetMapping("addrider")
	public String riderForm(HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Member orderUser = memberService.findById(info.getMemberIdx());
		model.addAttribute("orderUser", orderUser);
		
		model.addAttribute("mode", "addrider");
		
		
		return ".car.mypage.addrider";
	}
	
	@PostMapping("addrider")
	public String addriderOk(CarMyPage dto,
			HttpSession session) throws Exception {
		
		try {
			
			service.insertRider(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/car/mypage/rider";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam String userId,
			HttpSession session,
			Model model) throws Exception {
		
		CarMyPage dto = service.riderInfo(userId);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".car.mypage.rider";
	}
	
	@PostMapping("update")
	public String updateSubmit(CarMyPage dto,
			HttpSession session) throws Exception {
		
		try {
			service.updateRider(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/car/mypage/rider";
	}
}
