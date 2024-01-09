package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopOrderManage;

public interface ShopOrderManageService {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
	public List<ShopOrderManage> listOrderDetail(Map<String, Object> map);
	
	public ShopOrderManage findById(long orderNum);
	public List<ShopOrderManage> findByOrderDetails(long orderNum);
	
	public int orderCount(Map<String, Object> map);
	public int orderDetailCount(Map<String, Object> map);
}
