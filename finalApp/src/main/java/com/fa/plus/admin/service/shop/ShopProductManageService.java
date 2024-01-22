package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopProductManage;

public interface ShopProductManageService {
	public void insertProduct(ShopProductManage dto, String pathname) throws Exception;
	public void insertBrand(ShopProductManage dto) throws Exception;
	public void updateProduct(ShopProductManage dto, String pathname) throws Exception;
	public void updateProductStock(ShopProductManage dto) throws Exception;
	public void deleteProduct(long productNum, String pathname) throws Exception;
	public void deleteProductFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	public void deleteProductStock1(long detailNum) throws Exception;
	public void deleteProductStock2(long detailNum) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ShopProductManage> listBrand();
	public List<ShopProductManage> listProduct(Map<String, Object> map);
	public List<ShopProductManage> listProductFile(long productNum);
	public List<ShopProductManage> listProductOption(long productNum);
	public List<ShopProductManage> listOptionDetail(long optionNum);
	public List<ShopProductManage> listProductStock(long productNum);
	
	public ShopProductManage findById(long productNum);
	public int findTotalStock(long stockNum);
	public List<ShopProductManage> findByHotId();
	
	// 상품 상위 카테고리 목록
	public ShopProductManage findByCategory(long categoryNum);
	public List<ShopProductManage> listCategory();
	public List<ShopProductManage> listSubCategory(long parentNum);
	
	public void updateHide(Map<String, Object> map) throws Exception;
	
	
	
	
}
