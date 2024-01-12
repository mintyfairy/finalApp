package com.fa.plus.controller.car;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/car/*")
public class CarMypageController {
	
	@GetMapping("mypage.zzim")
	public String zzim() throws Exception {
		
		return ".car.zzim";
	}
}
