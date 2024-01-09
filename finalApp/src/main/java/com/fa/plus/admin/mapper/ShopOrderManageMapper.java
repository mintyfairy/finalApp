package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopOrderManage;

@Mapper
public interface ShopOrderManageMapper {
	public List<ShopOrderManage> listOrder(Map<String, Object> map);
	public List<ShopOrderManage> listOrderDetail(Map<String, Object> map);
	
	public ShopOrderManage findById(long orderNum);
	public List<ShopOrderManage> findByOrderDetails(long orderNum);
	
	public int orderCount(Map<String, Object> map);
	public int orderDetailCount(Map<String, Object> map);
	
	public void updateOrderState(Map<String, Object> map) throws SQLException;
}
