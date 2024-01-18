package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CarQna;

public interface CarQnaService {
	public void insertCarQna(CarQna dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<CarQna> listCarQna(Map<String, Object> map);

}
