package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopOrderDetailManage;
import com.fa.plus.admin.domain.shop.ShopOrderManage;

public interface ShopOrderManageService {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
	public List<ShopOrderManage> listOrderDetail(Map<String, Object> map);
	public List<ShopOrderDetailManage> orderDetails(long orderNum);
	
	public ShopOrderManage findById(long orderNum);
//	public List<ShopOrderManage> findByOrderDetails(long orderNum);
	
	public int orderCount(Map<String, Object> map);
	public int orderDetailCount(Map<String, Object> map);
	public int selectTotalStock(Map<String, Object> map);
	
	public List<Map<String, Object>> listDeliveryCompany();
	
	public void updateOrder(String mode, Map<String, Object> map) throws Exception;
	public void orderCancel(long orderDetailNum, 
			Map<String, Object> cancelAmountMap, Map<String, Object> updateStockMap, 
			Map<String, Object> updateDetailStateMap) throws Exception;
	
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum);
	public void updateOrderDetailState(Map<String, Object> map) throws Exception;
}
