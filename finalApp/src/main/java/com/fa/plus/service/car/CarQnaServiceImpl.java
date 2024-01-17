package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.car.CarQna;
import com.fa.plus.mapper.CarQnaMapper;

@Service
public class CarQnaServiceImpl implements CarQnaService {
	@Autowired
	private CarQnaMapper mapper;

	@Override
	public void insertCarQna(CarQna dto) throws Exception {
		try {
			mapper.insertCarQna(dto);
			
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
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CarQna> listCarQna(Map<String, Object> map) {
		List<CarQna> list = null;
		
		try {
			list = mapper.listCarQna(map);
			
			String s;
			
			for(CarQna dto : list) {
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
	
	
	
}