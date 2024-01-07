package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopOrderManage;

@Mapper
public interface ShopOrderManageMapper {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
}
