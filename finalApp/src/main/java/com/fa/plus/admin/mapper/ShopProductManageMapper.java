package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopProductManage;

@Mapper
public interface ShopProductManageMapper {
	public long productSeq();
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
	public int findTotalStock(long stockNum);
	
	public int dataCount(Map<String, Object> map);
	public List<ShopProductManage> listBrand();
	public List<ShopProductManage> listProduct(Map<String, Object> map);
	public List<ShopProductManage> listProductFile(long productNum);
	public List<ShopProductManage> listProductOption(long productNum);
	public List<ShopProductManage> listOptionDetail(long optionNum);
	public ShopProductManage findById(long productNum);
	public List<ShopProductManage> findByHotId();
	

	public void updateProduct(ShopProductManage dto) throws SQLException;
	public void deleteProduct(long productNum) throws SQLException;
	public int updateHide(Map<String, Object> map) throws SQLException;
	public void updateOptionDetail(ShopProductManage dto) throws SQLException;
	public void deleteOptionDetail(long detailNum) throws SQLException;
	public void deleteProductFile(long fileNum) throws SQLException;
	public void updateProductOption(ShopProductManage dto) throws SQLException;
	public void deleteProductOption(long optionNum) throws SQLException;
	
	// 상품 재고
	public List<ShopProductManage> listProductStock(long productNum);
	public void insertProductStock(ShopProductManage dto) throws SQLException;
	public void updateProductStock(ShopProductManage dto) throws SQLException;
	public void deleteProductStock1(long detailNum) throws SQLException;
	public void deleteProductStock2(long detailNum) throws SQLException;
	
}
