package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.shop.ShopOrderDetailManage;
import com.fa.plus.admin.domain.shop.ShopOrderManage;
import com.fa.plus.admin.service.shop.ShopOrderManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/shopOrder/*")
public class ShopOrderController {
	@Autowired
	private ShopOrderManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("{orderStatus}")
	public String list(
			@PathVariable String orderStatus,
			@RequestParam(defaultValue = "1") int state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderNum") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, 
			Model model) throws Exception {
		// 주문 현황
		// state : 1-전체, 2-결제완료, 3-배송단계
		// orderStatus : 주문관리-status, 주문상세-detail, 배송관리-delivery, 교환관리-exchange, 반품 및 주문취소-cancel
				
		if(orderStatus.equals("delivery")) {
			state = 3;
		}
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.orderCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ShopOrderManage> list = service.listOrder(map);
		
		String listUrl = cp + "/admin/shopOrder/" + orderStatus;
		
		String query = "state=" + state;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}		
		listUrl += "?" + query;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("orderStatus", orderStatus);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("state", state);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".admin.shopOrder.order";
	}
	
	@GetMapping("detail/{orderNum}")
	public String detail(
			@PathVariable long orderNum, 
			@RequestParam String orderStatus, 
			Model model) throws Exception {
				
		ShopOrderManage order = service.findById(orderNum);
		
		List<ShopOrderDetailManage> listDetail = service.orderDetails(orderNum);
		
		List<Map<String, Object>> listDeliveryCompany = service.listDeliveryCompany();
		
		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);
		model.addAttribute("listDeliveryCompany", listDeliveryCompany);
		model.addAttribute("orderStatus", orderStatus);
		
		return ".admin.shopOrder.detail";
	}
	
	@PostMapping("detail/pay")
	@ResponseBody
	public Map<String, Object> pay(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.updateOrder("state", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("detail/invoiceNumber")
	@ResponseBody
	public Map<String, Object> invoiceNumber(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		String url = null;
		
		try {
			service.updateOrder("invoiceNumber", paramMap);
			url = "${pageContext.request.contextPath}/admin/shopOrder/status";
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("orderStatus", "status");
		model.put("url", url);
		return model;
	}
	
	@RequestMapping("detail/delivery")
	@ResponseBody
	public Map<String, Object> delivery(
			@RequestParam long orderNum, 
			@RequestParam String orderState) {
		// 배송 상태 변경
		String state = "true";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("orderNum", orderNum);
		paramMap.put("orderState", orderState);
		
		try {
			service.updateOrder("delivery", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("detail/cancel")
	@ResponseBody
	public Map<String, Object> cancel(
			@RequestParam long orderNum, 
			@RequestParam long orderDetailNum, 
			@RequestParam long productNum, 
			@RequestParam long detailNum, 
			@RequestParam long detailNum2, 
			@RequestParam int orderState, 
			@RequestParam int cancelAmount
			) {
		String state = "true";
		
		Map<String, Object> totalStockMap = new HashMap<String, Object>();
		totalStockMap.put("productNum", productNum);
		totalStockMap.put("detailNum", detailNum);
		totalStockMap.put("detailNum2", detailNum2);
		
		int totalStock = 0; 
		totalStock= service.selectTotalStock(totalStockMap);
		System.out.println("@@@@@@@@@@@@@@:" + totalStock);
		totalStock = totalStock + cancelAmount;
		
		Map<String, Object> updateStateMap = new HashMap<String, Object>();
		updateStateMap.put("orderNum", orderNum);
		updateStateMap.put("orderState", 6);
		
		Map<String, Object> cancelAmountMap = new HashMap<String, Object>();
		cancelAmountMap.put("orderNum", orderNum);
		cancelAmountMap.put("cancelAmount", cancelAmount);
		
		Map<String, Object> updateStockMap = new HashMap<String, Object>();
		updateStockMap.put("productNum", productNum);
		updateStockMap.put("detailNum", detailNum);
		updateStockMap.put("detailNum2", detailNum2);
		updateStockMap.put("totalStock", totalStock);
		
		try {
			service.orderCancel(orderDetailNum, updateStateMap, cancelAmountMap, updateStockMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
}
