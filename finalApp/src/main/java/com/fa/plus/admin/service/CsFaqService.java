package com.fa.plus.admin.service;  

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CsFaqManage;

public interface CsFaqService {
	public void insertFaq(CsFaqManage dto) throws Exception;
	public void updateFaq(CsFaqManage dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	
	public List<CsFaqManage> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public CsFaqManage findById(long num);
	
	public void insertCategory(CsFaqManage dto) throws Exception;
	public List<CsFaqManage> listCategory(Map<String, Object> map);
	public void updateCategory(CsFaqManage dto) throws Exception;
	public void deleteCategory(long categoryNum) throws Exception;
}
