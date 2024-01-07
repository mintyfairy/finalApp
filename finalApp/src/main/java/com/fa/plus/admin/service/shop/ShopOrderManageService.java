package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopOrderManage;

public interface ShopOrderManageService {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
}
