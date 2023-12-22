package com.fa.plus.controller.car;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/car/*")

public class MainCarController {
	
	@RequestMapping(value="main", method = RequestMethod.GET)
	String carHome(Locale locale, Model model) {
		return ".car.main";
	}
}
