package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.car.CampingCar;

public interface CarManageService {
	public void insertCar(CampingCar dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<CampingCar> listCar(Map<String, Object> map);
	
	public void updateHitCount(long carNum) throws Exception;
	
	public List<CampingCar> listCarFile(long carNum);
	
	public CampingCar findById(long carNum);
	
	public void updateCar(CampingCar dto, String pathname) throws Exception;
	public void updateCarDetail(CampingCar dto, String pathname) throws Exception;
	public void updateCarOption(CampingCar dto, String pathname) throws Exception;
	
	public void deleteCar(long cartNum, String pathname) throws Exception;
	public void deleteCarFile(long carImagenum, String pathname) throws Exception;
	
}
