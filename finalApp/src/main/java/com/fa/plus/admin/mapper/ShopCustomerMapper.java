package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.shop.ShopQuestion;
import com.fa.plus.admin.domain.shop.ShopReview;

@Mapper
public interface ShopCustomerMapper {
	// 상품 리뷰
	public List<ShopReview> listReview(Map<String, Object> map);
	public List<ShopReview> listReviewFile(long orderDetailNum);
	public int reviewCount(Map<String, Object> map);
	public void updateReview(ShopReview dto) throws SQLException;
	public void deleteReview(long orderDetailNum) throws SQLException;
	
	// 상품 질문
	public List<ShopQuestion> listQuestion(Map<String, Object> map);
	public List<ShopQuestion> listQuestionFile(long qnaNum);
	public int questionCount(Map<String, Object> map);
	public void updateQuestion(ShopQuestion dto) throws SQLException;
	public void deleteQuestion(long qnaNum) throws SQLException;
}
