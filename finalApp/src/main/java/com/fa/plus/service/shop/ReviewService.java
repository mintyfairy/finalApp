package com.fa.plus.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.shop.Review;
import com.fa.plus.domain.shop.Summary;

public interface ReviewService {
public void insertReview(Review dto, String pathname) throws Exception;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<Review>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<Review>listReview2(Map<String, Object> map);
	
	public void updateReview(Review dto) throws Exception;
	
	public void deleteReview(long orderDetailNum, String pathname) throws Exception;
}
