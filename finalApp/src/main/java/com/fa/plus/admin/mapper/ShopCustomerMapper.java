package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.Review;

@Mapper
public interface ShopCustomerMapper {
	// 상품 리뷰
	public List<Review> listReview(Map<String, Object> map);
	public List<Review> listReviewFile(long orderDetailNum);
	public int dataCount(Map<String, Object> map);
	public void updateReview(Review dto) throws SQLException;
	public void deleteReview(long orderDetailNum);
	
	// 상품 질문
	
}
