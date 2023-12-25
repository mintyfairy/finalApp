package com.fa.plus.admin.service.shop;

import java.util.List;

import com.fa.plus.admin.domain.shop.ShopProductManage;

public interface ShopProductManageService {
	public void insertProduct(ShopProductManage dto, String pathname) throws Exception;
	public void insertBrand(ShopProductManage dto) throws Exception;
	
	public List<ShopProductManage> listCategory();
	public List<ShopProductManage> listSubCategory(long parentNum);
	
	public List<ShopProductManage> listBrand();
}
