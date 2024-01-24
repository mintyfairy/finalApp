package com.fa.plus.controller.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.shop.Order;
import com.fa.plus.service.MemberService;
import com.fa.plus.service.shop.OrderService;

@Controller
@RequestMapping("/shop/order/*")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("main")
	public String mainForm(@RequestParam List<Long> productNums,
							  @RequestParam List<Long> detailNums,
							  @RequestParam List<Long> detailNums2, 
							  @RequestParam List<Integer> buyQtys,
							  @RequestParam(defaultValue = "buy") String mode, 
							  HttpSession session, Model model) throws Exception {

		Map<String, Object> stockMap = new HashMap<String, Object>();
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Member orderUser = memberService.findById(info.getMemberIdx());

			String productOrderNumber = null; // 주문 번호
			String productOrderName = ""; // 주문상품번호
			int totalMoney = 0; // 상품합
			int deliveryCharge = 0; // 배송비
			int payment = 0; // 결제할 금액(상품합 + 배송비)
			int totalSavedMoney = 0; // 적립금 총합
			int totalDiscountPrice = 0; // 총 할인액
			int totalStock = 0;

			productOrderNumber = orderService.productOrderNumber();

			List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
			for (int i = 0; i < detailNums.size(); i++) {
				Map<String, Long> map = new HashMap<String, Long>();
				map.put("detailNum", detailNums.get(i));
				map.put("detailNum2", detailNums2.get(i));
				totalStock = (int)orderService.selectStock(map);
				totalStock -= buyQtys.get(i);
				stockMap.put("detailNum", detailNums.get(i));
				stockMap.put("detailNum2", detailNums2.get(i));
				stockMap.put("totalStock", totalStock);
				orderService.updateStock(stockMap);
				list.add(map);
			}

			List<Order> listProduct = orderService.listProduct(list);
			for (int i = 0; i < listProduct.size(); i++) {
				Order dto = listProduct.get(i);

				dto.setQty(buyQtys.get(i));
				dto.setProductMoney(buyQtys.get(i) * dto.getSalePrice());

				totalSavedMoney += (buyQtys.get(i) * dto.getSavedMoney());
				dto.setSavedMoney(buyQtys.get(i) * dto.getSavedMoney());

				totalMoney += buyQtys.get(i) * dto.getSalePrice();
				totalDiscountPrice += buyQtys.get(i) * dto.getDiscountPrice();
				if (i == 0 || deliveryCharge > dto.getDelivery()) {
					deliveryCharge = dto.getDelivery();
				}
			}

			productOrderName = listProduct.get(0).getProductName();
			if (listProduct.size() > 1) {
				productOrderName += " 외 " + (listProduct.size() - 1) + " 건 ";
			}

			deliveryCharge = totalMoney >= 50000 ? 0 : deliveryCharge;
			payment = totalMoney + deliveryCharge;

			model.addAttribute("productOrderNumber", productOrderNumber); // 주문 번호
			model.addAttribute("orderUser", orderUser); // 주문 유저
			model.addAttribute("productOrderName", productOrderName); // 주문 상품명

			model.addAttribute("listProduct", listProduct);
			model.addAttribute("totalMoney", totalMoney); // 총금액 (수량*할인가격 의 합)
			model.addAttribute("payment", payment); // 결제할 금액
			model.addAttribute("totalSavedMoney", totalSavedMoney); // 총 적림예정액
			model.addAttribute("totalDiscountPrice", totalDiscountPrice); // 할인 총액
			model.addAttribute("deliveryCharge", deliveryCharge); // 배송비

			model.addAttribute("mode", mode); // 바로구매인지 장바구니 구매인지를 가지고 있음

			return ".shop.order.main";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

	@PostMapping("paymentOk")
	public String paymentSubmit(Order dto, @RequestParam(defaultValue = "buy") String mode, RedirectAttributes reAttr,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setMemberIdx(info.getMemberIdx());
			orderService.insertOrder(dto);

			if (mode.equals("cart")) {
				// 구매 상품에 대한 장바구니 비우기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "list");
				map.put("userId", info.getUserId());
				map.put("list", dto.getDetailNums2());

				orderService.deleteCart(map);
			}

			String p = String.format("%,d", dto.getPayment());

			StringBuilder sb = new StringBuilder();
			sb.append(info.getUserName() + "님 상품을 구매해 주셔서 감사 합니다.<br>");
			sb.append("구매 하신 상품의 결제가 정상적으로 처리되었습니다.<br>");
			sb.append("결제 금액 : <label class='fs-5 fw-bold text-primary'>" + p + "</label>원");

			reAttr.addFlashAttribute("title", "상품 결제 완료");
			reAttr.addFlashAttribute("message", sb.toString());

			return "redirect:/shop/order/complete";
		} catch (Exception e) {
		}
		return "redirect:/";
	}

	@GetMapping("complete")
	public String complete(@ModelAttribute("title") String title,
				@ModelAttribute("message") String message
				) throws Exception {
		
		if (message == null || message.length() == 0) {
			return "redirect:/";
		}

		return ".shop.order.complete";
	}
}
