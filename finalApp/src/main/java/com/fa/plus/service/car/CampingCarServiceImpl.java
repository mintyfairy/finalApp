package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.car.CampingCar;
import com.fa.plus.mapper.CampingCarMapper;

@Service
public class CampingCarServiceImpl implements CampingCarService {
	
	@Autowired
	private CampingCarMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<CampingCar> listCampingCar(Map<String, Object> map) {
		List<CampingCar> list = null;
		
		try {
			list = mapper.listCampingCar(map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public CampingCar findById(long carNum) {
		CampingCar dto = null;
		
		try {
			dto = mapper.findById(carNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<CampingCar> listCarFile(long carNum) {
		List<CampingCar> list = null;
		
		try {
			list = mapper.listCarFile(carNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

}
