package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.shop.ShopOrderManage;
import com.fa.plus.admin.mapper.ShopOrderManageMapper;

@Service
public class ShopOrderManageServiceImpl implements ShopOrderManageService {
	@Autowired
	private ShopOrderManageMapper mapper;

	@Override
	public List<ShopOrderManage> listOrder(Map<String, Object> map) {
		List<ShopOrderManage> list = null;
		
		try {
			list = mapper.listOrder(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int orderCount(Map<String, Object> map) {
		int result = 0;
		try {
			mapper.orderCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public ShopOrderManage findById(long orderNum) {
		ShopOrderManage dto = null;
		
		try {
			mapper.findById(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
