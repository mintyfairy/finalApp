package com.fa.plus.admin.service; 
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.CsQnaManage;
import com.fa.plus.admin.mapper.CsQnaManageMapper;

@Service
public class CsQnaServiceImpl implements CsQnaService{
	@Autowired
	private CsQnaManageMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<CsQnaManage> listQna(Map<String, Object> map) {
		List<CsQnaManage> list = null;

		try {
			list = mapper.listQna(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CsQnaManage findById(long num) {
		CsQnaManage dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateAnswer(CsQnaManage dto) throws Exception {
		try {
			mapper.updateAnswer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(long num) throws Exception {
		try {
			mapper.deleteAnswer(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQna(long num) throws Exception {
		try {
			mapper.deleteQna(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

}
