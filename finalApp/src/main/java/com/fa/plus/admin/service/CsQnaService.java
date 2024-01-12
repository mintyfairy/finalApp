package com.fa.plus.admin.service;
 
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CsQnaManage;
 
public interface CsQnaService {
	public int dataCount(Map<String, Object> map);
	public List<CsQnaManage> listQna(Map<String, Object> map);
	
	public CsQnaManage findById(long num);
	
	public void updateAnswer(CsQnaManage dto) throws Exception;
	public void deleteAnswer(long num) throws Exception;
	public void deleteQna(long num) throws Exception;
}
