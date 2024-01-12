package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.car.CampingCar;

@Mapper
public interface CarManageMapper {
	public long carNumseq();
	public void insertCar(CampingCar dto) throws SQLException;
	public void insertCarDetail(CampingCar dto) throws SQLException;
	public void insertCarOption(CampingCar dto) throws SQLException;
	public void insertImageFile(CampingCar dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<CampingCar> listCar(Map<String, Object> map);
	
	public void updateHitCount(long carNum) throws SQLException;
	
	public List<CampingCar> listCarFile(long carNum);
	public List<CampingCar> listCarDetail(long carNum);
	public List<CampingCar> listCarOption(long carNum);
	
	public CampingCar findById(long carNum);
	
	public void updateCar(CampingCar dto) throws SQLException;
	public void updateCarDetail(CampingCar dto) throws SQLException;
	public void updateCarOption(CampingCar dto) throws SQLException;
	
	public void deleteCar(long carNum) throws SQLException;
	public void deleteCarFile(long carImagenum) throws SQLException;
	
}
