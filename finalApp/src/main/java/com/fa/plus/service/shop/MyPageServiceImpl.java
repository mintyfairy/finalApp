package com.fa.plus.service.shop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.shop.Order;
import com.fa.plus.domain.shop.Payment;
import com.fa.plus.mapper.MyPageMapper;
import com.fa.plus.state.OrderState;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;

	@Override
	public int countPayment(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.countPayment(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Payment> listPayment(Map<String, Object> map) {
		List<Payment> list = null;

		try {
			String productState;

			list = mapper.listPayment(map);

			Date endDate = new Date();
			long gap;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			for (Payment dto : list) {
				dto.setOrderDate(dto.getOrderDate().replaceAll("-", ".").substring(5, 10));
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
				dto.setDetailStateInfo(OrderState.DETAILSTATEINFO[dto.getDetailState()]);

				productState = OrderState.ORDERSTATEINFO[dto.getOrderState()];
				if (dto.getDetailState() > 0) {
					productState = OrderState.DETAILSTATEINFO[dto.getDetailState()];
				}
				dto.setStateProduct(productState);

				// 배송 완료후 지난 일자
				if (dto.getOrderState() == 5 && dto.getStateDate() != null) {
					Date beginDate = formatter.parse(dto.getStateDate());
					gap = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
					dto.setAfterDelivery(gap);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {
			mapper.updateOrderDetailState(map);

			mapper.insertDetailStateInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateOrderHistory(long orderDetailNum) throws Exception {
		try {
			mapper.updateOrderHistory(orderDetailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCart(Order dto) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", dto.getUserId());
		map.put("memberIdx", dto.getMemberIdx());

		try {
			for (int i = 0; i < dto.getProductNums().size(); i++) {
				map.put("detailNum2", dto.getDetailNums2().get(i));

				dto.setProductNum(dto.getProductNums().get(i));
				dto.setDetailNum(dto.getDetailNums().get(i));
				dto.setDetailNum2(dto.getDetailNums2().get(i));
				dto.setQty(dto.getBuyQtys().get(i));
				
				if(mapper.findByCartId(map) == null) {
					mapper.insertCart(dto);
				} else {
					mapper.updateCart(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Order> listCart(String userId) {
		List<Order> list = null;
		
		try {
			list = mapper.listCart(userId);
			
			for(Order dto : list) {
				int discountPrice = 0;
				if(dto.getDiscountRate() > 0) {
					discountPrice = (int)(dto.getPrice() * (dto.getDiscountRate()/100.0));
					dto.setDiscountPrice(discountPrice);
				}
				
				dto.setSalePrice(dto.getPrice() - discountPrice);
				dto.setProductMoney(dto.getSalePrice() * dto.getQty());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
