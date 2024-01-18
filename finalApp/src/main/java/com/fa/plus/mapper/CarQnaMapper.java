package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.car.CarQna;

@Mapper
public interface CarQnaMapper {
	public void insertCarQna(CarQna dto) throws SQLException;
	public void insertCarQnaFile(CarQna dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<CarQna> listCarQna(Map<String, Object> map);
	
	public List<CarQna> listQnaFile(long qnaNum);
	
}
