package com.fa.plus.controller.campsite;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.site.Book;
import com.fa.plus.domain.site.SiteReview;
import com.fa.plus.service.site.SiteService;


@Controller
@RequestMapping("/site/mypage/*")
public class SiteMypageController {
	@Autowired
	private SiteService service;
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("bookList")
	public String paymentList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		int size = 5;
		int total_page;
		int dataCount;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.dataCountBook(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Book> list = service.listBook(map);
		
		String listUrl = cp + "/site/mypage/bookList";
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		
		return ".campsite.mypage.bookList";
	}

	//String path = root + "uploads" + File.separator + "siteReview"; 파일 저장주소는 이걸 사용 
	
	
	
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object> writeSubmit(SiteReview dto,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		String state = "true";
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setMemberIdx(info.getMemberIdx());
			
			service.insertReview(dto, pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

}
