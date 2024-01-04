package com.fa.plus.mapper.car;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.car.CampingCar;

@Mapper
public interface CampingCarMapper {
	
	public List<CampingCar> listCampingCar(Map<String, Object> map) throws SQLException;
	public int dataCount(Map<String, Object> map) throws SQLException;
	public CampingCar findById(long carNum) throws SQLException;
	
}
