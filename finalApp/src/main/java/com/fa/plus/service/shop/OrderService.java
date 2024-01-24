package com.fa.plus.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.shop.Order;

public interface OrderService {
	public String productOrderNumber();
	public void insertOrder(Order dto) throws Exception;
	
	public Order findById(long productNum);
	public List<Order> listProduct(List<Map<String, Long>> list);
	public Order findByDetailId(long detailNum);
	public List<Order> listOptionDetail(List<Long> detailNums);
	
	public void deleteCart(Map<String, Object> map) throws Exception;
	
	public int selectStock(Map<String, Long> map);
	
	public void updateStock(Map<String, Object> map) throws Exception;
}
