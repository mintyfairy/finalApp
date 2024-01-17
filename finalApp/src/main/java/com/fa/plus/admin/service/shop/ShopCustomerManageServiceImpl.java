package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.shop.ShopQuestion;
import com.fa.plus.admin.domain.shop.ShopReview;
import com.fa.plus.admin.mapper.ShopCustomerMapper;
import com.fa.plus.common.FileManager;

@Service
public class ShopCustomerManageServiceImpl implements ShopCustomerManageService {
	@Autowired
	private ShopCustomerMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<ShopReview> listReview(Map<String, Object> map) {
		List<ShopReview> list = null;
		
		try {
			list = mapper.listReview(map);
			
			for(ShopReview dto : list) {
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
	public int reviewCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.reviewCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ShopQuestion> listQuestion(Map<String, Object> map) {
		List<ShopQuestion> list = null;
		
		try {
			list = mapper.listQuestion(map);
			
			String s;
			for (ShopQuestion dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
				s = dto.getUserName().substring(0, 1);
				if(dto.getUserName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getUserName().substring(2, dto.getUserName().length()).replaceAll(".", "*");
				}
				s += dto.getUserName().substring(dto.getUserName().length()-1);
				dto.setUserName(s);
				
				dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
				
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
	public int questionCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.questionCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteQuestion(long qnaNum, String pathname) throws Exception {
		try {
			List<ShopQuestion> listFile = mapper.listQuestionFile(qnaNum);
			if(listFile != null) {
				for (ShopQuestion dto : listFile) {
					fileManager.doFileDelete(dto.getFilename(), pathname);
				}
			}
			
			mapper.deleteQuestion(qnaNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
