package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.Review;

public interface ShopCustomerManageService {
	public List<Review> listReview(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
