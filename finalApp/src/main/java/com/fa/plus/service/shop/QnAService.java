package com.fa.plus.service.shop;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.shop.QnA;

public interface QnAService {
public void insertQuestion(QnA dto, String pathname) throws Exception;

	public int dataCount(Map<String, Object> map);
	public List<QnA>listQuestion(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<QnA>listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(QnA dto) throws Exception;
	
	public void deleteQuestion(long qnaNum, String pathname) throws Exception;
}
