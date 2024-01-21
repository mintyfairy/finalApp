package com.fa.plus.controller.campsite;

import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.service.MemberService;
import com.fa.plus.service.site.SiteService;

@Controller
@RequestMapping("/campsite/*")
public class SiteCartController {
	@Autowired
	private SiteService service;
	@Autowired
	private MemberService memberService;

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
			service.deleteTrashBook(info.getMemberIdx());
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
	public String bookform(
			@RequestParam("nums") Long[] detailNum,
			@RequestParam("endDate") String[] endDate,
			@RequestParam("startDate") String[] startDate,
			@RequestParam("thumbnail") String[] thumbnail,
			@RequestParam("detailName") String[] detailName,
			@RequestParam("siteName") String[] siteName,
			@RequestParam("bookPrice") int[] bookPrice,
			RedirectAttributes rattr ,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<SiteCart> list=new ArrayList<SiteCart>();
		SiteCart dto=null;
		try {
			
			for (int a=0;a< detailNum.length;a++) {
				dto=new SiteCart();
				dto.setMemberIdx(info.getMemberIdx());
				dto.setDetailNum(detailNum[a]);
				dto.setStartDate(startDate[a]);
				dto.setEndDate(endDate[a]);
				dto.setPeriodPrice(bookPrice[a]);
				dto.setThumbnail(thumbnail[a]);
				dto.setDetailName(detailName[a]);
				dto.setSiteName(siteName[a]);
				list.add(dto);
			}
			Map<String, Object> map=service.insertBookList(list);
			
			
			rattr.addFlashAttribute("map", map);
			rattr.addFlashAttribute("listNum", map.get("listNum"));
			rattr.addFlashAttribute("totalPrice", map.get("totalPrice"));
			rattr.addFlashAttribute("perchaseMethod", map.get("perchaseMethod"));
			rattr.addFlashAttribute("list", list);//리다이렉트 어트리뷰트는 객체도되는지?
		} catch (ArrayIndexOutOfBoundsException e) {
			// TODO: handle exception
			e.printStackTrace();
			return "/";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/campsite/go";
	}
	@GetMapping("go")
	public String perchaseForm(
			//@ModelAttribute("map") Map<String, Object> map,
			@ModelAttribute("listNum") int listNum,
			@ModelAttribute("perchaseMethod") String perchaseMethod,
			@ModelAttribute("totalPrice") int totalPrice,
			@ModelAttribute("list") List<SiteCart> list,
			Model model,HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			Member member =memberService.findById(info.getMemberIdx());
			//System.out.println(map.get("perchaseMethod"));
			
			model.addAttribute("member", member);
			model.addAttribute("list", list);
			model.addAttribute("nowdate",  LocalDate.now());
			model.addAttribute("listNum", listNum);
			model.addAttribute("totalPrice",totalPrice );
			model.addAttribute("perchaseMethod", perchaseMethod);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "/";
		}
		
		return ".campsite.reservation";
	}
	@PostMapping("go")
	public String perchaseSubmit(
			@RequestParam("listNum") int listNum,
			@RequestParam("perchaseMethod") String perchaseMethod,
			@RequestParam("totalPrice") int totalPrice,
			Model model,HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("memberIdx", info.getMemberIdx());
			map.put("listNum", listNum);
			map.put("perchaseMethod", perchaseMethod);
			map.put("totalPrice", totalPrice);
			
			service.insertPerchase(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "/";
		}
		
		return "redirect:/site/mypage/bookList";
	}
}
