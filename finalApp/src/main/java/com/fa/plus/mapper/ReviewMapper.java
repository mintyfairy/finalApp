package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.shop.Review;
import com.fa.plus.domain.shop.Summary;

@Mapper
public interface ReviewMapper {
	public void insertReview(Review dto) throws SQLException;
	public void insertReviewFile(Review dto) throws SQLException;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<Review>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<Review>listReview2(Map<String, Object> map);
	
	public void updateReview(Review dto) throws SQLException; 
	
	public List<Review>listReviewFile(long orderDetailNum);
	public void deleteReview(long orderDetailNum) throws SQLException;
}
