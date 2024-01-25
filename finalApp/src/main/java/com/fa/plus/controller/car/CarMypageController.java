package com.fa.plus.controller.car;

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

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.domain.car.CarReservation;
import com.fa.plus.service.MemberService;
import com.fa.plus.service.car.CarMyPageService;
import com.fa.plus.service.car.CarQnaService;

@Controller
@RequestMapping("/car/mypage/*")
public class CarMypageController {
	@Autowired
	private CarMyPageService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("zzim")
	public String zzim() throws Exception {
		
		return ".car.zzim";
	}
	
	@RequestMapping("rider")
	public String rider(
			HttpSession session,
			Model model) throws Exception {	
		
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			// CarMyPage dto=new CarMyPage();
			// dto.setLicenseDate(dto.getLicenseDate());
			// Member orderUser = memberService.findById(info.getMemberIdx());
			// CarMyPage riderInfo = service.riderInfo(info.getMemberIdx());
			CarMyPage dto = service.riderInfo(info.getMemberIdx());
			
			model.addAttribute("dto", dto);
			// model.addAttribute("orderUser", orderUser);
			// model.addAttribute("riderInfo", riderInfo);
		
		return ".car.mypage.rider";
		
		
	}
	
	@GetMapping("addrider")
	public String riderForm(HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		//if(info == null) {
		//	return "redirect:/member/login";
		//}
		
		Member orderUser = memberService.findById(info.getMemberIdx());
		model.addAttribute("orderUser", orderUser);
		
		CarMyPage dto = service.riderInfo(info.getMemberIdx());
		model.addAttribute("dto", dto);
		
		model.addAttribute("mode", "addrider");
		
		
		return ".car.mypage.addrider";
	}
	
	@PostMapping("addrider")
	public String addriderOk(CarMyPage dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "mypage";
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			service.insertRider(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/car/mypage/rider";
	}
	
	@GetMapping("update")
	public String updateForm(HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member orderUser = memberService.findById(info.getMemberIdx());
		
		CarMyPage dto = service.riderInfo(info.getMemberIdx());
		if (dto == null) {
			return "redirect:/car/mapage/rider";
		}
		
		model.addAttribute("orderUser", orderUser);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".car.mypage.addrider";
	}
	
	@PostMapping("update")
	public String updateSubmit(CarMyPage dto,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "car/mypage";
		try {
			service.updateRider(dto, pathname);
			
		} catch (Exception e) {
		}
		
		return "redirect:/car/mypage/rider";
	}
	
	// 결제 내역
	@GetMapping("paymentList")
	public String paymentList(@RequestParam(value = "page", defaultValue = "1") int current_page,
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
		
		dataCount = service.countCarPayment(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<CarReservation> list = service.listCarPayment(map);
		
		String listUrl = cp + "/car/mypage/paymentList";
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		
		return ".car.mypage.paymentList";
		
	}	
	
	// 마이페이지-리뷰/Q&A
		@GetMapping("question")
		public String question(
				@RequestParam(defaultValue = "question") String mode,
				Model model) throws Exception {
			
			model.addAttribute("mode", mode);
			return ".car.mypage.question";
		}
	
		
}
