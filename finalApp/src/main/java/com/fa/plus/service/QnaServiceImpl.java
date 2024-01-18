package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.cs.Qna;
import com.fa.plus.mapper.CsQnaMapper;


@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private CsQnaMapper mapper;

	@Override
	public void insertQna(Qna dto) throws Exception {
		try {
			mapper.insertQna(dto);
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
	public Qna findById(long num) {
		Qna dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list = mapper.listQna(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}
	
	
	

}
