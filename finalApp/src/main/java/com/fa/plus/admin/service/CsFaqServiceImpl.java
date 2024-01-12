package com.fa.plus.admin.service;  
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.CsFaqManage;
import com.fa.plus.admin.mapper.CsFaqManageMapper;


@Service
public class CsFaqServiceImpl implements CsFaqService {

	@Autowired
	private CsFaqManageMapper mapper;

	@Override
	public void insertFaq(CsFaqManage dto) throws Exception {
		try {
			mapper.insertFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFaq(CsFaqManage dto) throws Exception {
		try {
			mapper.updateFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<CsFaqManage> listFaq(Map<String, Object> map) {
		List<CsFaqManage> list = null;

		try {
			list = mapper.listFaq(map);
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

	@Override
	public CsFaqManage findById(long num) {
		CsFaqManage dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertCategory(CsFaqManage dto) throws Exception {
		try {
			mapper.insertCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<CsFaqManage> listCategory(Map<String, Object> map) {
		List<CsFaqManage> listCategory = null;
		
		try {
			listCategory = mapper.listCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCategory;
	}

	@Override
	public void updateCategory(CsFaqManage dto) throws Exception {
		try {
			mapper.updateCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCategory(long categoryNum) throws Exception {
		try {
			mapper.deleteCategory(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

}
