package com.fa.plus.controller.campsite;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

			List<SiteCart> list = service.listCart(info.getmemberIdx());
			
			model.addAttribute("list", list);
		
		return ".campsite.cart";
	}
		
		
	
}
