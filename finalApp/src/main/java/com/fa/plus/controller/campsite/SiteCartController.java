package com.fa.plus.controller.campsite;

import java.util.ArrayList;
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
	public String listCart(HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<SiteCart> list = service.listCart(info.getMemberIdx());

		model.addAttribute("list", list);

		return ".campsite.cart";
	}

	@PostMapping("deleteListCart") // 좌측상단선택삭제를 누르면 선택한 내역이 삭제됨
	public String deleteListCart(@RequestParam("nums") Long[] detailNum, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("gubun", "items"); // gubun은 item, list를 가진다. item이라면 detailNum, list면 detailNum필요
			map.put("memberIdx", info.getMemberIdx());
			for (long a : detailNum) {
				map.put("detailNum", a);
				service.deleteCart(map);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/campsite/cart";
	}

	@RequestMapping("saveCart")
	@ResponseBody
	public Map<String, Object> saveCart(SiteCart dto, HttpServletRequest req,HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		model.put("state", "false");
		try {
			dto.setMemberIdx(info.getMemberIdx());
			service.insertCart(dto);
			model.put("state", "Post");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			model.put("state", "GET");
		}
		return model;

	}
	@GetMapping("deleteAllCart")
	public String deleteAllCart(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			service.deleteAllCart(info.getMemberIdx());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/campsite/cart";
	}
	

	@PostMapping("reservation") // 좌측상단선택삭제를 누르면 선택한 내역이 삭제됨
	public String bookgogo(
			@RequestParam("nums") Long[] detailNum,
			@RequestParam("endDate") String[] endDate,
			@RequestParam("startDate") String[] startDate,
			@RequestParam("bookPrice") int[] bookPrice,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<SiteCart> list=new ArrayList<SiteCart>();
		try {
			SiteCart dto=new SiteCart();
			
			dto.setMemberIdx(info.getMemberIdx());
			for (int a=0;a< detailNum.length;a++) {
				dto.setDetailNum(detailNum[a]);
				dto.setStartDate(startDate[a]);
				dto.setEndDate(endDate[a]);
				dto.setPeriodPrice(bookPrice[a]);
				list.add(dto);
			}
			service.insertPerchase(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/site/mypage/bookList";
	}
}
