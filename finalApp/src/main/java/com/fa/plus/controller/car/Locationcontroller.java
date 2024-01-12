package com.fa.plus.controller.car;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/car/*")
public class Locationcontroller {
	
	@GetMapping("location")
	public String main() throws Exception {
		
		
		
		return ".car.location.location";
	}
}
