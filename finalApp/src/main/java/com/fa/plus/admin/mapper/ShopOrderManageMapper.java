package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopOrderDetailManage;
import com.fa.plus.admin.domain.shop.ShopOrderManage;

@Mapper
public interface ShopOrderManageMapper {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
	public List<ShopOrderManage> listOrderDetail(Map<String, Object> map);
	
	public ShopOrderManage findById(long orderNum);
	public List<ShopOrderDetailManage> findByOrderDetails(long orderNum);
	
	public int orderCount(Map<String, Object> map);
	public int orderDetailCount(Map<String, Object> map);
	public int selectTotalStock(Map<String, Object> map);
	public int totalOrderCount(long orderNum);
	
	public void updateOrderState(Map<String, Object> map) throws SQLException;
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;
	
	public List<Map<String, Object>> listDeliveryCompany();
	
	public void updateOrderInvoiceNumber(Map<String, Object> map);
	
	public void updateCancelAmount(Map<String, Object> map);
	public void updateProductStock(Map<String, Object> map);
	public void orderDetailCancel(long orderDetailNum);
	
	public void insertDetailStateInfo(Map<String, Object> map) throws SQLException;
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum);
}
