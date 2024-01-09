package com.fa.plus.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.shop.Order;
import com.fa.plus.domain.shop.Payment;

public interface MyPageService {
	public int countPayment(Map<String, Object> map);
	public List<Payment> listPayment(Map<String, Object> map);
	
	public void updateOrderDetailState(Map<String, Object> map) throws Exception;
	public void updateOrderHistory(long orderDetailNum) throws Exception;
	
	public void insertCart(Order dto) throws Exception;
	public List<Order> listCart(String userId);
	public void deleteCart(Map<String, Object> map) throws Exception;
}
