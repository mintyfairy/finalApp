package com.fa.plus.admin.mapper.shop;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopProductManage;

@Mapper
public interface ShopProductManageMapper {
	public void insertProduct(ShopProductManage dto) throws SQLException;
	public void insertProductFile(ShopProductManage dto) throws SQLException;
	
	public long optionSeq();
	public void insertProductOption(ShopProductManage dto) throws SQLException;
	
	public long detailSeq();
	public void insertOptionDetail(ShopProductManage dto) throws SQLException;
	
	
}
