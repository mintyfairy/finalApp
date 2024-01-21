package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarQna;

public interface CarQnaService {
	public void insertCarQna(CarQna dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<CarQna> listCarQna(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<CarQna> listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(CarQna dto) throws Exception;
	
	public void deleteQuestion(long qnaNum, String pathname) throws Exception;
}
