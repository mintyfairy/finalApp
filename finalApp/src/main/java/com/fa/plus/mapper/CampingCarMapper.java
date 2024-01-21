package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.car.CampingCar;

@Mapper
public interface CampingCarMapper {
	
	public int dataCount(Map<String, Object> map) throws SQLException;
	public List<CampingCar> listCampingCar(Map<String, Object> map) throws SQLException;
	
	public CampingCar findById(long carNum);
	public List<CampingCar> listCarFile(long carNum);
	
	public List<CampingCar> listOption(long carNum);
	
}
