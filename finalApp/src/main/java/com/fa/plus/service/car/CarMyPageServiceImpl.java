package com.fa.plus.service.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.car.CarMyPage;
import com.fa.plus.mapper.CarMyPageMapper;

@Service
public class CarMyPageServiceImpl implements CarMyPageService {
	@Autowired
	private CarMyPageMapper mapper;

	@Override
	public void insertRider(CarMyPage dto) throws Exception {
		try {
			mapper.insertRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateRider(CarMyPage dto) throws Exception {
		try {
			mapper.updateRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CarMyPage riderInfo(String userId) {
		CarMyPage dto = null;
		
		try {
			dto = mapper.riderInfo(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
}
