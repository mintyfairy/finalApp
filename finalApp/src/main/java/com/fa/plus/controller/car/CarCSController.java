package com.fa.plus.controller.car;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/car/*")
public class CarCSController {
	
	@GetMapping("cs.faq")
	public String faq() throws Exception {
		
		return ".car.cs.faq";
	}
	@GetMapping("cs.notice")
	public String notice() throws Exception {
		
		return ".car.cs.notice";
	}
}
