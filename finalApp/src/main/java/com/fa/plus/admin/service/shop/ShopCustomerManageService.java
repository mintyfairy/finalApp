package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.shop.ShopQuestion;
import com.fa.plus.admin.domain.shop.ShopReview;

public interface ShopCustomerManageService {
	// 리뷰 관리
	public List<ShopReview> listReview(Map<String, Object> map);
	public int reviewCount(Map<String, Object> map);
	public void updateReview(Map<String, Object> map) throws Exception;
	public void deleteReview(long orderDetailNum, String pathname) throws Exception;
	
	// qna 관리
	public List<ShopQuestion> listQuestion(Map<String, Object> map);
	public int questionCount(Map<String, Object> map);
	public void updateQuestion(Map<String, Object> map) throws Exception;
	public void deleteQuestion(long qnaNum, String pathname) throws Exception;
}
