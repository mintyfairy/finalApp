package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.cs.Qna;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception;
	public void deleteQna(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	
	public Qna findById(long num);

}
