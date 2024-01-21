package com.fa.plus.controller.shop;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.shop.Review;
import com.fa.plus.domain.shop.Summary;
import com.fa.plus.service.shop.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// AJAX - JSON
		@PostMapping("write")
		@ResponseBody
		public Map<String, Object> writeSubmit(Review dto,
				HttpSession session) throws Exception {
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "shop";
			
			String state = "true";
			try {
				
				SessionInfo info = (SessionInfo)session.getAttribute("member");
				dto.setMemberIdx(info.getMemberIdx());
				//dto.setOrderDetailNum(info.getMemberIdx());
				
				service.insertReview(dto, pathname);
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
				@RequestParam long productNum,
				@RequestParam(defaultValue = "0") int sortNo,
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");		
			Map<String, Object> model = new HashMap<String, Object>();
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				
				int size = 5;
				int dataCount = 0;
				
				map.put("productNum", productNum);
				Summary summary = service.findByReviewSummary(map);
				
				if(summary == null) {
					return model;
				}
				
				dataCount = summary.getCount();
				int total_page = myUtil.pageCount(dataCount, size);
				if (current_page > total_page) {
					current_page = total_page;
				}

				int offset = (current_page - 1) * size;
				if(offset < 0) offset = 0;

				map.put("sortNo", sortNo);
				map.put("offset", offset);
				map.put("size", size);

				List<Review> list = service.listReview(map);
				if(info != null) {
					for(Review dto : list) {
						if(info.getMemberIdx() == info.getMemberIdx()) {
							dto.setDeletePermit(true);
						}
					}
				}
				
				String paging = myUtil.pagingFunc(current_page, total_page, "listReview");
				
				model.put("list", list);
				model.put("summary", summary);
				model.put("dataCount", dataCount);
				model.put("size", size);
				model.put("pageNo", current_page);
				model.put("paging", paging);
				model.put("total_page", total_page);
				
			} catch (Exception e) {
			}
			
			return model;
		}
		
		// AJAX - JSON : 마이페이지 - 내가 쓴 리뷰
		@GetMapping("list2")
		@ResponseBody
		public Map<String, Object> list2(
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				HttpSession session) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");		
			Map<String, Object> model = new HashMap<String, Object>();
			
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				
				int size = 5;
				int dataCount = 0;
				
				map.put("memberIdx", info.getMemberIdx());
				
				dataCount = service.dataCount2(map);
				
				int total_page = myUtil.pageCount(dataCount, size);
				if (current_page > total_page) {
					current_page = total_page;
				}

				int offset = (current_page - 1) * size;
				if(offset < 0) offset = 0;

				map.put("offset", offset);
				map.put("size", size);

				List<Review> list = service.listReview2(map);
				
				String paging = myUtil.pagingFunc(current_page, total_page, "listReview");
				
				model.put("list", list);
				model.put("dataCount", dataCount);
				model.put("size", size);
				model.put("pageNo", current_page);
				model.put("paging", paging);
				model.put("total_page", total_page);
				
			} catch (Exception e) {
			}
			
			return model;
		}
		
		   @GetMapping("delete")
		   public String reviewDelete(@RequestParam long orderDetailNum, 
		         HttpSession session) throws Exception {
		      
		      String root = session.getServletContext().getRealPath("/");
		      String pathname = root + "uploads" + File.separator + "shop";
		      
		      try {
		         service.deleteReview(orderDetailNum, pathname);
		      } catch (Exception e) {
		      }
		      
		      String url = "redirect:/shop/myPage/review";
		      
		      return url;
		   }
}
