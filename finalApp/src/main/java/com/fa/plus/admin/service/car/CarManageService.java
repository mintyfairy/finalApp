package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.car.CampingCar;

public interface CarManageService {
	public void insertCar(CampingCar dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<CampingCar> listCar(Map<String, Object> map);
	
	public void updateHitCount(long carNum) throws Exception;
	
}
