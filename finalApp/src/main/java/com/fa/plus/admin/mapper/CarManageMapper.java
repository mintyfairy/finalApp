package com.fa.plus.admin.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.car.CampingCar;

@Mapper
public interface CarManageMapper {
	public long carNumseq();
	public void insertCar(CampingCar dto) throws SQLException;
	public void insertCarDetail(CampingCar dto) throws SQLException;
	public void insertCarOption(CampingCar dto) throws SQLException;
	public void insertImageFile(CampingCar dto) throws SQLException;
	
	
}
