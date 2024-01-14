package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.shop.Review;
import com.fa.plus.admin.mapper.ShopCustomerMapper;

@Service
public class ShopCustomerManageServiceImpl implements ShopCustomerManageService {
	@Autowired
	private ShopCustomerMapper mapper;

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = mapper.listReview(map);
			
			for(Review dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(","));
				}
				
				dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
