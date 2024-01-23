package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.car.CampingCar;

public interface CampingCarService {
	public int dataCount(Map<String, Object> map);
	public List<CampingCar> listCampingCar(Map<String, Object> map);
	
	public CampingCar findById(long carNum);
	public List<CampingCar> listCarFile(long carNum);
	
	public List<CampingCar> listOption(long carNum);

}
