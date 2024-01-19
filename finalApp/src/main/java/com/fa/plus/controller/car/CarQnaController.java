package com.fa.plus.controller.car;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.car.CarQna;
import com.fa.plus.service.car.CarQnaService;

@RestController // @Controller + @ResponseBody
@RequestMapping("/car/qna/*")
public class CarQnaController {
	@Autowired
	private CarQnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// AJAX - JSON
		@PostMapping("write")
		public Map<String, Object> writeSubmit(CarQna dto,
				HttpSession session) throws Exception {
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "carqna";
			
			String state = "true";
			try {
				
				SessionInfo info = (SessionInfo)session.getAttribute("member");
				dto.setMemberIdx(info.getMemberIdx());
				
				service.insertCarQna(dto, pathname);
			} catch (Exception e) {
				state = "false";
			}
			
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("state", state);
			return model;
		}
		
		// AJAX - JSON
		@GetMapping("list")
		public Map<String, Object> list(
				@RequestParam long carNum,
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				
				int size = 3;
				int dataCount = 0;
				
				map.put("memberIdx", info.getMemberIdx());
				map.put("carNum", carNum);
				
				dataCount = service.dataCount(map);
				int total_page = myUtil.pageCount(dataCount, size);
				if (current_page > total_page) {
					current_page = total_page;
				}

				int offset = (current_page - 1) * size;
				if(offset < 0) offset = 0;

				map.put("offset", offset);
				map.put("size", size);

				List<CarQna> list = service.listCarQna(map);
				for(CarQna dto : list) {
					if(dto.getSecret() == 1 && (info == null || (info.getMembership() < 50 && dto.getMemberIdx() != info.getMemberIdx()))) {
						dto.setQuestion("비밀글 입니다. <i class='bi bi-file-lock2'></i>");
						dto.setAnswer("");
					}
				}
				
				String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
				
				model.put("list", list);
				model.put("dataCount", dataCount);
				model.put("size", size);
				model.put("pageNo", current_page);
				model.put("paging", paging);
				model.put("total_page", total_page);
				model.put("carNum", carNum);
				
			} catch (Exception e) {
			}
			
			return model;
		}
}
