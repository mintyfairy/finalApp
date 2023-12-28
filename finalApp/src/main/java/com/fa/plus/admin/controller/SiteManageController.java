package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/siteManage/*")
public class SiteManageController {
	
	@RequestMapping(value="siteManage", method=RequestMethod.GET)
	public String list() {
		return ".admin.siteManage.siteManage";
	}
	@RequestMapping(value="roomList/{num}", method=RequestMethod.GET)
	public String roomList(@PathVariable int num) {
		return ".admin.siteManage.roomManage";
	}
}
