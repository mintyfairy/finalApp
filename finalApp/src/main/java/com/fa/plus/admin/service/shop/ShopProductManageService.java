package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopProductManage;

public interface ShopProductManageService {
	public void insertProduct(ShopProductManage dto, String pathname) throws Exception;
	public void insertBrand(ShopProductManage dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ShopProductManage> listBrand();
	public List<ShopProductManage> listProduct(Map<String, Object> map);
	public List<ShopProductManage> listProductFile(long productNum);
	public List<ShopProductManage> listProductOption(long productNum);
	public List<ShopProductManage> listOptionDetail(long optionNum);
	
	public ShopProductManage findById(long productNum);
	
	// 상품 상위 카테고리 목록
	public ShopProductManage findByCategory(long categoryNum);
	public List<ShopProductManage> listCategory();
	public List<ShopProductManage> listSubCategory(long parentNum);
	
	public void updateHide(Map<String, Object> map);
}
