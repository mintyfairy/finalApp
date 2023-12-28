package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	public void insertBrand(ShopProductManage dto) throws SQLException;
	
	public ShopProductManage findByCategory(long categoryNum);
	public List<ShopProductManage> listCategory();
	public List<ShopProductManage> listSubCategory(long parentNum);
	
	public List<ShopProductManage> listBrand();
	
	public List<ShopProductManage> listProduct(Map<String, Object> map);
	
	
}
