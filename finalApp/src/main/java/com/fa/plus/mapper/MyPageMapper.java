package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.shop.Order;
import com.fa.plus.domain.shop.Payment;

@Mapper
public interface MyPageMapper {
	public int countPayment(Map<String, Object> map);
	public List<Payment> listPayment(Map<String, Object> map);

	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;
	public void updateOrderHistory(long orderDetailNum) throws SQLException;

	public void insertDetailStateInfo(Map<String, Object> map) throws SQLException;
	public void insertCart(Order dto) throws SQLException;
	public void updateCart(Order dto) throws SQLException;
	public Order findByCartId(Map<String, Object> map);
	public List<Order> listCart(String userId);
	public void deleteCart(Map<String, Object> map) throws SQLException;
	public void deleteCartExpiration() throws SQLException;
}
