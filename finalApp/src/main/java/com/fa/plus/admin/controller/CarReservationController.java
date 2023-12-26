package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CarReservationController {
	 
	@RequestMapping(value="/admin/carReservation/*", method=RequestMethod.GET)
	public String method() {
		return ".admin.carReservation.reservation";
	}
}

