package com.fa.plus.admin.service.car;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.CarAdminReservationMapper;

@Service
public class CarAdminReservationServiceImpl implements CarReservationService {
	@Autowired
	private CarAdminReservationMapper mapper;

	@Override
	public Map<String, Object> todayReservation() {
		Map<String, Object> resultMap = null;
		try {
			resultMap = mapper.todayReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> monthSales() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> yearSales() {
		// TODO Auto-generated method stub
		return null;
	} 
}
