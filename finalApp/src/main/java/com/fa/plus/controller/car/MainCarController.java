package com.fa.plus.controller.car;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.car.CampingCar;
import com.fa.plus.service.car.CampingCarService;

@Controller
@RequestMapping("/car/*")
public class MainCarController {
	@Autowired
	private CampingCarService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping(value="main")
	public String main(
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		map.put("schType", schType);
		map.put("kwd", kwd);
		// map.put("carNum", carNum);

		// 글 리스트
		List<CampingCar> list = service.listCampingCar(map);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		// model.addAttribute("carNum",carNum);

		return ".car.main";
		
	}
	
	
	@GetMapping("car_detail")
	public String buyRequest(@RequestParam(name = "carNum") long carNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			CampingCar dto = service.findById(carNum);
			if(dto == null) {
				return "redirect:/car/main";
			}
			
			// 추가 이미지
			List<CampingCar> listFile = service.listCarFile(carNum);
			
			dto.setImageFilename(dto.getThumbnail());
			listFile.add(0, dto);
			
			dto.setFee(dto.getFee());
			
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
			
			
		} catch (Exception e) {
			// return "redirect:/car/main";
		}
		return ".car.car_detail";
	}
	
	/*
	@GetMapping("car_detail")
	public String article(@RequestParam long carNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		// 해당 레코드 가져 오기
		CampingCar dto = service.findById(carNum);
		if (dto == null) {
			return "redirect:/car/main";
		}
		
		// 스마트 에디터를 사용하므로
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));

		
		model.addAttribute("dto", dto);
		
		
		return ".car.car_detail";
	}
	*/
	
	
}
